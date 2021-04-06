const express = require('express');
const cors = require('cors');
const route = require('../routes/index.Route');

module.exports = function (app) {
	// Middleware
	app.use(express.json());
	app.use(cors());

	// Routes init
	route(app);
};
