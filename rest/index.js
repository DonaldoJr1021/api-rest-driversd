const express = require('express');
const cors = require('cors');
const app = express();

//Funciones de procesamiento
app.use(express.json());
//uso de cors
app.use(cors());

// Configuracion del servidor
app.set('port', process.env.PORT || 3100);

// Routes
app.use(require('./routes/conductor'));
app.use(require('./routes/usuario'));
app.use(require('./routes/servicio'));

// Inicializar servidor
app.listen(app.get('port'), () => {
    console.log("Good Job!");
});