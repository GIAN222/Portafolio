DROP TABLE IF EXISTS ocupaciones_has_persona, persona, ciudad_nacimiento, pais, tipo_documento, ocupaciones CASCADE;

CREATE TABLE pais(
    cod_pais INT not null,
    nombre_pais VARCHAR(35) NOT NULL,
    PRIMARY KEY (cod_pais)
);

CREATE TABLE tipo_documento(
    tipo_doc VARCHAR(5) NOT NULL,
    desc_tdoc VARCHAR(30) NOT NULL,
    PRIMARY KEY(tipo_doc)
);

CREATE TABLE ocupaciones (
    cod_ocupaciones INT NOT NULL,
    ocupacion VARCHAR(35) NOT NULL,
    PRIMARY KEY (cod_ocupaciones)
);

CREATE TABLE ciudad_nacimiento(
    cod_ciudad INT NOT NULL,
    fk_pais INT NOT NULL,
    ciudad VARCHAR(30) NOT NULL,
    PRIMARY KEY (cod_ciudad),
    FOREIGN KEY (fk_pais) REFERENCES pais (cod_pais)
);

CREATE TABLE persona (
    id_persona VARCHAR(15) NOT NULL,
    pnombre_persona VARCHAR(35) NOT NULL,
    snom_persona VARCHAR(35) NOT NULL,
    papell_persona VARCHAR(35) NOT NULL,
    sapell_persona VARCHAR(35) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fkpk_tdoc VARCHAR(5) NOT NULL,
    fk_lugar_nacimiento INT NOT NULL,
    PRIMARY KEY (id_persona,fkpk_tdoc),
    FOREIGN KEY (fkpk_tdoc) REFERENCES tipo_documento (tipo_doc),
    FOREIGN KEY (fk_lugar_nacimiento) REFERENCES ciudad_nacimiento (cod_ciudad)
);

CREATE TABLE ocupaciones_has_persona (
    pkfk_ocupacion INT NOT NULL,
    pkfk_tdoc VARCHAR(5) NOT NULL,
    pkfk_id_pers VARCHAR(15) NOT NULL,
    PRIMARY KEY(pkfk_ocupacion, pkfk_tdoc, pkfk_id_pers),
    FOREIGN KEY(pkfk_id_pers, pkfk_tdoc)REFERENCES persona(id_persona, fkpk_tdoc),
    FOREIGN KEY(pkfk_ocupacion)REFERENCES ocupaciones(cod_ocupaciones),
    FOREIGN KEY(pkfk_tdoc) REFERENCES tipo_documento(tipo_doc)
);


INSERT INTO tipo_documento (tipo_doc, desc_tdoc) VALUES ('CC', 'Cedula de Ciudadania');
INSERT INTO tipo_documento (tipo_doc, desc_tdoc) VALUES ('TI', 'Tarjeta de identidad');
INSERT INTO ocupaciones(cod_ocupaciones, ocupacion) VALUES ('1', 'Inegeniero de software');
INSERT INTO ocupaciones (cod_ocupaciones, ocupacion) VALUES ('2', 'Docente de apoyo');
INSERT INTO ocupaciones (cod_ocupaciones, ocupacion) VALUES ('3', 'Analista de Calidad');

INSERT INTO pais (cod_pais, nombre_pais) VALUES ('57', 'Colombia');
INSERT INTO ciudad_nacimiento (cod_ciudad, ciudad, fk_pais) VALUES ('11001', 'Bogota', '57');

-- 1. Creamos un ciudadano de prueba
INSERT INTO persona (id_persona, pnombre_persona, snom_persona, papell_persona, sapell_persona, fecha_nacimiento, fkpk_tdoc, fk_lugar_nacimiento) 
VALUES ('12345678', 'Juan', 'Carlos', 'Perez', 'Gomez', '1995-08-20', 'CC', 11001);

-- 2. Le asignamos su ocupación primaria (1 = Ingeniero de software)
INSERT INTO ocupaciones_has_persona (pkfk_ocupacion, pkfk_tdoc, pkfk_id_pers) 
VALUES (1, 'CC', '12345678');

-- 3. Le asignamos su ocupación secundaria (3 = Analista de Calidad)
INSERT INTO ocupaciones_has_persona (pkfk_ocupacion, pkfk_tdoc, pkfk_id_pers) 
VALUES (3, 'CC', '12345678');

-- 1. Catálogo "sucio" con espacios, errores tipográficos e inconsistencias
INSERT INTO pais (cod_pais, nombre_pais) VALUES 
(52, ' mexico '), 
(54, 'ARGENTINA_');

INSERT INTO ciudad_nacimiento (cod_ciudad, ciudad, fk_pais) VALUES 
(5001, 'Medellin ', 57), 
(9001, 'cdmx', 52), 
(1001, 'buenos Aires', 54),
(9999, '  Desconocida', 57);

INSERT INTO tipo_documento (tipo_doc, desc_tdoc) VALUES 
('CE', 'cedula de Extranjeria'), 
('PA', 'PASAPORTE ');

INSERT INTO ocupaciones (cod_ocupaciones, ocupacion) VALUES 
(4, 'Medico General'), 
(5, '  abogado'), 
(6, 'Comerciante Independiente '), 
(7, 'CONTADOR'),
(8, 'diseñador_grafico'),
(9, 'N/A');

-- 2. 60 Ciudadanos con datos atípicos, inconsistencias de texto y faltantes
INSERT INTO persona (id_persona, pnombre_persona, snom_persona, papell_persona, sapell_persona, fecha_nacimiento, fkpk_tdoc, fk_lugar_nacimiento) VALUES 
('10001', ' ana ', 'Maria', 'Gomez', 'Perez', '1990-05-14', 'CC', 11001),
('10002', 'LUIS', 'Alberto', 'RUIZ', 'Diaz', '1850-11-22', 'CC', 5001), -- Fecha atípica
('10003', 'Carlos', '', 'Lopez', 'Mendez', '1992-03-10', 'CC', 11001), -- Faltante
('10004', 'maria', 'Fernanda', 'castro', 'Rojas', '1988-07-30', 'CC', 5001),
('10005', 'Jorge', 'Ivan', 'Martinez', 'N/A', '2035-12-05', 'CC', 11001), -- Atípico y N/A
('10006', 'Laura', 'Daniela', 'Guzman', 'Vargas', '1998-02-18', 'CC', 11001),
('10007', ' diego', 'Alejandro', 'Herrera ', 'Soto', '1980-09-25', 'CC', 5001),
('10008', 'Paula', 'Andrea', 'Rios', '', '1993-06-12', 'CC', 11001),
('10009', 'Andres', 'FELIPE', 'Salazar', 'Osorio', '1987-04-08', 'CC', 5001),
('10010', 'Camila', 'Andrea', 'Morales', 'Pinto', '1996-10-15', 'CC', 11001),
('10011', 'Miguel', 'NO TIENE', 'Navarro', 'Cruz', '1991-08-20', 'CC', 9999), -- Ciudad Desconocida
('10012', 'Diana', 'Carolina', 'Romero', 'Bustos', '1989-01-28', 'CC', 5001),
('10013', 'javier', 'Enrique', 'Pena', 'Cortes', '1984-11-03', 'CC', 11001),
('10014', 'Natalia', ' Isabel', 'Suarez', 'Molina', '1997-05-19', 'CC', 5001),
('10015', 'Sebastian', 'Camilo', 'Ortiz', 'Vega', '1800-12-22', 'CC', 11001), -- Fecha atípica
('10016', 'Valeria', 'Sofia', 'Reyes', 'Campos', '1999-03-08', 'CC', 11001),
('10017', 'Oscar', 'David', 'Mendoza', 'Aguilar', '1982-07-14', 'CC', 5001),
('10018', 'DANIELA', 'Paz', 'BERMUDEZ', 'Luna', '1995-09-02', 'CC', 11001),
('10019', 'Esteban', 'Jose', 'Paredes', 'Acosta', '1986-04-27', 'CC', 5001),
('10020', 'Valentina', '', 'Medina', 'Rivas', '1998-11-11', 'CC', 11001),
('10021', 'Hugo', 'Leonardo', 'Vera', 'Pacheco', '1981-02-15', 'CC', 11001),
('10022', 'Juliana', 'Andrea', 'Caballero', 'Mejia', '1992-08-04', 'CC', 5001),
('10023', 'roberto', 'carlos', 'guerrero', 'montoya', '1979-10-30', 'CC', 11001), -- Todo minúscula
('10024', 'Marta', 'Lucia', 'Cardenas', 'Gil', '1983-05-21', 'CC', 5001),
('10025', 'Ricardo', 'Antonio', 'Rendon', 'N/A', '1990-12-09', 'CC', 11001),
('10026', 'Elena', 'Victoria', 'Castillo', 'Blandon', '1996-01-17', 'CC', 11001),
('10027', 'Felipe', 'Santiago', 'Ochoa', 'Arango', '1988-06-25', 'CC', 5001),
('10028', 'Angela', 'Maria', 'Escobar', 'Vallejo', '2040-03-12', 'CC', 11001), -- Fecha atípica
('10029', 'Tomas', 'Eduardo', 'Gomez', 'Quintero', '1997-09-28', 'CC', 5001),
('10030', 'Sofia', 'Catalina', 'Restrepo', 'Velez', '1999-07-06', 'CC', 11001),
('EX001', 'John', 'Edward', 'Smith', 'Doe', '1985-04-12', 'CE', 9001),
('EX002', 'Sarah', '', 'Connor', 'Miles', '1992-09-18', 'CE', 9001),
('EX003', 'Michael', 'Scott', 'Johnson', 'Ford', '1980-11-05', 'CE', 1001),
('EX004', 'Emily', 'Rose', 'Davis', 'Clark', '1995-02-22', 'CE', 1001),
('EX005', ' William ', 'James', 'Brown', 'Evans', '1988-07-14', 'CE', 9001),
('EX006', 'Emma', 'Louise', 'Wilson', 'Stone', '1993-12-01', 'CE', 1001),
('EX007', 'David', 'Alexander', 'Taylor', 'Black', '1982-05-30', 'CE', 9001),
('EX008', 'olivia', 'Grace', 'Anderson', 'White', '1997-10-08', 'CE', 1001),
('EX009', 'James', 'Robert', 'Thomas', 'Hall', '1899-03-25', 'CE', 9001), -- Fecha atípica
('EX010', 'Sophia', 'Marie', 'Jackson', 'Green', '1996-08-11', 'CE', 1001),
('PA001', 'Alejandro', 'Jose', 'Gimenez', 'Rios', '1987-01-15', 'PA', 1001),
('PA002', 'Valeria', 'Ines', 'Sosa', 'Pino', '1991-06-20', 'PA', 1001),
('PA003', 'Martin', 'Elias', 'Iglesias', 'N/A', '1984-10-09', 'PA', 1001),
('PA004', 'Camila', 'Belen', 'Domínguez', 'Vera', '1994-04-28', 'PA', 9001),
('PA005', 'Lucas', 'Matias', 'Rossi', 'Silva', '1986-12-03', 'PA', 1001),
('PA006', 'Florencia', 'Anahi', 'Ferrari', 'Lugo', '1998-02-14', 'PA', 9001),
('PA007', 'Joaquin', 'Pablo', 'Molina', 'Rey', '1983-08-07', 'PA', 1001),
('PA008', 'Martina', 'Lucia', 'Navarro', 'Paz', '1995-11-26', 'PA', 9001),
('PA009', 'EMILIO', 'Gaston', 'Romero', 'Solis', '1981-05-19', 'PA', 1001),
('PA010', 'Antonella', 'Maria', 'Bianchi', 'Cruz', '1992-09-30', 'PA', 9001),
('10031', 'Gabriel', 'Alonso', 'Cortes', 'Pena', '1990-03-05', 'CC', 11001),
('10032', 'Isabella', 'Victoria', 'Vega', 'Ortiz', '1996-07-22', 'CC', 5001),
('10033', 'Simon', 'Pedro', 'Aguilar', 'Mendoza', '1985-10-18', 'CC', 11001),
('10034', 'Luna', '', 'Luna', 'Bermudez', '1993-01-11', 'CC', 5001),
('10035', 'Mateo', 'Jesus', 'Acosta', 'Paredes', '1988-08-29', 'CC', 11001),
('10036', 'Zoe', 'Martina', 'Rivas', 'Medina', '1997-12-04', 'CC', 5001),
('10037', 'Samuel', 'David', 'Pacheco', 'Vera', '1982-05-25', 'CC', 11001),
('10038', 'Mia', 'Antonella', 'Mejia', 'Caballero', '1991-09-13', 'CC', 5001),
('10039', 'Benjamin', 'Andres', 'Montoya', 'Guerrero', '1987-02-08', 'CC', 11001),
('10040', 'Emma', 'Carolina', 'Gil', 'Cardenas', '1994-06-17', 'CC', 5001);

-- 3. Ocupaciones cruzadas (algunos tendrán profesiones "N/A" para ensuciar la data)
INSERT INTO ocupaciones_has_persona (pkfk_ocupacion, pkfk_tdoc, pkfk_id_pers) VALUES 
(1, 'CC', '10001'), (9, 'CC', '10001'), (4, 'CC', '10002'), (1, 'CC', '10003'),
(7, 'CC', '10003'), (5, 'CC', '10004'), (6, 'CC', '10005'), (8, 'CC', '10005'),
(1, 'CC', '10006'), (3, 'CC', '10007'), (6, 'CC', '10007'), (4, 'CC', '10008'),
(5, 'CC', '10009'), (7, 'CC', '10009'), (8, 'CC', '10010'), (1, 'CC', '10011'),
(3, 'CC', '10012'), (4, 'CC', '10012'), (6, 'CC', '10013'), (7, 'CC', '10014'),
(1, 'CC', '10015'), (5, 'CC', '10015'), (8, 'CC', '10016'), (3, 'CC', '10017'),
(4, 'CC', '10018'), (6, 'CC', '10018'), (1, 'CC', '10019'), (7, 'CC', '10020'),
(8, 'CC', '10020'), (5, 'CC', '10021'), (3, 'CC', '10022'), (6, 'CC', '10023'),
(4, 'CC', '10024'), (1, 'CC', '10024'), (7, 'CC', '10025'), (8, 'CC', '10026'),
(3, 'CC', '10027'), (5, 'CC', '10027'), (6, 'CC', '10028'), (1, 'CC', '10029'),
(4, 'CC', '10030'), (7, 'CC', '10030'), (1, 'CE', 'EX001'), (8, 'CE', 'EX002'),
(3, 'CE', 'EX003'), (6, 'CE', 'EX004'), (5, 'CE', 'EX004'), (4, 'CE', 'EX005'),
(7, 'CE', 'EX006'), (1, 'CE', 'EX007'), (8, 'CE', 'EX008'), (3, 'CE', 'EX009'),
(5, 'CE', 'EX009'), (6, 'CE', 'EX010'), (4, 'PA', 'PA001'), (7, 'PA', 'PA002'),
(1, 'PA', 'PA003'), (8, 'PA', 'PA004'), (3, 'PA', 'PA004'), (5, 'PA', 'PA005'),
(6, 'PA', 'PA006'), (4, 'PA', 'PA007'), (1, 'PA', 'PA007'), (7, 'PA', 'PA008'),
(8, 'PA', 'PA009'), (3, 'PA', 'PA010'), (5, 'PA', 'PA010'), (1, 'CC', '10031'),
(6, 'CC', '10032'), (4, 'CC', '10033'), (7, 'CC', '10033'), (8, 'CC', '10034'),
(9, 'CC', '10035'), (5, 'CC', '10036'), (1, 'CC', '10037'), (6, 'CC', '10037'),
(4, 'CC', '10038'), (7, 'CC', '10039'), (8, 'CC', '10040'), (3, 'CC', '10040');

UPDATE ciudad_nacimiento
SET ciudad = 'Bogotá'
WHERE cod_ciudad = '11001';

UPDATE tipo_documento
SET desc_tdoc = 'Cédula de ciudadania'
WHERE tipo_doc = 'CC';


DELETE FROM tipo_documento
WHERE tipo_doc = 'TI';

DELETE FROM ocupaciones
WHERE cod_ocupaciones = '2';

COPY (
    WITH Ocupaciones_Clasificadas AS (
        SELECT 
            ohp.pkfk_id_pers,
            ohp.pkfk_tdoc,
            o.ocupacion,
            ROW_NUMBER() OVER(PARTITION BY ohp.pkfk_id_pers, ohp.pkfk_tdoc ORDER BY ohp.pkfk_ocupacion) as num_ocupacion
        FROM 
            ocupaciones_has_persona ohp
        INNER JOIN 
            ocupaciones o ON ohp.pkfk_ocupacion = o.cod_ocupaciones
    )
    SELECT 
        p.fecha_nacimiento,
        td.desc_tdoc,
        ps.nombre_pais,
        cn.ciudad,
        MAX(CASE WHEN oc.num_ocupacion = 1 THEN oc.ocupacion ELSE NULL END) as ocupacion_primaria,
        MAX(CASE WHEN oc.num_ocupacion = 2 THEN oc.ocupacion ELSE NULL END) as ocupacion_secundaria
    FROM 
        persona p
    INNER JOIN 
        tipo_documento td ON p.fkpk_tdoc = td.tipo_doc
    INNER JOIN 
        ciudad_nacimiento cn ON p.fk_lugar_nacimiento = cn.cod_ciudad
    INNER JOIN 
        pais ps ON cn.fk_pais = ps.cod_pais
    LEFT JOIN 
        Ocupaciones_Clasificadas oc ON p.id_persona = oc.pkfk_id_pers AND p.fkpk_tdoc = oc.pkfk_tdoc
    GROUP BY 
        p.id_persona, p.fecha_nacimiento, td.desc_tdoc, ps.nombre_pais, cn.ciudad
) TO '/mnt/c/Users/User/Documents/Uniminuto/Semestre 4/practicas/proyecto 1/datos_censo_extraidos.csv' WITH CSV HEADER;



