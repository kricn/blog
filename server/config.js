const path = require('path');

module.exports={
	DB_HOST: 'localhost',
	DB_USER: 'root',
	DB_PASS: '',
	DB_NAME: 'blog',

	ADMIN_SUBFIX: '_,./!@#',

	PORT: 3000,

	HTTP_ROOT: 'http://localhost:3000',

	UPLOAD_DIR: path.resolve(__dirname, './static/upload'),

	TOKEN_AGE : 14*86400*1000
}
