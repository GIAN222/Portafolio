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


