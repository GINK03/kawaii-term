import sys
import os
import re
if '--mem' in sys.argv:
  for line in os.popen('cat /proc/meminfo').read().split('\n'):
    if 'MemFree' in line:
      line = line.strip()
      # デフォルトではKB表現だから、メガバイトで表現する
      mem  = re.split(r'\s{1,}', line)[-2]
      mem  = 'Mem=%d MB'%(int(mem)//1000)
      print( mem )
      break

if '--vmstat' in sys.argv:
  buff = os.popen('vmstat').read().split('\n')
  keys = re.split(r'\s{1,}', buff[1])
  vals = re.split(r'\s{1,}', buff[2])
  obj  = dict( zip(keys, vals) )
  ucpu = '💻 ={0:03d}%'.format( int(obj['us']) )
  print( ucpu )

if '--disk' in sys.argv:
  buff =os.popen('df -hT').read().split('\n')
  # 末尾が/で終わるのが、ルートディレクトリ表示
  keys = re.split(r'\s{1,}', buff[0])
  vals = re.split(r'\s{1,}', list( filter(lambda x:len(x) != 0 and x[-1] == '/', buff[1:]) )[0] )
  obj  = dict(zip( keys, vals) )
  use  = obj['Use%']
  free = obj['Avail']
  result = 'DiskUse%={}, DiskAvail={}'.format(use, free)
  print(result)
