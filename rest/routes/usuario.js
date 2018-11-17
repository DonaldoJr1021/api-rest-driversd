const express = require('express');
const cors = require('cors');
const route = express.Router();

//var Cryptr = require('cryptr');
//cryptr = new Cryptr('myTotalySecretKey');

const mysqlConnection = require('../database');
const sendEmail = require('../../utils/sendemail')

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
    const query = `CALL AddUser (?, ?, ?, ?, ?)`;
    mysqlConnection.query(query, [Nombres_Apellidos, Celular, email, passw, Foto_Perfil], (err, rows, fields) => {
        if (err) return res.json(err);
        sendEmail(Nombres_Apellidos,email)
        return res.json({ status: 'Usuario Registrado con Exito!' })
    })
});

//login usuario
route.post('/usuario/login', (req, res) => {
    const { email, passw } = req.body;
    mysqlConnection.query(`SELECT * from usuario where email = ? `, [email], (err, rows, fields) => {
            if (err) {
                console.log(err);
            } else {
                if (rows.length > 0) {
                    if (passw.req.body == passw) {
                        res.json({
                            Status: 'Logueado'
                        });
                    } else {
                        res.json({ Status: false, message: "Email o Contraseña incorrectos" });
                    }
                } else{
                    res.json({ Status: false, message: "Email no esiste" });
                    console.log(rows);
                }
            }
        });
});
module.exports = route;