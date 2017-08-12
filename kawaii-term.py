import sys
import os
import re
if '--mem' in sys.argv:
  for line in os.popen('cat /proc/meminfo').read().split('\n'):
    if 'MemFree' in line:
      line = line.strip()
      # デフォルトではKB表現だから、メガバイトで表現する
      mem  = re.split(r'\s{1,}', line)[-2]
      mem  = '%d MB'%(int(mem)//1000)
      print( mem )
      break
