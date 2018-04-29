# RPI-EnvironmentalMonitoring
Raspberry Pi Home Environment Monitoring System

Test
=======


#### config
```js
module.exports = {
    port:"8080",
    url:'http://localhost:8080/',// or like: http:www.example.com:8080
    session: {
        maxAge: 20 * 60 * 1000// session for 20 min
    },
    db:{
        host: 'localhost',
        user: 'root',
        password: '111111',
        database: 'rpi-environmentalmonitoring',
        port: '3307'
    }
}
```
#### set admin_table password
```
cd web/lib/
npm ./logmd5.js
```

default
```
username:admin
password:111111
```

#### run node server
```
git clone
cd web
npm install
npm ./index.js
```

![test](https://raw.githubusercontent.com/Jancgk/RPI-EnvironmentalMonitoring/master/value.png)