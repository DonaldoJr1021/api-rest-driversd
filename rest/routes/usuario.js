const express = require('express');
const cors = require('cors');
const route = express.Router();


const mysqlConnection = require('../database');

//ruta inicial para tener los datos
route.get('/', (req, res) => {
    //consulta de los conductores en la base de datos a través de mysqlconnection
    mysqlConnection.query('SELECT * FROM usuario', (err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }

    });
});

//Registro de Usuarios
route.post('/usuario', cors(), (req, res) => {
    //ingreso de los usuarios en la base de datos
    const { Nombres_Apellidos, Celular, email, passw, Foto_Perfil} = req.body;
    //variable hash para encriptar la contraseña
    const query = `CALL AddUser (?, ?, ?, ?, ?)`;
    mysqlConnection.query(query, [Nombres_Apellidos, Celular, email, passw, Foto_Perfil], (err, rows, fields) => {
        if (err) return res.json(err);
        return res.json({ status: 'Usuario Registrado con Exito!' })
    })
});

module.exports = route;