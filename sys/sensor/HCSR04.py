#!/usr/bin/python
# coding=utf-8

import RPi.GPIO as GPIO
import time


def HCSR04():

    GPIO.setmode(GPIO.BCM)
    TRIG = 6
    ECHO = 5
    GPIO.setup(TRIG,GPIO.OUT)
    GPIO.setup(ECHO,GPIO.IN)
# 设定gpio2为Trig输出，gpio3为Echo输入

    GPIO.output(TRIG,True)
    time.sleep(0.00001)
    GPIO.output(TRIG,False)
    # print 'fire'
# 通过Trig发送10微秒的脉冲

# 等待低电平结束，然后记录时间。
    while GPIO.input(ECHO) == 0:
        pass
    start = time.time()

# 等待高电平结束，然后记录时间。
    while GPIO.input(ECHO) == 1:
        pass
    end = time.time()

    ok = end - start
    ook = ok * (343 * 100 /2)
    ook = round(ook,2)
    GPIO.cleanup()
    return ook
# print HCSR04()
