"""Parse Windows Recycle Bin $I metadata files to recover original paths.

$I files: header(8) + fileSize(8) + deletionTime(FILETIME,8) + pathLength(4)
          + originalPath(UTF-16LE)
"""
import struct
import sys
from pathlib import Path

RB = Path(r"D:\$Recycle.Bin\S-1-5-21-1662305326-661857706-379272382-1001")


def parse_i(path: Path):
    try:
        raw = path.read_bytes()
    except Exception:
        return None
    if len(raw) < 28:
        return None
    ver = struct.unpack_from("<Q", raw, 0)[0]
    try:
        size = struct.unpack_from("<Q", raw, 8)[0]
        ft = struct.unpack_from("<Q", raw, 16)[0]
        # FILETIME -> unix seconds
        ts = (ft / 10_000_000) - 11644473600 if ft else 0
        if ver == 2:
            nchars = struct.unpack_from("<I", raw, 24)[0]
            orig = raw[28:28 + nchars * 2].decode("utf-16-le", errors="replace")
        else:
            orig = raw[24:].decode("utf-16-le", errors="replace").rstrip("\x00")
        return {"size": size, "ts": ts, "orig": orig}
    except Exception:
        return None


def main():
    ents = []
    for i in RB.glob("$I*"):
        meta = parse_i(i)
        if not meta:
            continue
        data_name = "$R" + i.name[2:]
        data = RB / data_name
        actual = data.stat().st_size if data.exists() else 0
        ents.append((meta["ts"], meta["size"], actual, meta["orig"], data_name))

    ents.sort(reverse=True)
    flt = None
    if len(sys.argv) > 1:
        flt = sys.argv[1].lower()

    total = 0
    n = 0
    for ts, size, actual, orig, dname in ents:
        if flt and flt not in orig.lower():
            continue
        n += 1
        total += actual
        import datetime
        when = datetime.datetime.fromtimestamp(ts).strftime("%Y-%m-%d %H:%M:%S") if ts else "?"
        print(f"{when}  {actual:>12,}B  {orig}")
    print(f"\nmatched {n} entries, {total:,} bytes ({total/1024/1024:.1f} MiB)")


if __name__ == "__main__":
    main()