CREATE DATABASE BD_FAZENDA_INTELIGENTE_TESTE_DE_MESA;
USE BD_FAZENDA_INTELIGENTE_TESTE_DE_MESA;

CREATE TABLE USUARIOS (
    CPF VARCHAR(14) PRIMARY KEY UNIQUE,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(100) UNIQUE NOT NULL,
    SENHA VARCHAR(255) NOT NULL,
    PERFIL VARCHAR(50),
    DATA_CADASTRO DATETIME DEFAULT CURRENT_TIMESTAMP,
    STATUS VARCHAR(20)
);

CREATE TABLE FAZENDA (
    ID_FAZENDA INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    LATITUDE DECIMAL(10, 8),
    LONGITUDE DECIMAL(11, 8),
    LOGRADOURO VARCHAR(150),
    NUMERO VARCHAR(10),
    CEP VARCHAR(10),
    AREA_TOTAL DECIMAL(10, 2)
);

CREATE TABLE USUARIOS_FAZENDA (
    ID_USUARIO_FAZENDA INT AUTO_INCREMENT PRIMARY KEY,
    ID_CPF_USUARIOS VARCHAR(14),
    ID_FAZENDA INT,
    CONSTRAINT FK_USUARIO
        FOREIGN KEY (ID_CPF_USUARIOS)
        REFERENCES USUARIOS(CPF)
        ON DELETE CASCADE,
    CONSTRAINT FK_FAZENDA
        FOREIGN KEY (ID_FAZENDA)
        REFERENCES FAZENDA(ID_FAZENDA)
        ON DELETE CASCADE,
    CONSTRAINT UK_USUARIO_FAZENDA
        UNIQUE(ID_CPF_USUARIOS, ID_FAZENDA)
);

CREATE TABLE CULTURA (
    ID_CULTURA INT PRIMARY KEY AUTO_INCREMENT,
    NOME_CULTURA VARCHAR(100) NOT NULL,
    DATA_PLANTIO DATE,
    CICLO_PRODUTIVO VARCHAR(50),
    AREA_CULTIVADA VARCHAR(50),
    TIPO_CULTURA VARCHAR(50),
    SENSOR_LUZ VARCHAR(50),
    SENSOR_CLIMA_TEMPO VARCHAR(50),
    SENSOR_CLIMA_UMIDADE VARCHAR(50),
    SENSOR_SOLO VARCHAR(50),
    STATUS VARCHAR(20),
    FK_ID_FAZENDA INT,
    FOREIGN KEY (FK_ID_FAZENDA)
        REFERENCES FAZENDA(ID_FAZENDA)
        ON DELETE CASCADE
);

CREATE TABLE SENSOR (
    ID_SENSOR INT PRIMARY KEY AUTO_INCREMENT,
    NOME_SENSOR VARCHAR(100) NOT NULL,
    TIPO_SENSOR VARCHAR(50) NOT NULL,
    UNIDADE_MEDIDA VARCHAR(20),
    STATUS VARCHAR(20),
    DATA_INSTALACAO DATE,
    FK_ID_CULTURA INT,
    FOREIGN KEY (FK_ID_CULTURA)
        REFERENCES CULTURA(ID_CULTURA)
        ON DELETE CASCADE
);

CREATE TABLE LEITURA_SENSOR (
    ID_LEITURA INT PRIMARY KEY AUTO_INCREMENT,
    VALOR VARCHAR(50),
    DATA_HORA DATETIME DEFAULT CURRENT_TIMESTAMP,
    FK_ID_SENSOR INT,
    FOREIGN KEY (FK_ID_SENSOR)
        REFERENCES SENSOR(ID_SENSOR)
        ON DELETE CASCADE
);

CREATE TABLE ALERTA (
    ID_ALERTA INT PRIMARY KEY AUTO_INCREMENT,
    TIPO_ALERTA VARCHAR(50),
    DESCRICAO TEXT,
    NIVEL_GRAVIDADE VARCHAR(20),
    DATA_HORA DATETIME,
    STATUS VARCHAR(20),
    FK_ID_SENSOR INT,
    FOREIGN KEY (FK_ID_SENSOR)
        REFERENCES SENSOR(ID_SENSOR)
        ON DELETE CASCADE
);

-- =========================================================
-- USUARIOS
-- =========================================================

INSERT INTO USUARIOS
(CPF, NOME, EMAIL, SENHA, PERFIL, DATA_CADASTRO, STATUS) VALUES
('916.940.169-98', 'Administrador FARMI', 'admin@farmi.com', '$2y$10$s7fCI0kA6V3r9i0LFKLk8O/yR7oH70zdDgH32tL5kZ06u9N6wW/tC', 'Gestor', '2026-08-01 08:00:00', 'Ativo'),
('482.634.448-10', 'Isabella Silva Fernandes', 'isabella@farmi.com', '$2y$10$s7fCI0kA6V3r9i0LFKLk8O/yR7oH70zdDgH32tL5kZ06u9N6wW/tC', 'Gestor', '2026-08-02 08:30:00', 'Ativo'),
('523.924.528-22', 'Vinícius Bruno de Lima', 'vinicius@farmi.com', '$2y$10$s7fCI0kA6V3r9i0LFKLk8O/yR7oH70zdDgH32tL5kZ06u9N6wW/tC', 'Gestor', '2026-08-03 09:00:00', 'Ativo'),
('489.163.058-29', 'Maria Clara Uliana Braga', 'maria@farmi.com', '$2y$10$s7fCI0kA6V3r9i0LFKLk8O/yR7oH70zdDgH32tL5kZ06u9N6wW/tC', 'Funcionário', '2026-08-04 09:15:00', 'Ativo'),
('415.314.468-17', 'Thaiene Tessaro', 'thaiene@farmi.com', '$2y$10$s7fCI0kA6V3r9i0LFKLk8O/yR7oH70zdDgH32tL5kZ06u9N6wW/tC', 'Funcionário', '2026-08-05 10:00:00', 'Ativo'),
('440.209.048-20', 'Paula Silva Zito', 'paula@farmi.com', '$2y$10$s7fCI0kA6V3r9i0LFKLk8O/yR7oH70zdDgH32tL5kZ06u9N6wW/tC', 'Funcionário', '2026-08-06 10:20:00', 'Ativo'),
('965.599.515-20', 'Gabriel Evaristo', 'gabriel@farmi.com', '$2y$10$s7fCI0kA6V3r9i0LFKLk8O/yR7oH70zdDgH32tL5kZ06u9N6wW/tC', 'Funcionário', '2026-08-07 11:00:00', 'Ativo'),
('452.198.098-81', 'Vitor Delduca Fernandes', 'vitor@farmi.com', '$2y$10$s7fCI0kA6V3r9i0LFKLk8O/yR7oH70zdDgH32tL5kZ06u9N6wW/tC', 'Gestor', '2026-08-08 11:30:00', 'Ativo');


-- =========================================================
-- FAZENDA
-- =========================================================

INSERT INTO FAZENDA
(ID_FAZENDA, NOME, LATITUDE, LONGITUDE, LOGRADOURO, NUMERO, CEP, AREA_TOTAL) VALUES
(1, 'Fazenda Santa Helena', -15.66500000, -49.06200000, 'Rodovia GO-080', '1200', '76380-000', 514.29),
(2, 'Fazenda Boa Esperança', -20.12000000, -47.49100000, 'Estrada Municipal Barreto', '450', '14780-000', 378.36),
(3, 'Fazenda Vale Verde', -16.67800000, -49.25600000, 'Estrada Rural Norte', '800', '74000-000', 285.40),
(4, 'Fazenda Primavera', -18.91200000, -48.27700000, 'Estrada do Cerrado', '320', '38400-000', 196.50);


-- =========================================================
-- USUARIOS_FAZENDA
-- =========================================================

INSERT INTO USUARIOS_FAZENDA
(ID_CPF_USUARIOS, ID_FAZENDA) VALUES
('916.940.169-98', 1),
('916.940.169-98', 2),
('916.940.169-98', 3),
('916.940.169-98', 4),

('482.634.448-10', 2),
('482.634.448-10', 4),

('523.924.528-22', 1),

('489.163.058-29', 3),
('489.163.058-29', 4),

('415.314.468-17', 2),
('415.314.468-17', 3),

('440.209.048-20', 1),

('965.599.515-20', 3),

('452.198.098-81', 4);


-- =========================================================
-- CULTURA
-- =========================================================

INSERT INTO CULTURA
(ID_CULTURA, NOME_CULTURA, DATA_PLANTIO, CICLO_PRODUTIVO, AREA_CULTIVADA,
TIPO_CULTURA, SENSOR_LUZ, SENSOR_CLIMA_TEMPO, SENSOR_CLIMA_UMIDADE,
SENSOR_SOLO, STATUS, FK_ID_FAZENDA) VALUES

(1, 'Milho', '2026-06-01', '120', '18.00', 'Grãos', '500', '28', '65', '70', 'Ativa', 1),
(2, 'Soja', '2026-06-05', '110', '22.00', 'Grãos', '450', '26', '70', '68', 'Ativa', 2),

(3, 'Tomate', '2026-06-10', '90', '12.00', 'Hortaliças', '700', '24', '75', '80', 'Ativa', 2),
(4, 'Café', '2026-05-20', '240', '25.00', 'Cultivo Permanente', '800', '23', '72', '75', 'Ativa', 2),

(5, 'Feijão', '2026-06-12', '95', '15.00', 'Grãos', '600', '25', '70', '65', 'Ativa', 3),
(6, 'Algodão', '2026-06-15', '160', '30.00', 'Fibras', '650', '27', '60', '65', 'Ativa', 3),

(7, 'Trigo', '2026-06-18', '130', '20.00', 'Cereais', '550', '22', '68', '70', 'Ativa', 4),
(8, 'Alface', '2026-07-01', '60', '5.00', 'Hortaliças', '400', '21', '78', '82', 'Ativa', 4);


-- =========================================================
-- SENSOR
-- =========================================================

INSERT INTO SENSOR
(ID_SENSOR, NOME_SENSOR, TIPO_SENSOR, UNIDADE_MEDIDA, STATUS, DATA_INSTALACAO, FK_ID_CULTURA) VALUES

-- CULTURA 1 - MILHO
(1, 'DHT11 - Temperatura Milho', 'Temperatura', '°C', 'Ativo', '2026-06-01', 1),
(2, 'DHT11 - Umidade Milho', 'Umidade', '%', 'Ativo', '2026-06-01', 1),
(3, 'Higrômetro - Solo Milho', 'Solo', '%', 'Ativo', '2026-06-01', 1),
(4, 'LDR - Luminosidade Milho', 'Luz', 'lux', 'Ativo', '2026-06-01', 1),

-- CULTURA 2 - SOJA
(5, 'DHT11 - Temperatura Soja', 'Temperatura', '°C', 'Ativo', '2026-06-05', 2),
(6, 'DHT11 - Umidade Soja', 'Umidade', '%', 'Ativo', '2026-06-05', 2),
(7, 'Higrômetro - Solo Soja', 'Solo', '%', 'Ativo', '2026-06-05', 2),
(8, 'LDR - Luminosidade Soja', 'Luz', 'lux', 'Ativo', '2026-06-05', 2),

-- CULTURA 3 - TOMATE
(9, 'DHT11 - Temperatura Tomate', 'Temperatura', '°C', 'Ativo', '2026-06-10', 3),
(10, 'DHT11 - Umidade Tomate', 'Umidade', '%', 'Ativo', '2026-06-10', 3),
(11, 'Higrômetro - Solo Tomate', 'Solo', '%', 'Ativo', '2026-06-10', 3),
(12, 'LDR - Luminosidade Tomate', 'Luz', 'lux', 'Ativo', '2026-06-10', 3),

-- CULTURA 4 - CAFÉ
(13, 'DHT11 - Temperatura Café', 'Temperatura', '°C', 'Ativo', '2026-05-20', 4),
(14, 'DHT11 - Umidade Café', 'Umidade', '%', 'Ativo', '2026-05-20', 4),
(15, 'Higrômetro - Solo Café', 'Solo', '%', 'Ativo', '2026-05-20', 4),
(16, 'LDR - Luminosidade Café', 'Luz', 'lux', 'Ativo', '2026-05-20', 4),

-- CULTURA 5 - FEIJÃO
(17, 'DHT11 - Temperatura Feijão', 'Temperatura', '°C', 'Ativo', '2026-06-12', 5),
(18, 'DHT11 - Umidade Feijão', 'Umidade', '%', 'Ativo', '2026-06-12', 5),
(19, 'Higrômetro - Solo Feijão', 'Solo', '%', 'Ativo', '2026-06-12', 5),
(20, 'LDR - Luminosidade Feijão', 'Luz', 'lux', 'Ativo', '2026-06-12', 5),

-- CULTURA 6 - ALGODÃO
(21, 'DHT11 - Temperatura Algodão', 'Temperatura', '°C', 'Ativo', '2026-06-15', 6),
(22, 'DHT11 - Umidade Algodão', 'Umidade', '%', 'Ativo', '2026-06-15', 6),
(23, 'Higrômetro - Solo Algodão', 'Solo', '%', 'Ativo', '2026-06-15', 6),
(24, 'LDR - Luminosidade Algodão', 'Luz', 'lux', 'Ativo', '2026-06-15', 6),

-- CULTURA 7 - TRIGO
(25, 'DHT11 - Temperatura Trigo', 'Temperatura', '°C', 'Ativo', '2026-06-18', 7),
(26, 'DHT11 - Umidade Trigo', 'Umidade', '%', 'Ativo', '2026-06-18', 7),
(27, 'Higrômetro - Solo Trigo', 'Solo', '%', 'Ativo', '2026-06-18', 7),
(28, 'LDR - Luminosidade Trigo', 'Luz', 'lux', 'Ativo', '2026-06-18', 7),

-- CULTURA 8 - ALFACE
(29, 'DHT11 - Temperatura Alface', 'Temperatura', '°C', 'Ativo', '2026-07-01', 8),
(30, 'DHT11 - Umidade Alface', 'Umidade', '%', 'Ativo', '2026-07-01', 8),
(31, 'Higrômetro - Solo Alface', 'Solo', '%', 'Ativo', '2026-07-01', 8),
(32, 'LDR - Luminosidade Alface', 'Luz', 'lux', 'Ativo', '2026-07-01', 8);


-- =========================================================
-- LEITURA_SENSOR
-- 5 LEITURAS PARA CADA SENSOR
-- =========================================================

INSERT INTO LEITURA_SENSOR
(ID_LEITURA, VALOR, DATA_HORA, FK_ID_SENSOR) VALUES

-- MILHO
(1, '27.4', '2026-09-21 10:00:00', 1),
(2, '27.6', '2026-09-21 10:01:00', 1),
(3, '27.8', '2026-09-21 10:02:00', 1),
(4, '27.5', '2026-09-21 10:03:00', 1),
(5, '27.7', '2026-09-21 10:04:00', 1),

(6, '68.5', '2026-09-21 10:00:00', 2),
(7, '68.2', '2026-09-21 10:01:00', 2),
(8, '67.9', '2026-09-21 10:02:00', 2),
(9, '68.1', '2026-09-21 10:03:00', 2),
(10, '67.8', '2026-09-21 10:04:00', 2),

(11, '72', '2026-09-21 10:00:00', 3),
(12, '71', '2026-09-21 10:01:00', 3),
(13, '70', '2026-09-21 10:02:00', 3),
(14, '69', '2026-09-21 10:03:00', 3),
(15, '68', '2026-09-21 10:04:00', 3),

(16, '12450', '2026-09-21 10:00:00', 4),
(17, '13120', '2026-09-21 10:01:00', 4),
(18, '13800', '2026-09-21 10:02:00', 4),
(19, '14250', '2026-09-21 10:03:00', 4),
(20, '14900', '2026-09-21 10:04:00', 4),

-- SOJA
(21, '25.8', '2026-09-21 10:00:00', 5),
(22, '26.0', '2026-09-21 10:01:00', 5),
(23, '26.2', '2026-09-21 10:02:00', 5),
(24, '26.1', '2026-09-21 10:03:00', 5),
(25, '26.4', '2026-09-21 10:04:00', 5),

(26, '71.2', '2026-09-21 10:00:00', 6),
(27, '70.8', '2026-09-21 10:01:00', 6),
(28, '70.5', '2026-09-21 10:02:00', 6),
(29, '70.1', '2026-09-21 10:03:00', 6),
(30, '69.8', '2026-09-21 10:04:00', 6),

(31, '65', '2026-09-21 10:00:00', 7),
(32, '66', '2026-09-21 10:01:00', 7),
(33, '66', '2026-09-21 10:02:00', 7),
(34, '67', '2026-09-21 10:03:00', 7),
(35, '67', '2026-09-21 10:04:00', 7),

(36, '9800', '2026-09-21 10:00:00', 8),
(37, '10500', '2026-09-21 10:01:00', 8),
(38, '11200', '2026-09-21 10:02:00', 8),
(39, '11900', '2026-09-21 10:03:00', 8),
(40, '12700', '2026-09-21 10:04:00', 8),

-- TOMATE
(41, '23.6', '2026-09-21 10:00:00', 9),
(42, '23.8', '2026-09-21 10:01:00', 9),
(43, '24.0', '2026-09-21 10:02:00', 9),
(44, '24.2', '2026-09-21 10:03:00', 9),
(45, '24.1', '2026-09-21 10:04:00', 9),

(46, '76.4', '2026-09-21 10:00:00', 10),
(47, '75.9', '2026-09-21 10:01:00', 10),
(48, '75.6', '2026-09-21 10:02:00', 10),
(49, '75.2', '2026-09-21 10:03:00', 10),
(50, '74.9', '2026-09-21 10:04:00', 10),

(51, '81', '2026-09-21 10:00:00', 11),
(52, '80', '2026-09-21 10:01:00', 11),
(53, '79', '2026-09-21 10:02:00', 11),
(54, '78', '2026-09-21 10:03:00', 11),
(55, '77', '2026-09-21 10:04:00', 11),

(56, '5600', '2026-09-21 10:00:00', 12),
(57, '6200', '2026-09-21 10:01:00', 12),
(58, '6900', '2026-09-21 10:02:00', 12),
(59, '7500', '2026-09-21 10:03:00', 12),
(60, '8200', '2026-09-21 10:04:00', 12),

-- CAFÉ
(61, '22.7', '2026-09-21 10:00:00', 13),
(62, '22.9', '2026-09-21 10:01:00', 13),
(63, '23.1', '2026-09-21 10:02:00', 13),
(64, '23.0', '2026-09-21 10:03:00', 13),
(65, '23.3', '2026-09-21 10:04:00', 13),

(66, '74.1', '2026-09-21 10:00:00', 14),
(67, '73.8', '2026-09-21 10:01:00', 14),
(68, '73.5', '2026-09-21 10:02:00', 14),
(69, '73.2', '2026-09-21 10:03:00', 14),
(70, '72.9', '2026-09-21 10:04:00', 14),

(71, '78', '2026-09-21 10:00:00', 15),
(72, '77', '2026-09-21 10:01:00', 15),
(73, '76', '2026-09-21 10:02:00', 15),
(74, '75', '2026-09-21 10:03:00', 15),
(75, '74', '2026-09-21 10:04:00', 15),

(76, '7200', '2026-09-21 10:00:00', 16),
(77, '7900', '2026-09-21 10:01:00', 16),
(78, '8500', '2026-09-21 10:02:00', 16),
(79, '9100', '2026-09-21 10:03:00', 16),
(80, '9800', '2026-09-21 10:04:00', 16),

-- FEIJÃO
(81, '26.2', '2026-09-21 10:00:00', 17),
(82, '26.4', '2026-09-21 10:01:00', 17),
(83, '26.5', '2026-09-21 10:02:00', 17),
(84, '26.7', '2026-09-21 10:03:00', 17),
(85, '26.6', '2026-09-21 10:04:00', 17),

(86, '69.4', '2026-09-21 10:00:00', 18),
(87, '69.0', '2026-09-21 10:01:00', 18),
(88, '68.7', '2026-09-21 10:02:00', 18),
(89, '68.4', '2026-09-21 10:03:00', 18),
(90, '68.0', '2026-09-21 10:04:00', 18),

(91, '67', '2026-09-21 10:00:00', 19),
(92, '66', '2026-09-21 10:01:00', 19),
(93, '65', '2026-09-21 10:02:00', 19),
(94, '64', '2026-09-21 10:03:00', 19),
(95, '63', '2026-09-21 10:04:00', 19),

(96, '10500', '2026-09-21 10:00:00', 20),
(97, '11200', '2026-09-21 10:01:00', 20),
(98, '12000', '2026-09-21 10:02:00', 20),
(99, '12800', '2026-09-21 10:03:00', 20),
(100, '13600', '2026-09-21 10:04:00', 20),

-- ALGODÃO
(101, '28.3', '2026-09-21 10:00:00', 21),
(102, '28.5', '2026-09-21 10:01:00', 21),
(103, '28.7', '2026-09-21 10:02:00', 21),
(104, '28.9', '2026-09-21 10:03:00', 21),
(105, '29.0', '2026-09-21 10:04:00', 21),

(106, '63.7', '2026-09-21 10:00:00', 22),
(107, '63.3', '2026-09-21 10:01:00', 22),
(108, '62.9', '2026-09-21 10:02:00', 22),
(109, '62.5', '2026-09-21 10:03:00', 22),
(110, '62.1', '2026-09-21 10:04:00', 22),

(111, '61', '2026-09-21 10:00:00', 23),
(112, '60', '2026-09-21 10:01:00', 23),
(113, '59', '2026-09-21 10:02:00', 23),
(114, '58', '2026-09-21 10:03:00', 23),
(115, '57', '2026-09-21 10:04:00', 23),

(116, '15400', '2026-09-21 10:00:00', 24),
(117, '16200', '2026-09-21 10:01:00', 24),
(118, '17100', '2026-09-21 10:02:00', 24),
(119, '18000', '2026-09-21 10:03:00', 24),
(120, '18900', '2026-09-21 10:04:00', 24),

-- TRIGO
(121, '24.5', '2026-09-21 10:00:00', 25),
(122, '24.7', '2026-09-21 10:01:00', 25),
(123, '24.8', '2026-09-21 10:02:00', 25),
(124, '25.0', '2026-09-21 10:03:00', 25),
(125, '24.9', '2026-09-21 10:04:00', 25),

(126, '70.6', '2026-09-21 10:00:00', 26),
(127, '70.2', '2026-09-21 10:01:00', 26),
(128, '69.9', '2026-09-21 10:02:00', 26),
(129, '69.5', '2026-09-21 10:03:00', 26),
(130, '69.2', '2026-09-21 10:04:00', 26),

(131, '73', '2026-09-21 10:00:00', 27),
(132, '72', '2026-09-21 10:01:00', 27),
(133, '71', '2026-09-21 10:02:00', 27),
(134, '70', '2026-09-21 10:03:00', 27),
(135, '69', '2026-09-21 10:04:00', 27),

(136, '11300', '2026-09-21 10:00:00', 28),
(137, '12000', '2026-09-21 10:01:00', 28),
(138, '12800', '2026-09-21 10:02:00', 28),
(139, '13600', '2026-09-21 10:03:00', 28),
(140, '14400', '2026-09-21 10:04:00', 28),

-- ALFACE
(141, '21.9', '2026-09-21 10:00:00', 29),
(142, '22.1', '2026-09-21 10:01:00', 29),
(143, '22.3', '2026-09-21 10:02:00', 29),
(144, '22.2', '2026-09-21 10:03:00', 29),
(145, '22.4', '2026-09-21 10:04:00', 29),

(146, '79.2', '2026-09-21 10:00:00', 30),
(147, '78.8', '2026-09-21 10:01:00', 30),
(148, '78.5', '2026-09-21 10:02:00', 30),
(149, '78.1', '2026-09-21 10:03:00', 30),
(150, '77.8', '2026-09-21 10:04:00', 30),

(151, '84', '2026-09-21 10:00:00', 31),
(152, '83', '2026-09-21 10:01:00', 31),
(153, '82', '2026-09-21 10:02:00', 31),
(154, '81', '2026-09-21 10:03:00', 31),
(155, '80', '2026-09-21 10:04:00', 31),

(156, '4200', '2026-09-21 10:00:00', 32),
(157, '4700', '2026-09-21 10:01:00', 32),
(158, '5200', '2026-09-21 10:02:00', 32),
(159, '5700', '2026-09-21 10:03:00', 32),
(160, '6200', '2026-09-21 10:04:00', 32);


-- =========================================================
-- ALERTA
-- =========================================================

INSERT INTO ALERTA
(ID_ALERTA, TIPO_ALERTA, DESCRICAO, NIVEL_GRAVIDADE, DATA_HORA, STATUS, FK_ID_SENSOR) VALUES
(5, 'Temperatura alta', 'Temperatura acima do limite configurado para a soja.', 'Alta', '2026-09-21 08:50:00', 'Ativo', 5),
(6, 'Umidade alta', 'Umidade do ar acima do limite configurado.', 'Média', '2026-09-21 09:00:00', 'Ativo', 6),
(7, 'Solo seco', 'Umidade do solo abaixo do limite recomendado.', 'Alta', '2026-09-21 09:10:00', 'Ativo', 7),
(8, 'Luminosidade baixa', 'Baixa incidência de luz detectada.', 'Baixa', '2026-09-21 09:20:00', 'Resolvido', 8),
(9, 'Temperatura alta', 'Temperatura acima do limite configurado para o tomate.', 'Alta', '2026-09-21 09:30:00', 'Ativo', 9),
(10, 'Umidade baixa', 'Umidade do ar abaixo do recomendado.', 'Média', '2026-09-21 09:40:00', 'Ativo', 10),
(11, 'Solo muito úmido', 'Umidade do solo acima do limite configurado.', 'Média', '2026-09-21 09:50:00', 'Resolvido', 11),
(12, 'Luminosidade baixa', 'Luminosidade insuficiente para a cultura.', 'Baixa', '2026-09-21 10:00:00', 'Resolvido', 12),
(13, 'Temperatura alta', 'Temperatura elevada detectada na cultura do café.', 'Alta', '2026-09-21 10:10:00', 'Ativo', 13),
(14, 'Umidade baixa', 'Umidade abaixo do limite configurado.', 'Média', '2026-09-21 10:20:00', 'Ativo', 14),
(15, 'Solo seco', 'Necessidade de irrigação detectada.', 'Alta', '2026-09-21 10:30:00', 'Ativo', 15),
(16, 'Luminosidade alta', 'Excesso de luminosidade detectado.', 'Média', '2026-09-21 10:40:00', 'Resolvido', 16),
(17, 'Temperatura baixa', 'Temperatura abaixo do recomendado.', 'Baixa', '2026-09-21 10:50:00', 'Resolvido', 17),
(18, 'Umidade alta', 'Umidade do ar acima do limite.', 'Média', '2026-09-21 11:00:00', 'Ativo', 18),
(19, 'Solo seco', 'Umidade do solo abaixo do limite.', 'Alta', '2026-09-21 11:05:00', 'Ativo', 19),
(20, 'Luminosidade baixa', 'Baixa luminosidade detectada.', 'Baixa', '2026-09-21 11:10:00', 'Resolvido', 20),
(21, 'Temperatura alta', 'Temperatura acima do limite configurado.', 'Alta', '2026-09-21 11:15:00', 'Ativo', 21),
(22, 'Umidade baixa', 'Umidade do ar abaixo do limite.', 'Média', '2026-09-21 11:16:00', 'Ativo', 22),
(23, 'Solo seco', 'Umidade do solo insuficiente.', 'Alta', '2026-09-21 11:17:00', 'Ativo', 23),
(24, 'Luminosidade alta', 'Excesso de luminosidade detectado.', 'Média', '2026-09-21 11:18:00', 'Resolvido', 24),
(25, 'Temperatura alta', 'Temperatura acima do limite.', 'Alta', '2026-09-21 11:19:00', 'Ativo', 25),
(26, 'Umidade alta', 'Umidade do ar acima do limite.', 'Média', '2026-09-21 11:20:00', 'Resolvido', 26),
(27, 'Solo muito úmido', 'Umidade do solo acima do limite.', 'Média', '2026-09-21 11:21:00', 'Resolvido', 27),
(28, 'Luminosidade baixa', 'Luminosidade abaixo do limite.', 'Baixa', '2026-09-21 11:22:00', 'Ativo', 28),
(29, 'Temperatura baixa', 'Temperatura abaixo do limite.', 'Baixa', '2026-09-21 11:23:00', 'Resolvido', 29),
(30, 'Umidade alta', 'Umidade do ar acima do limite.', 'Média', '2026-09-21 11:24:00', 'Ativo', 30);