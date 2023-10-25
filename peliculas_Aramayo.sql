DROP SCHEMA IF EXISTS peliculas_01;
CREATE SCHEMA IF NOT EXISTS peliculas_01;
USE peliculas_01;

CREATE TABLE IF NOT EXISTS usuario(
id_usuario INT(8) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria',
nombre VARCHAR(50) NOT NULL  COMMENT 'Nombre usuario',
apellido VARCHAR(50) NOT NULL COMMENT 'Apellido usuario',
documento INT(10) NOT NULL COMMENT 'Documento usuario',
direccion VARCHAR(50) NOT NULL COMMENT 'Direccion usuario',
edad INT(2) NOT NULL COMMENT 'Edad usuario',

PRIMARY KEY(id_usuario)
);

CREATE TABLE IF NOT EXISTS productos(
id_pelicula INT(8) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria',
nombre VARCHAR(50) NOT NULL  COMMENT 'Nombre pelicula',
genero VARCHAR(50) NOT NULL COMMENT 'Apellido pelicula',
precio INT(6) NOT NULL COMMENT 'precio pelicula',
duracion INT(6) NOT NULL COMMENT 'Duracion pelicula',

PRIMARY KEY(id_pelicula)
);

CREATE TABLE IF NOT EXISTS venta(
id_venta INT(8) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria',
id_pelicula  INT(8) NOT NULL COMMENT 'Clave Foranea',
id_usuario INT(8) NOT NULL COMMENT 'Clave Foranea',
fecha DATE NOT NULL COMMENT 'Fecha pelicula',
cantidad INT(6) NOT NULL COMMENT 'Cantidad pelicula',
metodo_pago INT(6) NOT NULL COMMENT 'Metodo de pago pelicula',
total INT(15) NOT NULL COMMENT 'Monto a cobrar por pelicula',

PRIMARY KEY(id_venta)
);
ALTER TABLE venta 
ADD CONSTRAINT fk_id_pelicula
FOREIGN KEY(id_pelicula)REFERENCES productos(id_pelicula);

ALTER TABLE venta 
ADD CONSTRAINT fk_id_usuario
FOREIGN KEY(id_usuario)REFERENCES usuario(id_usuario);

CREATE TABLE IF NOT EXISTS envio(
id_conductor INT(8) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria',
id_venta  INT(8) NOT NULL COMMENT 'Clave Foranea',
id_usuario INT(8) NOT NULL COMMENT 'Clave Foranea',
peso INT(4) NOT NULL COMMENT 'Peso pelicula',
direccion VARCHAR(50) NOT NULL COMMENT 'Direccion usuario',
fecha_entrega DATE NOT NULL COMMENT 'Fecha entrega',

PRIMARY KEY(id_conductor)
);
ALTER TABLE envio 
ADD CONSTRAINT fk_id_venta
FOREIGN KEY(id_venta)REFERENCES venta(id_pelicula);

ALTER TABLE envio
ADD CONSTRAINT fk_id_usuario_envio
FOREIGN KEY(id_usuario)REFERENCES usuario(id_usuario);

CREATE TABLE IF NOT EXISTS stock(
id_proveedor INT(8) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria',
nombre VARCHAR(50) NOT NULL  COMMENT 'Nombre proveedor',
id_pelicula  INT(8) NOT NULL COMMENT 'Clave Foranea',
cantidad INT(4) NOT NULL COMMENT 'Cantidad de peliculas',
peso INT(4) NOT NULL COMMENT 'Peso pelicula',

PRIMARY KEY(id_proveedor)
);
ALTER TABLE stock
ADD CONSTRAINT fk_id_pelicula_stock
FOREIGN KEY(id_pelicula)REFERENCES productos(id_pelicula);

