#!/usr/bin/python
# coding=utf-8

import RPi.GPIO as GPIO
import time


def SR501():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(20, GPIO.IN)

    try:
        if GPIO.input(20) == 1:
            print "Some people here!"
        else:
            print "Nobody!"
    except:
        GPIO.cleanup()
        print "All Cleanup!"

    print "SR501_exit"


