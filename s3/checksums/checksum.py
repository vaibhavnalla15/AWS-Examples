import zlib
with open("johnwick.txt","rb") as f:
    print(zlib.crc32(f.read()))