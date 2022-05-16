.headers on
.mode column
PRAGMA foreign_keys = ON;

CREATE TABLE clientes (
    id_cliente integer PRIMARY KEY AUTOINCREMENT,
    nombre varchar(50),
    email varchar(50)
);

INSERT INTO clientes(nombre,email)
VALUES
('Dejah','dejah@email.com'),
('Jonh','jonh@email.com');


CREATE UNIQUE INDEX index_clientes_email ON clientes(email);
CREATE UNIQUE INDEX nombre_email ON clientes(nombre,email);
CREATE UNIQUE INDEX EMAIL ON CLIENTES(email);


CREATE TABLE temporal1(
    id_cliente integer,
    nombre varchar(50),
    email varchar(50)
);

CREATE TABLE productos(
    id_producto integer PRIMARY KEY AUTOINCREMENT,
    producto varchar(50),
    precio_unitario float
);

INSERT INTO productos(producto,precio_unitario)
VALUES
('Lápiz',5),
('Libreta',20);


CREATE TABLE ventas(
    id_venta integer PRIMARY KEY AUTOINCREMENT,
    fecha date,
    id_cliente integer REFERENCES clientes(id_cliente)
);

INSERT INTO ventas(fecha,id_cliente)
VALUES
('2020/01/01',1),
('2020/01/02',1),
('2020/01/03',2);


CREATE TABLE detalle_ventas(
    id_detalle_venta integer PRIMARY KEY AUTOINCREMENT,
    id_venta integer REFERENCES ventas(id_venta),
    id_producto integer REFERENCES productos(id_producto),
    cantidad_producto integer,
    precio_unitario float,
    total_x_producto float
);

INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES
(1,1,2,5,10),
(1,2,10,20,200),
(2,2,1,20,20),
(3,1,10,5,50),
(3,2,10,20,200);
