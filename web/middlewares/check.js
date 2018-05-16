moudle.export={
    checkLogin:function (req,res,next) {
        if (!req.session.user_id) {
            return res.redirect('/login')
        }
        next()
    },
    checkNoLogin:function (req,res,next) {
        if(req.session.user_id) {
            return res.redirect('back')
        }
        next()
    }
};