const roles = require('./role.Route');
const users = require('./user.Route');

function route (app) {
	app.use('/api/roles', roles);
	app.use('/api/users', users);
}

module.exports = route;
