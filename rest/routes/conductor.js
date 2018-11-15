const express = require('express');
const cors = require('cors');
const route = express.Router();

const mysqlConnection = require('../database');

//ruta inicial para tener los datos
route.get('/', (req, res) => {
    //consulta de los conductores en la base de datos a través de mysqlconnection
    mysqlConnection.query('SELECT * FROM conductor', (err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }

    });
});

route.get('/:id', (req, res) => {
    //consulta de los conductores en la base de datos a través de mysqlconnection por id
    const { id } = req.params;
    mysqlConnection.query('SELECT * FROM conductor where Id_Conductor = ?', [id], (err, rows, fields) => {
        if (!err) {
            res.json(rows[0]);
        } else {
            console.log(err);
        }
    })
});

route.post('/conductor', cors(), (req, res) => {
    const { Nombres_Apellidos, Celular, email, passw, Foto_Perfil, cedula, placa, disponibilidad, Foto1, Foto2, Foto3, Foto4 } = req.body;
    const query = "CALL Addconductor (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    mysqlConnection.query(query, [Nombres_Apellidos, Celular, email, passw, Foto_Perfil, cedula, placa, disponibilidad, Foto1, Foto2, Foto3, Foto4], (err, rows, fields) => {
        if (err) return res.json(err);
        return res.json({ status: 'Your Conductor is saved database!' })
    })
});

module.exports = route;
