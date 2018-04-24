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

#### run node server
```
git clone
cd web
npm install
npm run index.js
```

backup
