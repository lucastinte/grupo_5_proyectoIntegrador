CREATE DATABASE IF NOT EXISTS structure;

USE structure;

-- Tabla Tipo
CREATE TABLE Tipo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL
);

-- Tabla Seccion
CREATE TABLE Seccion (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL
);

-- Tabla Marca
CREATE TABLE Marca (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL
);




-- Tabla Producto
CREATE TABLE Producto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  precio DECIMAL(10, 2) NOT NULL,
  img VARCHAR(255),
  descripcion TEXT,
  descuento INT,
  tipoId INT,
  seccionId INT,
  marcaId INT,
  FOREIGN KEY (tipoId) REFERENCES Tipo(id),
  FOREIGN KEY (seccionId) REFERENCES Seccion(id),
  FOREIGN KEY (marcaId) REFERENCES Marca(id)
);
CREATE TABLE Especificaciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  productoId INT,
  nombre VARCHAR(255) NOT NULL,
  valor VARCHAR(255) NOT NULL,
  FOREIGN KEY (productoId) REFERENCES Producto(id)
);



CREATE TABLE Genero (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Provincia (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Domicilio (
  id INT AUTO_INCREMENT PRIMARY KEY,
  provinciaId INT,
  localidad VARCHAR(255),
  barrio VARCHAR(255),
  calle VARCHAR(255),
  numero INT,
  codigoPostal VARCHAR(255),
  FOREIGN KEY (provinciaId) REFERENCES Provincia(id)
);

CREATE TABLE Usuario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombreUsuario VARCHAR(255),
  apellidoUsuario VARCHAR(255),
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  generoId INT,
  domicilioId INT,
  telefono VARCHAR(20),
  imgUser VARCHAR(255),
  FOREIGN KEY (generoId) REFERENCES Genero(id),
  FOREIGN KEY (domicilioId) REFERENCES Domicilio(id)
);
-- Poblar la tabla Provincia con provincias argentinas
INSERT INTO Provincia (nombre) VALUES
  ('Buenos Aires'),
  ('Catamarca'),
  ('Chaco'),
  ('Chubut'),
  ('Córdoba'),
  ('Corrientes'),
  ('Entre Ríos'),
  ('Formosa'),
  ('Jujuy'),
  ('La Pampa'),
  ('La Rioja'),
  ('Mendoza'),
  ('Misiones'),
  ('Neuquén'),
  ('Río Negro'),
  ('Salta'),
  ('San Juan'),
  ('San Luis'),
  ('Santa Cruz'),
  ('Santa Fe'),
  ('Santiago del Estero'),
  ('Tierra del Fuego'),
  ('Tucumán');
  -- Poblar la tabla Genero con valores comunes
INSERT INTO Genero (nombre) VALUES
  ('Masculino'),
  ('Femenino'),
  ('No Declarado');


CREATE TABLE Carrito (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuarioId INT,
  cantidad INT,
  total DECIMAL(10,2),
  FOREIGN KEY (usuarioId) REFERENCES Usuario(id)
);
CREATE TABLE ProductoCarrito (
  carritoId INT,
  productoId INT,
  cantidad INT,
  FOREIGN KEY (carritoId) REFERENCES Carrito(id),
  FOREIGN KEY (productoId) REFERENCES Producto(id)
);