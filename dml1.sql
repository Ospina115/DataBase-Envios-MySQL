SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE delivery_addresses;
TRUNCATE TABLE assistant_phones;
TRUNCATE TABLE driver_phones;
TRUNCATE TABLE packages;
TRUNCATE TABLE shipments;
TRUNCATE TABLE tracking;
TRUNCATE TABLE vehicle_models;
TRUNCATE TABLE vehicles;
TRUNCATE TABLE driver_routes;
TRUNCATE TABLE routes;
TRUNCATE TABLE branches;
TRUNCATE TABLE cities;
TRUNCATE TABLE countries;
TRUNCATE TABLE customers;
TRUNCATE TABLE recipients;
TRUNCATE TABLE brands;
TRUNCATE TABLE shipment_statuses;
TRUNCATE TABLE service_types;
TRUNCATE TABLE document_types;
TRUNCATE TABLE phone_types;

SET FOREIGN_KEY_CHECKS = 1;

-- Inserción en países
INSERT INTO countries (name) 
VALUES ('Estados Unidos'),
('Canadá'),
('México'),
('Brasil'),
('Argentina'),
('Chile'),
('Perú'),
('España'),
('Francia'),
('Alemania'),
('Italia'),
('China'),
('Japón'),
('India'),
('Australia');

-- Inserción en direcciones
INSERT INTO delivery_addresses (address) 
VALUES ('Av. Principal 123'),
('Calle Secundaria 456'),
('Paseo Central 789'),
('Rúa Mayor 321'),
('Plaza del Sol 654'),
('Av. Libertador 987'),
('Calle Real 135'),
('Rue de la Paix 246'),
('Hauptstraße 567'),
('Via Roma 876');

-- Inserción en tipo_telefono
INSERT INTO phone_types (name) 
VALUES ('Fijo'),
('Celular');

-- Inserción en estado_envio
INSERT INTO shipment_statuses (name) VALUES
('Recibido'),
('En tránsito'),
('Entregado'),
('Retenido en aduana');

-- Inserción en tipo_servicio
INSERT INTO service_types (name) 
VALUES ('Nacional'),
('Internacional'),
('Exprés'),
('Estándar');

-- Inserción en tipo_documentos
INSERT INTO document_types (name) 
VALUES ('Cédula de ciudadanía'),
('Cédula de extranjería'),
('Pasaporte');

-- Inserción en clientes
INSERT INTO customers (name, last_name, email) 
VALUES ('Juan', 'Pérez', 'juan.perez@example.com'),
('María', 'González', 'maria.gonzalez@example.com'),
('Pedro', 'Sánchez', 'pedro.sanchez@example.com'),
('Ana', 'López', 'ana.lopez@example.com'),
('Luis', 'Martínez', 'luis.martinez@example.com'),
('Laura', 'Rodríguez', 'laura.rodriguez@example.com'),
('Carlos', 'Fernández', 'carlos.fernandez@example.com'),
('Sofía', 'Gómez', 'sofia.gomez@example.com'),
('Diego', 'Díaz', 'diego.diaz@example.com'),
('Elena', 'Vargas', 'elena.vargas@example.com');

-- Inserción en destinatarios
INSERT INTO recipients (name, last_name, phone) 
VALUES ('José', 'Martínez', '555-1234'),
('María', 'López', '555-5678'),
('Carlos', 'González', '555-9012'),
('Ana', 'Pérez', '555-3456'),
('Javier', 'Rodríguez', '555-7890'),
('Laura', 'Hernández', '555-2345'),
('Juan', 'Díaz', '555-6789'),
('Elena', 'García', '555-8901'),
('Pedro', 'Sánchez', '555-4567'),
('Sofía', 'Fernández', '555-2341');

-- Inserción en marcas
INSERT INTO brands (name) 
VALUES ('Volvo'),
('Mercedes-Benz'),
('Scania'),
('MAN'),
('Iveco'),
('DAF'),
('Renault'),
('International'),
('Kenworth'),
('Mack');

-- Inserción en ciudades
INSERT INTO cities (name, country_id) 
VALUES ('Nueva York', 1),
('Los Ángeles', 1),
('Toronto', 2),
('Ciudad de México', 3),
('São Paulo', 4),
('Buenos Aires', 5),
('Santiago', 6),
('Lima', 7),
('Madrid', 8),
('París', 9),
('Berlín', 10),
('Roma', 11),
('Pekín', 12),
('Tokio', 13),
('Nueva Delhi', 14),
('Sídney', 15);

-- Inserción en sucursales
INSERT INTO branches (name, address, city_id) 
VALUES ('Sucursal Central Nueva York', '123 Main St', 1),
('Sucursal Central Los Ángeles', '456 Oak Ave', 2),
('Sucursal Central Toronto', '789 Elm Blvd', 3),
('Sucursal Central Ciudad de México', '321 Cedar Rd', 4),
('Sucursal Central São Paulo', '654 Pine Ln', 5),
('Sucursal Central Buenos Aires', '987 Maple Dr', 6),
('Sucursal Central Santiago', '135 Walnut Ct', 7),
('Sucursal Central Lima', '246 Birch Pl', 8),
('Sucursal Central Madrid', '567 Cedar Rd', 9),
('Sucursal Central París', '876 Oak Ave', 10),
('Sucursal Central Berlín', '987 Maple Dr', 11),
('Sucursal Central Roma', '234 Pine Ln', 12),
('Sucursal Central Pekín', '543 Elm Blvd', 13),
('Sucursal Central Tokio', '876 Birch Pl', 14),
('Sucursal Central Nueva Delhi', '123 Walnut Ct', 15);

-- Inserción en rutas
INSERT INTO routes (description) 
VALUES ('Ruta 1 - Nueva York a Los Ángeles'),
('Ruta 2 - Toronto a Ciudad de México'),
('Ruta 3 - São Paulo a Buenos Aires'),
('Ruta 4 - Santiago a Lima'),
('Ruta 5 - Madrid a París'),
('Ruta 6 - Berlín a Roma'),
('Ruta 7 - Pekín a Tokio'),
('Ruta 8 - Nueva Delhi a Sídney');

-- Inserción en sucursal_ruta
INSERT INTO driver_routes (branch_id, route_id) 
VALUES (1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 3),
(7, 3),
(8, 4),
(1, 5),
(2, 5),
(3, 6),
(4, 6),
(5, 7),
(6, 7),
(7, 8),
(8, 8);

-- Inserción en conductores
INSERT INTO drivers (document, document_type_id, name, last_name) 
VALUES ('12345678', 1, 'Pablo', 'Gómez'),
('87654321', 1, 'Andrés', 'López'),
('56789123', 1, 'Lucía', 'Fernández'),
('32109876', 1, 'Marcelo', 'Martínez'),
('65432109', 1, 'Valeria', 'Pérez');

-- Inserción en auxiliares
INSERT INTO assistants (document, document_type_id, name, last_name) 
VALUES ('98765432', 1, 'Julia', 'García'),
('23456789', 1, 'Roberto', 'Díaz'),
('89012345', 1, 'Camila', 'Hernández'),
('45678901', 1, 'Diego', 'Torres'),
('78901234', 1, 'Natalia', 'Ramírez');

-- Inserción en ruta_auxiliar
INSERT INTO assistant_routes (route_id, assistant_document) 
VALUES (1, '98765432'),
(1, '23456789'),
(2, '98765432'),
(2, '23456789'),
(3, '89012345'),
(3, '45678901'),
(4, '78901234'),
(4, '98765432'),
(5, '23456789'),
(5, '89012345'),
(6, '45678901'),
(6, '78901234'),
(7, '98765432'),
(7, '89012345'),
(8, '45678901'),
(8, '78901234');

-- Inserción en telefonos_clientes
INSERT INTO customer_phones (numero, cliente_id, id_tipo_telefono) 
VALUES ('555-1111', 1, 1),
('555-2222', 2, 2),
('555-3333', 3, 1),
('555-4444', 4, 2),
('555-5555', 5, 1),
('555-6666', 6, 2),
('555-7777', 7, 1),
('555-8888', 8, 2),
('555-9999', 9, 1),
('555-0000', 10, 2);

-- Inserción en direccion_destinatario
INSERT INTO delivery_addresses (id_direccion, id_destinatario) 
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserción en telefonos_conductores
INSERT INTO driver_phones (numero, conductor_documento, id_tipo_telefono) 
VALUES ('555-1111', '12345678', 1),
('555-2222', '87654321', 2),
('555-3333', '56789123', 1),
('555-4444', '32109876', 2),
('555-5555', '65432109', 1);

-- Inserción en telefonos_auxiliares
INSERT INTO assistant_phones (numero, auxiliar_documento, id_tipo_telefono) 
VALUES ('555-6666', '98765432', 1),
('555-7777', '23456789', 2),
('555-8888', '89012345', 1),
('555-9999', '45678901', 2),
('555-0000', '78901234', 1);

-- Inserción en paquetes
INSERT INTO packages (numero_seguimiento, peso, dimensiones, contenido, valor_declarado, id_tipo_servicio) 
VALUES ('PKG123456789', 5.25, '20x30x10 cm', 'Libros y documentos', 50.00, 1),
('PKG234567890', 8.75, '30x40x15 cm', 'Ropa y accesorios', 100.00, 2),
('PKG345678901', 3.50, '15x25x8 cm', 'Electrónicos', 75.00, 3),
('PKG456789012', 12.00, '40x50x20 cm', 'Juguetes y juegos', 120.00, 4),
('PKG567890123', 6.80, '25x35x12 cm', 'Productos delicados', 80.00, 1),
('PKG678901234', 4.00, '18x28x10 cm', 'Artículos de cocina', 60.00, 2),
('PKG789012345', 9.25, '35x45x18 cm', 'Equipamiento deportivo', 90.00, 3),
('PKG890123456', 7.50, '30x40x15 cm', 'Herramientas y construcción', 110.00, 4),
('PKG901234567', 5.00, '20x30x12 cm', 'Suministros de oficina', 70.00, 1),
('PKG012345678', 10.50, '40x60x25 cm', 'Plantas y flores', 130.00, 2);

-- Inserción en shipments
INSERT INTO shipments (customer_id, recipient_address_id, package_id, shipment_date, route_id, origin_branch_id, destination_branch_id, shipment_status_id) 
VALUES (1, 1, 1, '2024-06-20 09:00:00', 1, 1, 1, 1),
(2, 2, 2, '2024-06-21 10:00:00', 2, 2, 3, 1),
(3, 3, 3, '2024-06-22 11:00:00', 3, 3, 4, 1),
(4, 4, 4, '2024-06-23 12:00:00', 4, 4, 5, 1),
(5, 5, 5, '2024-06-24 13:00:00', 5, 5, 6, 1),
(6, 6, 6, '2024-06-25 14:00:00', 6, 6, 7, 1),
(7, 7, 7, '2024-06-26 15:00:00', 7, 7, 8, 1),
(8, 8, 8, '2024-06-27 16:00:00', 8, 8, 9, 1),
(9, 9, 9, '2024-06-28 17:00:00', 5, 9, 10, 1),
(10, 10, 10, '2024-06-29 18:00:00', 3, 10, 11, 1);

-- Inserción en tracking
INSERT INTO tracking (package_id, location, date_time, shipment_status_id) 
VALUES (1, 'Nueva York', '2024-06-20 10:00:00', 2),
(2, 'Los Ángeles', '2024-06-21 11:00:00', 2),
(3, 'Ciudad de México', '2024-06-22 12:00:00', 3),
(4, 'São Paulo', '2024-06-23 13:00:00', 4),
(5, 'Buenos Aires', '2024-06-24 14:00:00', 1),
(6, 'Santiago', '2024-06-25 15:00:00', 2),
(7, 'Lima', '2024-06-26 16:00:00', 3),
(8, 'Madrid', '2024-06-27 17:00:00', 4),
(9, 'París', '2024-06-28 18:00:00', 3),
(10, 'Berlín', '2024-06-29 19:00:00', 2);

-- Inserción en vehicle_models
INSERT INTO vehicle_models (name, brand_id) 
VALUES ('FH', 1),
('Actros', 2),
('R-Series', 3),
('TGX', 4),
('Stralis', 5),
('XF', 6),
('T', 7),
('Lonestar', 8),
('T680', 9),
('Anthem', 10);

-- Inserción en vehicles
INSERT INTO vehicles (placa, capacidad_carga, modelo_id, sucursal_id) 
VALUES ('ABC123', 5000.00, 1, 1),
('DEF456', 7000.00, 2, 2),
('GHI789', 6000.00, 3, 3),
('JKL012', 5500.00, 4, 4),
('MNO345', 6500.00, 1, 5),
('PQR678', 7500.00, 2, 6),
('STU901', 5800.00, 3, 7),
('VWX234', 6800.00, 4, 8);

-- Inserción en driver_routes
INSERT INTO driver_routes (documento_conductor, id_ruta, placa_vehiculo, id_sucursal) 
VALUES ('12345678', 1, 'ABC123', 2),
('12345678', 2, 'DEF456', 3),
('87654321', 3, 'GHI789', 5),
('87654321', 4, 'JKL012', 7),
('87654321', 5, 'MNO345', 3),
('87654321', 6, 'PQR678', 2),
('56789123', 7, 'STU901', 1),
('56789123', 8, 'VWX234', 5),
('32109876', 1, 'ABC123', 6),
('32109876', 2, 'DEF456', 9),
('65432109', 3, 'GHI789', 3),
('65432109', 4, 'JKL012', 5),
('65432109', 5, 'MNO345', 2),
('65432109', 6, 'PQR678', 9),
('65432109', 7, 'STU901', 7),
('65432109', 8, 'VWX234', 4);