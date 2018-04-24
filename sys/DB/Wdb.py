#!/usr/bin/python
# coding=utf-8

import MySQLdb, time

# 打开数据库连接
db = MySQLdb.connect("localhost", "Test1", "123", "RPIEM", charset='utf8')
# 使用cursor()方法获取操作游标
cursor = db.cursor()

sqls = "INSERT INTO sensor_dht11 (备注,time) VALUES ('%s','%s');" % ("! 错误，数据未写入(wdb)", time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))

i = 0;


def exesql(sqls):
    try:
        # 执行sql语句
        cursor.execute(sqls)
        # 提交到数据库执行
        db.commit()
        print sqls
        print "\n Wdb_OK"
    except:
        db.rollback()
        print "error"


def dbclose():
    db.close()

