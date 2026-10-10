"""Programmatic SWF fixture builders.

Every fixture here is written from raw bytes so the test suite stays tiny and
self-contained. Nothing is copied out of the game tree.
"""
from __future__ import annotations

import lzma
import struct
import zlib

# A tag header is a u16: code in the top 10 bits, length in the low 6 bits.
# 0x3F in the low bits means "a u32 length follows".
LONG_LENGTH = 0x3F


def tag(code: int, payload: bytes = b"") -> bytes:
    """Encode one SWF tag record."""
    if len(payload) < LONG_LENGTH:
        return struct.pack("<H", (code << 6) | len(payload)) + payload
    return struct.pack("<H", (code << 6) | LONG_LENGTH) + struct.pack("<I", len(payload)) + payload


def rect(nbits: int = 0) -> bytes:
    """A RECT. With nbits=0 this is the single byte 0x00 - a zero-size stage."""
    if nbits == 0:
        return b"\x00"
    raise NotImplementedError("only the zero-extent RECT is needed by these tests")


def movie_body(tags: bytes, frame_rate: float = 8.0, frames: int = 1) -> bytes:
    """RECT + framerate + frame count + a tag stream."""
    framerate_raw = int(round(frame_rate * 256))
    return rect() + struct.pack("<H", framerate_raw) + struct.pack("<H", frames) + tags


DEFAULT_TAGS = (
    tag(9, b"\x00\x00\x00")          # SetBackgroundColor
    + tag(2, b"\x00" * 9)            # DefineShape
    + tag(12, b"\x00")               # DoAction
    + tag(1)                          # ShowFrame
    + tag(0)                          # End
)


def fws(tags: bytes = DEFAULT_TAGS, version: int = 8, declared: int | None = None) -> bytes:
    """An uncompressed, structurally valid SWF."""
    body = movie_body(tags)
    return b"FWS" + bytes([version]) + struct.pack("<I", declared if declared is not None else len(body) + 8) + body


def cws(tags: bytes = DEFAULT_TAGS, version: int = 6) -> bytes:
    """A zlib-compressed SWF.

    Per the SWF spec FileLength counts the *decompressed* size, so the declared
    value legitimately disagrees with the on-disk size - exactly the situation the
    real corpus is in, and exactly what swf_struct must treat as a warning only.
    """
    body = movie_body(tags)
    packed = zlib.compress(body, 9)
    return b"CWS" + bytes([version]) + struct.pack("<I", len(body) + 8) + packed


def zws(tags: bytes = DEFAULT_TAGS, version: int = 15) -> bytes:
    """An LZMA-compressed SWF (the signature the boot movie uses)."""
    body = movie_body(tags)
    alone = lzma.compress(body, format=lzma.FORMAT_ALONE)
    props, data = alone[:5], alone[13:]
    payload = struct.pack("<I", len(data)) + props + data
    return b"ZWS" + bytes([version]) + struct.pack("<I", len(body) + 8) + payload


def no_end_tag_candidate(version: int = 4) -> bytes:
    """A false positive: a real SWF signature wrapping a tag stream that never ends.

    This mirrors the shape the toolchain actually rejects in the game corpus -
    a tag that declares far more bytes than remain, so the walk can never reach an
    End tag. See reports/_struct.json, e.g. kofwing/27969957.swf.
    """
    body = rect() + struct.pack("<H", 2048) + struct.pack("<H", 1)
    body += tag(596, b"")              # unknown tag id, present in the real artefact
    body += struct.pack("<H", (596 << 6) | LONG_LENGTH) + struct.pack("<I", 2_128_240_566)
    body += b"\x00" * 64               # only a little data actually follows
    return b"FWS" + bytes([version]) + struct.pack("<I", len(body) + 8) + body


def truncated_valid_swf(version: int = 8) -> bytes:
    """A file whose header is perfect but whose body stops mid-tag-stream."""
    full = fws(version=version)
    return full[: len(full) - 12]


def garbage(version: int = 15) -> bytes:
    """Not a SWF at all: a valid length field followed by random-looking bytes."""
    return b"GFX/" + bytes([version]) + struct.pack("<I", 4096) + bytes(range(256)) * 4


def too_small() -> bytes:
    """Shorter than the 8-byte SWF header."""
    return b"FWS\x08"


def stale_length_swf(pad: int = 512) -> bytes:
    """A valid SWF whose FileLength field overstates its real size by ``pad``."""
    body = movie_body(DEFAULT_TAGS)
    return b"FWS" + bytes([8]) + struct.pack("<I", len(body) + 8 + pad) + body


ALL_FIXTURES = {
    "plain_fws.swf": fws(),
    "compressed_cws.swf": cws(),
    "lzma_zws.swf": zws(),
    "stale_length.swf": stale_length_swf(),
    "false_positive_no_end.swf": no_end_tag_candidate(),
    "truncated.swf": truncated_valid_swf(),
    "garbage.swf": garbage(),
    "toosmall.swf": too_small(),
}