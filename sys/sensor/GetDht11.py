#!/usr/bin/python
# coding=utf-8

import time,Adafruit_DHT,RPi.GPIO as GPIO

def getdh11():
    sensor = 11  # 传感器型号，DHT11
    pin = 21  # BCM26
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(21, GPIO.OUT)  # BCM21
    humidity, temperature = Adafruit_DHT.read_retry(sensor, pin)
    return humidity,temperature
    GPIO.cleanup()

# print getdh11()