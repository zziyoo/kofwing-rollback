"""Locate the $R data counterpart for each $I entry and report whether the payload survives."""
import datetime
import struct
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
        ts = (ft / 10_000_000) - 11644473600 if ft else 0
        if ver == 2:
            n = struct.unpack_from("<I", raw, 24)[0]
            orig = raw[28:28 + n * 2].decode("utf-16-le", errors="replace")
        else:
            orig = raw[24:].decode("utf-16-le", errors="replace").rstrip("\x00")
        return {"size": size, "ts": ts, "orig": orig}
    except Exception:
        return None


rows = []
for i in RB.glob("$I*"):
    m = parse_i(i)
    if not m:
        continue
    data = RB / ("$R" + i.name[2:])
    exists = data.exists()
    isdir = data.is_dir() if exists else False
    if isdir:
        nfiles = sum(1 for p in data.rglob("*") if p.is_file())
        tot = sum(p.stat().st_size for p in data.rglob("*") if p.is_file())
        desc = f"DIR  {nfiles} files, {tot/1024/1024:.1f} MiB"
    elif exists:
        desc = f"FILE {data.stat().st_size/1024/1024:.2f} MiB"
    else:
        desc = "PAYLOAD MISSING (already restored or purged)"
    when = datetime.datetime.fromtimestamp(m["ts"]).strftime("%H:%M:%S") if m["ts"] else "?"
    rows.append((m["ts"], when, m["orig"], exists, desc, data.name))

rows.sort(reverse=True)
print(f"{'time':<9} {'payload?':<9} {'what'}")
for ts, when, orig, exists, desc, dname in rows:
    print(f"{when:<9} {'YES' if exists else 'no':<9} {desc}")
    print(f"          orig: {orig}")