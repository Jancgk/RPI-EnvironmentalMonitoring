const express = require('express');
const mysql = require('mysql');
const config = require('config-lite')(__dirname);

const db = mysql.createPool({
    host: config.db.host,
    url:config.url,
    user: config.db.user,
    password: config.db.password,
    database: config.db.database,
    port: config.db.port
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
                res.render('index.ejs', {myData:data,getJsonPath:config.url});
            }
        });
    });

    return router;
};