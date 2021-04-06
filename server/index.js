// 3rd dependencies
require('dotenv').config();
const app = require('express')();

// startup
require('./startup/routes')(app);

app.listen(process.env.BE_PORT, () => {
	console.log(`http://localhost:${process.env.BE_PORT}`);
});
