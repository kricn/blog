const fs = require('fs');
module.exports={
	unlink(path){
		return new Promise((resolve, reject) => {
			fs.unlink(path, err => {
				if(err){
					reject(err);
				}else{
					resolve();
				}
			});
		});
	}
}
