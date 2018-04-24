var crypto = require('crypto');

module.exports = {
    MD5_SUFFIX: 'This is MD5_SUFFIX',
    md5: function (pwd) {
        let md5 = crypto.createHash('md5');
        return md5.update(pwd).digest('hex');
    }
};