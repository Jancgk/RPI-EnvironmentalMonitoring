const crypto = require('crypto');

let setPassword = '111111';
let common = {
    MD5_SUFFIX: 'This is MD5_SUFFIX',
    md5: function (pwd) {
        let md5 = crypto.createHash('md5');
        return md5.update(pwd).digest('hex')
    }
};

md5Password = common.md5(setPassword + common.MD5_SUFFIX);
console.log(md5Password);