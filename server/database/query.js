// 3rd dependencies
const oracledb = require('oracledb');

oracledb.outFormat = oracledb.OUT_FORMAT_OBJECT;

const config = {
	user: process.env.DB_USER,
	password: process.env.DB_PASS,
	connectString: process.env.DB_HOST,
};

module.exports = async function (q) {
	try {
		await oracledb.createPool(config);

		return await query(q);
	} catch (err) {
		console.log('ERROR: database/query function module.exports');
	}
};

async function query (q) {
	try {
		let connection = await oracledb.getConnection();
		let result = await connection.execute(q);
		console.log('huy');

		await connection.close();

		return result;
	} catch (error) {
		console.log({ error: 'path: database/query.js' });
		console.log(error);
	}
}
