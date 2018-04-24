#!/usr/bin/python
# coding=utf-8

import os, psutil,time

def getCPUtemp():
    res = os.popen('vcgencmd measure_temp').readline()
    return (res.replace("temp=", "").replace("'C\n", ""))


def getMemB():
    data = psutil.virtual_memory()
    total = data.total  # 总内存,单位为byte
    free = data.available  # 可以内存
    memory = int(round(data.percent))
    # cpu = "CPU:%0.2f"%psutil.cpu_percent(interval=1)+"%"
    return str(memory)


def getCPUuse():
    return (str(os.popen("top -n1 | awk '/Cpu\(s\):/ {print $2}'").readline().strip()))

# print getCPUtemp()
# print getCPUuse()
# print getMemB()