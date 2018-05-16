# RPI-EnvironmentalMonitoring
Raspberry Pi Home Environment Monitoring System

Test
=======


#### config
```
module.exports = {
    port:"8080",
    session: {
        maxAge: 20 * 60 * 1000  // session for 20 min
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
default:

localhost:{$port}/admin

username:admin

password:111111
```
cd web/lib/
node logmd5.js
```

#### run node server
```
git clone
cd web
npm install
node index.js
```

![test](https://raw.githubusercontent.com/Jancgk/RPI-EnvironmentalMonitoring/master/value.png)