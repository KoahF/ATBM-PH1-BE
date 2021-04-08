// 3rd dependencies
const oracledb = require("oracledb");

// Middelware

// database
const query = require("../database/query");

const userController = {};

//-----------------------------------GET----------------------------------

// [get] /api/users/
userController.get = async (req, res) => {
    // const q = `BEGIN getUsers(:mycursor); END;`;
    // console.log(q);
    const result = await query(`BEGIN getUsers(:mycursor); END;`, {
        mycursor: {
            type: oracledb.CURSOR,
            dir: oracledb.BIND_OUT,
        },
    });
    res.status(200).send(result);
};

//-----------------------------------POST----------------------------------

//-----------------------------------PUT----------------------------------

//-----------------------------------DELETE----------------------------------

module.exports = userController;
