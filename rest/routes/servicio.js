const express = require('express');
const cors = require('cors')
const route = express.Router();

const mysqlConnection = require('../database');

route.post('/servicio', cors(), (req, res) => {});

module.exports = route;