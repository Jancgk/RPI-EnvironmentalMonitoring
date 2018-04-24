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
    router.get('/',function (req,res) {
        db.query("SELECT * FROM `test`;", (err, data) => {
            if (err) {
                console.log(err)
                res.status(500).send('database error').end();
            } else {
                res.render('admin/index.ejs', {myData:data});
            }
        });
    });
    router.get('/act=reset',function (req,res) {
        db.query("truncate TABLE `test`;", (err, data) => {
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