const express = require('express');

module.exports = function () {
    let router = express.Router();
    router.use(function (req,res,next) {
        if(!req.session['user_id'] && req.url != '/login'){
            res.redirect('/admin/login');
        }else{
            next();
        }
    });
    router.use('/login',require('./login')());
    router.use('/',require('./manage')());
    return router;
};