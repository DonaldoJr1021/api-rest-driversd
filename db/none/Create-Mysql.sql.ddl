CREATE TABLE Conductor (
  Id_Conductor      int(10) NOT NULL AUTO_INCREMENT, 
  cedula            varchar(10), 
  placa             char(7), 
  UsuarioId_Usuario int(10) NOT NULL, 
  PRIMARY KEY (Id_Conductor));
CREATE TABLE Pasajero (
  Id_Pasajero       int(10) NOT NULL AUTO_INCREMENT, 
  UsuarioId_Usuario int(10) NOT NULL, 
  PRIMARY KEY (Id_Pasajero));
CREATE TABLE Servicio (
  Id_Servicio           int(10) NOT NULL AUTO_INCREMENT, 
  Id_Usuario            int(10) NOT NULL, 
  precio                int(10), 
  valoracion            int(5), 
  origen                int(10) NOT NULL, 
  PasajeroId_Pasajero   int(10) NOT NULL, 
  ConductorId_Conductor int(10) NOT NULL, 
  destino               int(10) NOT NULL, 
  PRIMARY KEY (Id_Servicio));
CREATE TABLE Ubicacion (
  Id_Ubicacion int(10) NOT NULL AUTO_INCREMENT, 
  ubicacion    int(10), 
  descripcion  varchar(25), 
  PRIMARY KEY (Id_Ubicacion));
CREATE TABLE Usuario (
  Id_Usuario        int(10) NOT NULL AUTO_INCREMENT, 
  Nombres_Apellidos varchar(30), 
  Celular           int(10), 
  email             varchar(25), 
  contraseña        int(10), 
  PRIMARY KEY (Id_Usuario), 
  INDEX (Id_Usuario));
ALTER TABLE Pasajero ADD INDEX FKPasajero859817 (UsuarioId_Usuario), ADD CONSTRAINT FKPasajero859817 FOREIGN KEY (UsuarioId_Usuario) REFERENCES Usuario (Id_Usuario);
ALTER TABLE Conductor ADD INDEX FKConductor492714 (UsuarioId_Usuario), ADD CONSTRAINT FKConductor492714 FOREIGN KEY (UsuarioId_Usuario) REFERENCES Usuario (Id_Usuario);
ALTER TABLE Servicio ADD INDEX FKServicio816158 (destino), ADD CONSTRAINT FKServicio816158 FOREIGN KEY (destino) REFERENCES Ubicacion (Id_Ubicacion);
ALTER TABLE Servicio ADD INDEX FKServicio170501 (origen), ADD CONSTRAINT FKServicio170501 FOREIGN KEY (origen) REFERENCES Ubicacion (Id_Ubicacion);
ALTER TABLE Servicio ADD INDEX FKServicio38318 (ConductorId_Conductor), ADD CONSTRAINT FKServicio38318 FOREIGN KEY (ConductorId_Conductor) REFERENCES Conductor (Id_Conductor);
ALTER TABLE Servicio ADD INDEX FKServicio434283 (PasajeroId_Pasajero), ADD CONSTRAINT FKServicio434283 FOREIGN KEY (PasajeroId_Pasajero) REFERENCES Pasajero (Id_Pasajero);

