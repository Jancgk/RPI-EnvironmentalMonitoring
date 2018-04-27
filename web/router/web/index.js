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
        db.query(`SELECT
                sensor_dht11.humidity,
                sensor_dht11.temperature,
                sensor_gy30.light,
                sensor_dht11.time
                FROM
                sensor_dht11
                INNER JOIN sensor_gy30 ON sensor_dht11.ID = sensor_gy30.ID
                INNER JOIN sensor_hcsr04 ON sensor_gy30.ID = sensor_hcsr04.ID`, (err, data) => {
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