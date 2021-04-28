CREATE DATABASE CruzDelSur
go
USE CruzDelSur

go
CREATE TABLE Tbl_Choferes(
IdChofer varchar(5)NOT NULL Primary key,
NombreCompreto varchar(250) not null,
Telefono char(12) not null,
Direccion varchar(max) not null,
DNI int not null,
Correo varchar(250),
Observaciones varchar(max))

go
CREATE TABLE Tbl_Vehiculos(
Placa varchar(6) NOT NULL Primary Key,
Modelo varchar(250) NOT NULL,
Color varchar(250) NOT NULL,
FechaFabricacion varchar(10) NOT NULL,
CantidadEjes int NOT NULL,
Empresa varchar(250)NOT NULL,
Estado varchar(250) NOT NULL,
Observaciones varchar(max))

go
CREATE TABLE Tbl_Sucursales(
Direccion varchar(250) NOT NULL PRIMARY KEY,
NumeroLocal char(12) NOT NULL,
CantidadEstacionamiento int not null,
Observaciones varchar(max),
Empresa varchar(250) NOT NULL )

go
CREATE TABLE Tbl_Pasajero(
IdPasajero varchar(5) NOT NULL Primary Key,
CodRuta varchar(5) NOT NULL,
NombresCompletos varchar(250) NOT NULL,
Telofono char (12) NOT NULL,
Direccion varchar(250) NOT NULL,
DNI char(8) NOT NULL,
Correo varchar(250) NOT NULL,
Carga varchar(250),
NumeroAsiento varchar(3) NOT NULL,
FechaViaje varchar(10) NOT NULL)

go
CREATE TABLE Tbl_Carga(
IdCarga varchar(5) NOT NULL Primary Key,
Tipo varchar(250) NOT NULL,
Peso varchar(250) NOT NULL,
IdPasajero varchar(5),
FOREIGN KEY (IdPasajero) REFERENCES Tbl_Pasajero (IdPasajero),
Placa varchar(6),
FOREIGN KEY (Placa) REFERENCES Tbl_Vehiculos (Placa),
Observaciones varchar(max)
)
go

CREATE TABLE Tbl_Terramoza(
IdTerramoza varchar(5) NOT NULL Primary Key,
NombresCompletos varchar(250) NOT NULL,
DNI char(8) NOT NULL,
Telefono char(12) NOT NULL,
Correo varchar(250) NOT NULL,
FechaEntrada varchar(10) NOT NULL,
Estado varchar(250) NOT NULL,
Observaciones varchar(max)
)

go
CREATE TABLE Tbl_Ruta(
IdPrimerChofer varchar(5) NOT NULL,
FOREIGN KEY (IdPrimerChofer) REFERENCES Tbl_Choferes (IdChofer),
IdSegundoChofer varchar(5),
FOREIGN KEY (IdSegundoChofer) REFERENCES Tbl_Choferes (IdChofer),
IdTerramoza varchar(5),
FOREIGN KEY (IdTerramoza) REFERENCES Tbl_Terramoza (IdTerramoza),
CantidadPasajeros int not null,
Pesocarga char(10) not null,
Placa varchar(6) not null,
FOREIGN KEY (Placa) REFERENCES Tbl_Vehiculos (Placa),
HorarioSalida varchar(10) not null,
HorarioLlegada varchar(10),
CodRuta varchar(5) NOT NULL Primary Key,
FechaViaje varchar(10) NOT NULL,
IdCarga varchar(5),
FOREIGN KEY (IdCarga) REFERENCES Tbl_Carga (IdCarga),
)

go
CREATE TABLE Tbl_Destinos(
CodRuta varchar(5) NOT NULL,
FOREIGN KEY (CodRuta) REFERENCES Tbl_Ruta (CodRuta),
LugarSalida varchar(250) NOT NULL,
FOREIGN KEY (LugarSalida) REFERENCES Tbl_Sucursales (Direccion),
LugarLlegada varchar(250),
FOREIGN KEY (LugarLlegada) REFERENCES Tbl_Sucursales (Direccion),
Escala varchar(250)
)

go
CREATE TABLE Tbl_InfoVehiculo(
Capacidad char(20)NOT NULL,
Seguridad varchar(250) NOT NULL,
Confort varchar(250),
Rendimiento varchar(250),
Maniobravilidad varchar(250),
Marca varchar(250),
Placa varchar(6) NOT NULL,
AñoFabricacion varchar(10) NOT NULL,
DetallesTecnicos varchar(max),
CodInfoVehiculo varchar(5) NOT NULL Primary Key
)

go
CREATE TABLE Tbl_Licitacion(
CodLicitacion varchar(5) NOT NULL Primary Key,
CodInfoVehiculo varchar(5),
FOREIGN KEY (CodInfoVehiculo) REFERENCES Tbl_InfoVehiculo (CodInfoVehiculo),
RUC int not null,
RepresentanteLegal varchar(250) NOT NULL,
EmpresaCompra varchar(250) NOT NULL,
DireccionEmpresaCompra varchar(250) NOT NULL,
Empresa varchar(250) NOT NULL,
DireccionEmpresa varchar(250) NOT NULL,
FOREIGN KEY (DireccionEmpresa) REFERENCES Tbl_Sucursales(direccion),
CantUnidades int,
Notaria varchar(250) NOT NULL,
NombreNotario  varchar(250) NOT NULL,
DNINotario char(8) NOT NULL,
TelefonoNotario char(12) NOT NULL,
CorreoNotario  varchar(250) NOT NULL,
DireccionNotario  varchar(250) NOT NULL,
Fecha varchar(10) NOT NULL,
Observaciones varchar(max)
)

go
CREATE TABLE Tbl_Boleta(
IdPasajero varchar(5) NOT NULL,
FOREIGN KEY (IdPasajero) REFERENCES Tbl_Pasajero(IdPasajero),
NombrePasajero varchar(250)NOT NULL,
MetodoPago varchar(20) NOT NULL,
MontoPagar varchar(100) NOT NULL,
Fecha varchar(10) NOT NULL,
FechaEmbarco varchar(10) NOT NULL,
DNI char(8) NOT NULL,
Correo varchar(250) NOT NULL,
Direccion varchar(250) NOT NULL,
NumeroAsiento varchar(2) NOT NULL,
)

go
CREATE TABLE Tbl_Contable(
GananciaDiaria char(10),
PerdidaDiaria char(10),
CantidadBoletosVendidos char(9),
CantidadSalidas char(10),
CantidadPasajeros char(10),
BalanceDiario char(10),
BalanceMensual char(10)
)

go
CREATE TABLE Tbl_PagoEmpleado(
IdEmpleado varchar(5),
CantidadPagar char(10),
Estado varchar(max)
)