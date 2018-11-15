INSERT INTO Conductor
  (Id_Conductor, 
  cedula, 
  placa, 
  UsuarioId_Usuario) 
VALUES 
  (?, 
  ?, 
  ?, 
  ?);
INSERT INTO Pasajero
  (Id_Pasajero, 
  UsuarioId_Usuario) 
VALUES 
  (?, 
  ?);
INSERT INTO Servicio
  (Id_Servicio, 
  Id_Usuario, 
  precio, 
  valoracion, 
  origen, 
  PasajeroId_Pasajero, 
  ConductorId_Conductor, 
  destino) 
VALUES 
  (?, 
  ?, 
  ?, 
  ?, 
  ?, 
  ?, 
  ?, 
  ?);
INSERT INTO Ubicacion
  (Id_Ubicacion, 
  ubicacion, 
  descripcion) 
VALUES 
  (?, 
  ?, 
  ?);
INSERT INTO Usuario
  (Id_Usuario, 
  Nombres_Apellidos, 
  Celular, 
  email, 
  contraseña) 
VALUES 
  (?, 
  ?, 
  ?, 
  ?, 
  ?);

