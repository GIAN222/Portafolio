
CREATE TABLE tipos_habitacion (
    id_tipo_habitacion INT NOT NULL,
    nombre_tipo VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_tipo_habitacion)
);
CREATE TABLE tipos_cliente (
    id_tipo_cliente INT NOT NULL,
    cliente_tipo VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_tipo_cliente)
);
CREATE TABLE empleados (
    id_empleados INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    celular VARCHAR(50),
    fecha_cumpleanos DATE NOT NULL,
    PRIMARY KEY(id_empleados)
);
CREATE TABLE clientes(
    id_clientes SERIAL NOT NULL,
    tipo_identificacion VARCHAR(20) NOT NULL,
    numero_identificacion INT NOT NULL, 
    id_tipo_cliente INT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    fecha_cumpleanos DATE,
    correo_electronico  VARCHAR(50) NOT NULL,
    primary key(id_clientes),
    foreign key(id_tipo_cliente) REFERENCES tipos_cliente(id_tipo_cliente)
);
CREATE TABLE habitaciones(
    numero_habitacion VARCHAR(20) NOT NULL,
    id_tipo_habitacion INT NOT NULL,
    PRIMARY KEY(numero_habitacion),
    FOREIGN KEY(id_tipo_habitacion) REFERENCES tipos_habitacion(id_tipo_habitacion)
);
CREATE TABLE reservas(
    id_reserva SERIAL NOT NULL,
    id_cliente INT NOT NULL,
    numero_habitacion VARCHAR(20) NOT NULL,
    id_empleados INT NOT NULL,
    fecha_llegada DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    PRIMARY KEY(id_reserva),
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_clientes),
    FOREIGN KEY(id_empleados) REFERENCES empleados(id_empleados),
    FOREIGN KEY(numero_habitacion) REFERENCES habitaciones(numero_habitacion)
);



-- ====================================================================
-- FASE 1: POBLAR CATÁLOGOS INDEPENDIENTES
-- ====================================================================

INSERT INTO tipos_habitacion (id_tipo_habitacion, nombre_tipo) VALUES 
(1, 'Sencilla'),
(2, 'Doble'),
(3, 'Familiar');

INSERT INTO tipos_cliente (id_tipo_cliente, cliente_tipo) VALUES 
(1, 'Frecuente'),
(2, 'Esporádico');

-- ====================================================================
-- FASE 2: POBLAR ENTIDADES FUERTES
-- ====================================================================

INSERT INTO empleados (id_empleados, nombre, apellido, celular, fecha_cumpleanos) VALUES 
(101, 'Carlos', 'Mendoza', '3157894512', '1990-05-12'),
(102, 'Ana', 'María Restrepo', '3204567891', '1995-10-25');

-- Nota: Como id_clientes es SERIAL, omitimos el ID para que Postgres lo genere solo (1, 2...)
INSERT INTO clientes (tipo_identificacion, numero_identificacion, id_tipo_cliente, nombre, apellido, telefono, fecha_cumpleanos, correo_electronico) VALUES 
('CC', 101456789, 1, 'Giancarlo', 'Gómez', '3001234567', '1985-03-15', 'giancarlo@email.com'),
('CE', 987654321, 2, 'John', 'Doe', '3119876543', '1992-07-22', 'john.doe@email.com');

-- ====================================================================
-- FASE 3: POBLAR ENTIDADES DEPENDIENTES
-- ====================================================================

INSERT INTO habitaciones (numero_habitacion, id_tipo_habitacion) VALUES 
('101', 1), -- Habitación 101 es Sencilla
('202', 2), -- Habitación 202 es Doble
('303', 3); -- Habitación 303 es Familiar

-- Nota: id_reserva también es SERIAL, se genera automáticamente
INSERT INTO reservas (id_cliente, numero_habitacion, id_empleados, fecha_llegada, fecha_salida) VALUES 
(1, '202', 101, '2026-06-01', '2026-06-05'), -- Giancarlo reserva la Doble con Carlos
(2, '101', 102, '2026-06-10', '2026-06-12'); -- John Doe reserva la Sencilla con Ana
