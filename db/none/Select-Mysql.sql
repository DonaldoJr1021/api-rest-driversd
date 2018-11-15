SELECT Id_Conductor, cedula, placa, UsuarioId_Usuario 
  FROM Conductor;
SELECT Id_Pasajero, UsuarioId_Usuario 
  FROM Pasajero;
SELECT Id_Servicio, Id_Usuario, precio, valoracion, origen, PasajeroId_Pasajero, ConductorId_Conductor, destino 
  FROM Servicio;
SELECT Id_Ubicacion, ubicacion, descripcion 
  FROM Ubicacion;
SELECT Id_Usuario, Nombres_Apellidos, Celular, email, contraseña 
  FROM Usuario;

