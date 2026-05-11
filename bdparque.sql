
-- =====================================================
-- Base de Datos: Parque de Atracciones
-- Archivo: bdparque.sql
-- =====================================================

DROP DATABASE IF EXISTS bdparque;
CREATE DATABASE bdparque;
USE bdparque;

-- =========================
-- 1. Cliente
-- =========================
CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    fecha_nacimiento DATE,
    email VARCHAR(120) UNIQUE,
    telefono VARCHAR(20),
    documento VARCHAR(30) UNIQUE
);

-- =========================
-- 2. TipoEntrada
-- =========================
CREATE TABLE TipoEntrada (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    precio_base DECIMAL(8,2) NOT NULL,
    descripcion TEXT,
    vigencia_horas INT
);

-- =========================
-- 3. Entrada
-- =========================
CREATE TABLE Entrada (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    tipo_entrada_id INT,
    fecha_visita DATE NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    descuento DECIMAL(5,2) DEFAULT 0,
    estado ENUM('vendida','usada','cancelada'),
    canal_venta VARCHAR(30),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (tipo_entrada_id) REFERENCES TipoEntrada(id)
);

-- =========================
-- 4. Zona
-- =========================
CREATE TABLE Zona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    descripcion TEXT,
    capacidad_max INT,
    mapa_coordenadas VARCHAR(100)
);

-- =========================
-- 5. Atraccion
-- =========================
CREATE TABLE Atraccion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    zona_id INT,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    capacidad_turno INT,
    duracion_min INT,
    altura_minima_cm INT,
    peso_maximo_kg INT,
    estado ENUM('activa','mantenimiento','cerrada'),
    FOREIGN KEY (zona_id) REFERENCES Zona(id)
);

-- =========================
-- 6. Horario
-- =========================
CREATE TABLE Horario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    atraccion_id INT,
    fecha DATE NOT NULL,
    hora_apertura TIME NOT NULL,
    hora_cierre TIME NOT NULL,
    turnos_por_hora INT,
    FOREIGN KEY (atraccion_id) REFERENCES Atraccion(id)
);

-- =========================
-- 7. Departamento
-- =========================
CREATE TABLE Departamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    descripcion TEXT
);

-- =========================
-- 8. Empleado
-- =========================
CREATE TABLE Empleado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    departamento_id INT,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    cargo VARCHAR(60),
    fecha_contratacion DATE,
    salario DECIMAL(10,2),
    estado ENUM('activo','inactivo','vacaciones'),
    FOREIGN KEY (departamento_id) REFERENCES Departamento(id)
);

-- =========================
-- 9. Reserva
-- =========================
CREATE TABLE Reserva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    entrada_id INT,
    atraccion_id INT,
    fecha_reserva DATETIME NOT NULL,
    turno_horario DATETIME NOT NULL,
    estado ENUM('pendiente','confirmada','cancelada'),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (entrada_id) REFERENCES Entrada(id),
    FOREIGN KEY (atraccion_id) REFERENCES Atraccion(id)
);

-- =========================
-- 10. AccesoLog
-- =========================
CREATE TABLE AccesoLog (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    entrada_id INT,
    atraccion_id INT,
    timestamp DATETIME NOT NULL,
    resultado ENUM('permitido','denegado'),
    motivo_denegacion VARCHAR(120),
    FOREIGN KEY (entrada_id) REFERENCES Entrada(id),
    FOREIGN KEY (atraccion_id) REFERENCES Atraccion(id)
);

-- =====================================================
-- Fin del Script
-- =====================================================
