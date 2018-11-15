//iniciamos el modulo de conexión a la base de datos
const mysql = require('mysql');
const mysqlConnection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'driversd'
});

mysqlConnection.connect(function(err) {
    if (err) {
        console.log(err);
        return;
    } else {
        console.log("Connection - Goog Job!")
    }
});

module.exports = mysqlConnection;