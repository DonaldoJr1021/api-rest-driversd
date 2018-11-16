const express = require('express');
const cors = require('cors')
const route = express.Router();

const mysqlConnection = require('../database');

route.post('/servicio', cors(), (req, res) => {
    const { precio, origen, destino} = req.body;
    const query = `CALL AddServicio (?, ?, ?)`;
    mysqlConnection.query(query, [precio, origen, destino], (err, rows, fields) => {
        if (err) return res.json(err);
        return res.json({ status: 'Servicio Registrado!' })
    })
});

module.exports = route;