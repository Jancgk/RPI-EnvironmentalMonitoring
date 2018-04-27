const path = require('path');
const express = require('express');
const expressStatic = require('express-static');
const cookieParser = require('cookie-parser');
const cookieSession = require('cookie-session');
const bodyParser = require('body-parser');
const multer = require('multer');
const multerObj = multer({dest: './static/upload'});
const ejs = require('ejs');
const mysql = require('mysql');
const consolidate = require('consolidate');
const config = require('config-lite')(__dirname);

// common
const common = require('./lib/common');

const server = express();
const db = mysql.createPool({
    host: config.db.host,
    user: config.db.user,
    password: config.db.password,
    database: config.db.database,
    port: config.db.port
});
server.use(bodyParser.urlencoded({ extended: false}));
server.use(multerObj.any());

// cookie，session
server.use(cookieParser('Neal_signed'));
(function () {
    let arr = [];
    for (let i = 0; i < 10000; i++) {
        arr.push('keys_' + Math.random());
    }
    server.use(cookieSession({
        name: 'session_id',
        keys: arr,
        maxAge: config.session.maxAge
    }))
})();

server.set('view engine', 'html');
server.set('views', './views');
server.engine('html', consolidate.ejs);

// router
server.use('/', require('./router/web/index')());
server.use('/admin/', require('./router/admin')());


// callback
server.get('/jsonp', (req, res) => {
    let _callback = req.query.callback;
    let _data = {
        "code": 0,
        "msg": "",
        data: {
            "status": 200,
            "name": "Monkey",
            "age": 18,
            "humidity": 'data'
        }
        // http://localhost:8080/jsonp?callback=humidity
    };
    res.type('text/javascript');
    res.send(_callback + '(' + JSON.stringify(_data) + ')');
})

// util
let util = {
    toDyadicArray: (arr) => {
        for (let i = 0; i < arr.length; i++) {
            let tmpArr = [];
            for (let attr in arr[i]) {
                tmpArr.push(arr[i][attr])
            }
            arr[i] = tmpArr
        }
        return arr
    }
}

// json
server.get('/json/humidity', (req, res) => {
    db.query("SELECT timestamp,humidity FROM `sensor_dht11`;", (err, data) => {
        if (err) {
            console.log(err);
            res.status(500).send('database error').end();
        } else {
            util.toDyadicArray(data);
            res.json(data)
        }
    });
});

server.get('/json/temperature', (req, res) => {
    db.query("SELECT timestamp,temperature FROM `sensor_dht11`;", (err, data) => {
        if (err) {
            console.log(err);
            res.status(500).send('database error').end();
        } else {
            util.toDyadicArray(data);
            res.json(data)
        }
    });
});

server.get('/json/light', (req, res) => {
    db.query("SELECT timestamp,light FROM `sensor_gy30`;", (err, data) => {
        if (err) {
            console.log(err);
            res.status(500).send('database error').end();
        } else {
            util.toDyadicArray(data);
            res.json(data)
        }
    });
});

server.use('/files',expressStatic('./static'));

server.listen(config.port, () => {
    console.log(`listen port:${config.port}`)
});