import os
import struct

p = r"D:\拳皇\拳皇WingEX1.2前瞻版\wingex1.2.exe"
sz = os.path.getsize(p)
print("EXE size:", sz)

offsets = [6148152, 6230976, 6235248, 7298128, 8492959, 11480055, 16695748,
           18464326, 20817874, 21256864, 27969957]
with open(p, "rb") as f:
    for off in offsets:
        if off >= sz:
            print(f"off={off}: BEYOND EOF")
            continue
        f.seek(off)
        b = f.read(16)
        sig = b[:3].decode("latin-1")
        mark = ""
        if b[:3] in (b"FWS", b"CWS", b"ZWS"):
            mark = f"ver={b[3]} declared={struct.unpack_from('<I', b, 4)[0]:,}"
        print(f"off={off:>12,}  bytes={b[:8].hex(' ')}  sig={sig!r}  {mark}")

print()
print("--- residual bytes after each embedded SWF (using extracted file sizes) ---")
base = r"D:\拳皇\拳皇WingEX1.2前瞻版\kofwing"
for name in sorted(os.listdir(base)):
    if not name.lower().endswith(".swf"):
        continue
    off = int(os.path.splitext(name)[0])
    size = os.path.getsize(os.path.join(base, name))
    print(f"{name:<16} off={off:>12,}  filesize={size:>12,}  off+size={off+size:>12,}  "
          f"{'ENDS AT EOF' if off + size == sz else ''}")