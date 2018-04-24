const express = require('express');
const mysql = require('mysql');


var db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '111111',
    database: 'rpi-environmentalmonitoring',
    port:'3307'
});

module.exports = function () {
    let router = express.Router();
    router.get('/',function (req,res) {
        db.query("SELECT * FROM `test`;", (err, data) => {
            if (err) {
                console.log(err)
                res.status(500).send('database error').end();
            } else {
                res.render('index.ejs', {myData:data});
            }
        });
    });

    return router;
};