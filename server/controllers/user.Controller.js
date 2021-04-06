// 3rd dependencies

// Middelware

// database
const query = require('../database/query');

const userController = {};

//-----------------------------------GET----------------------------------

// [get] /api/role/
userController.get = async (req, res) => {
	const result = await query('SELECT * FROM DBA_USERS');
	res.status(200).send(result);
};

//-----------------------------------POST----------------------------------

//-----------------------------------PUT----------------------------------

//-----------------------------------DELETE----------------------------------

module.exports = userController;
