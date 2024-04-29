--ACá creamos la base de datos
CREATE DATABASE MIRESTAURANTE;

USE MIRESTAURANTE;
--Aca creamos las tablas para las
--base de datos

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Platos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2)
);
CREATE TABLE Ordenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);
CREATE TABLE Detalles_Orden (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT,
    plato_id INT,
    cantidad INT,
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (orden_id) REFERENCES Ordenes(id),
    FOREIGN KEY (plato_id) REFERENCES Platos(id)
);

-- Insertar datos a la tablas de las base de datos
INSERT INTO Clientes (nombre, telefono, email) VALUES
('Juan Pérez', '123456789', 'juan@example.com'),
('María García', '987654321', 'maria@example.com'),
('Pedro López', '555123456', 'pedro@example.com'),
('Laura Martínez', '666789456', 'laura@example.com'),
('Carlos Rodríguez', '999888777', 'carlos@example.com');

INSERT INTO Platos (nombre, descripcion, precio) VALUES
('Pizza Margarita', 'Pizza con salsa de tomate, mozzarella y albahaca', 8.99),
('Hamburguesa Clásica', 'Hamburguesa de carne de res con lechuga, tomate y cebolla', 6.49),
('Ensalada César', 'Ensalada de lechuga romana con aderezo césar y crutones', 5.99),
('Pasta Alfredo', 'Pasta con salsa Alfredo y pollo a la parrilla', 9.99),
('Sushi Variado', 'Sushi de salmón, atún y camarón', 12.99);


INSERT INTO Ordenes (cliente_id, total) VALUES
(1, 25.47),
(2, 18.98),
(3, 11.50),
(4, 32.75),
(5, 22.60);

INSERT INTO Detalles_Orden (orden_id, plato_id, cantidad, subtotal) VALUES
(1, 1, 2, 17.98),
(1, 3, 1, 5.49),
(2, 2, 1, 6.49),
(3, 3, 1, 5.99),
(4, 4, 1, 9.99),
(4, 5, 1, 12.99),
(5, 1, 1, 8.99),
(5, 2, 1, 6.49);

-- Consultamos datos de la base de datos
SELECT * FROM Clientes;

SELECT * FROM Platos;

SELECT * FROM Ordenes;

SELECT * FROM Detalles_Orden;

--Acá actualizamos datos de las tablas de datos

update Clientes set email = 'juanperez@gmail.com' where id=1;
update Clientes set email = 'lauramartinez@gmail.com' where id=4;

--Acá eliminamos datos de las tablas de datos
delete FROM Detalles_Orden where id=7;
delete FROM Detalles_Orden where id=8;
delete FROM Ordenes where id=5;

delete FROM Clientes where id=5;