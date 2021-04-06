// 3rd dependencies

// Middelware

// database
const query = require('../database/query');

const roleController = {};

//-----------------------------------GET----------------------------------

// [get] /api/role/
roleController.get = async (req, res) => {
	const result = await query('SELECT ROLE, ROLE_ID FROM DBA_ROLES dba');
	res.status(200).send(result);
};

//-----------------------------------POST----------------------------------

//-----------------------------------PUT----------------------------------

//-----------------------------------DELETE----------------------------------

module.exports = roleController;
