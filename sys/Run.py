#!/usr/bin/python
# coding=utf-8

import time,signal,sys
from sensor import GetSys, GY30, HCSR04, GetDht11
from DB import Wdb, Rdb

# humidity, temperature = GetDht11.getdh11()
# times = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
# sysmb = GetSys.getMemB()
# syscu = GetSys.getCPUuse()
# sysct = GetSys.getCPUtemp()
# hc = HCSR04.HCSR04()
# gy = GY30.getIlluminance()

# print int(round(time.time() * 1000))
# 13位时间戳

# dht11_refreshtime,gy30_refreshtime,hcsr04_refreshtime,sys_monitor
dht11rt = int(Rdb.getsenrt("dht11_refreshtime"))
gy30rt = int(Rdb.getsenrt("gy30_refreshtime"))
hcsr04rt = int(Rdb.getsenrt("hcsr04_refreshtime"))
sysrt = int(Rdb.getsenrt("sys_monitor"))
Rdb.Rdbclose()
print(dht11rt, gy30rt, hcsr04rt, sysrt)
i = 0
sqld = []


def signal_handler(signal, frame):
    print('You pressed Ctrl+C!')
    Wdb.dbclose()
    sys.exit(0)
signal.signal(signal.SIGINT, signal_handler)
print("按下Ctrl+C可结束程序")

while 1:
    if i % dht11rt == 0:
        humidity, temperature = GetDht11.getdh11()
        sql = "INSERT INTO sensor_dht11 (time,timestamp,humidity, temperature) VALUES ('%s' ,'%d','%f','%f');" % (
            time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()), int(round(time.time() * 1000)), humidity, temperature)
        print str(i) + " getdht11"
        sqld.append(sql)
    if i % gy30rt == 0:
        sql = "INSERT INTO sensor_gy30 (time,timestamp,light) VALUES ('%s' ,'%d','%f');" % (
            time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()), int(round(time.time() * 1000)),GY30.getIlluminance())
        print str(i) + " gy30"
        sqld.append(sql)
    if i % hcsr04rt == 0:
        sql = "INSERT INTO sensor_hcsr04 (time,timestamp,distance) VALUES ('%s' ,'%d','%f');" % (
            time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()), int(round(time.time() * 1000)),float(HCSR04.HCSR04()))
        print str(i) + " hcsr04"
        sqld.append(sql)
    if i % sysrt == 0:
        sql = "INSERT INTO sys_monitor (time,timestamp,cput,cpuu,memu) VALUES ('%s' ,'%d','%f','%f','%f');" % (
            time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()), int(round(time.time() * 1000)), float(GetSys.getCPUtemp()),float(GetSys.getCPUuse()),float(GetSys.getMemB()))
        print str(i) + " sys"
        sqld.append(sql)

    i = i + 1
    time.sleep(1)
    if i >= 60:
        break

for sqldx in sqld:
    Wdb.exesql(sqldx)

# print sqld
# print len(sqld)

Wdb.dbclose()
