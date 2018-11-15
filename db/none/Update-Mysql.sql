UPDATE Conductor SET 
  cedula = ?, 
  placa = ?, 
  UsuarioId_Usuario = ? 
WHERE
  Id_Conductor = ?;
UPDATE Pasajero SET 
  UsuarioId_Usuario = ? 
WHERE
  Id_Pasajero = ?;
UPDATE Servicio SET 
  Id_Usuario = ?, 
  precio = ?, 
  valoracion = ?, 
  origen = ?, 
  PasajeroId_Pasajero = ?, 
  ConductorId_Conductor = ?, 
  destino = ? 
WHERE
  Id_Servicio = ?;
UPDATE Ubicacion SET 
  ubicacion = ?, 
  descripcion = ? 
WHERE
  Id_Ubicacion = ?;
UPDATE Usuario SET 
  Nombres_Apellidos = ?, 
  Celular = ?, 
  email = ?, 
  contraseña = ? 
WHERE
  Id_Usuario = ?;

