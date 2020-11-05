echo off
for /l %r in (1,1,1000) do ping 192.168.0.%r
