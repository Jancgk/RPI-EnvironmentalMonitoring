const express = require('express');
const mysql = require('mysql');
const config = require('config-lite')(__dirname);

const db = mysql.createPool({
    host: config.db.host,
    user: config.db.user,
    password: config.db.password,
    database: config.db.database,
    port: config.db.port
});

module.exports = function () {
    let router = express.Router();
    router.get('/',(req,res)=> {
        db.query(`SELECT * FROM admin_table`, (err, data) => {
            if (err) {
                console.log(err)
                res.status(500).send('database error').end();
            } else {
                res.render('admin/index.ejs', {settingData:data,getJsonPath:config.url});
            }
        });
    });
    router.post('/setting', (req, res) => {
        db.query(`UPDATE admin_table SET dht11_refreshtime = '${req.body.dht11_refreshtime}',gy30_refreshtime = '${req.body.gy30_refreshtime}',hcsr04_refreshtime = '${req.body.hcsr04_refreshtime}',sys_monitor = '${req.body.sys_monitor}'`, (err, data) => {
            if (err) {
                console.log(err)
                res.status(500).send('database error').end();
            } else {
                res.redirect('/admin/')
            }
        });
    });
    router.get('/act=reset',(req,res)=> {
        db.query("DROP TABLE sensor_dht11,sensor_gy30,sensor_hcsr04,sys_monitor", (err, data) => {
            if (err) {
                console.log(err)
                res.status(500).send('database error').end();
            } else {
                res.redirect('/admin/')
            }
        });
    });
    return router;
};