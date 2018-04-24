#!/usr/bin/python
# coding=utf-8

import MySQLdb

db = MySQLdb.connect(host='localhost', user='Test1', passwd='123', db='RPIEM', charset='utf8' )
cursor = db.cursor()
def getsenrt(senn):
    # dht11_refreshtime,gy30_refreshtime,hcsr04_refreshtime,sys_monitor
    sql = "select %s from admin_table;" % (senn)
    try:
        cursor.execute(sql)
        results = cursor.fetchall()
        a = results[0][0]
        return a
    except:
        print "Error: unable to fecth data"

def Rdbclose():
    db.close()
