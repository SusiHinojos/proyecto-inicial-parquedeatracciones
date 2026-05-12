🚀 ANTIGRAVITY
Plataforma Multiplataforma de Gestión de Parque de Atracciones

Flutter 3.x — Clean Architecture — Multiplatform

📁 1. ESTRUCTURA PROFESIONAL DEL PROYECTO
## 📁 Project Structure — ANTIGRAVITY

```bash
antigravity/
│
├── pubspec.yaml
├── analysis_options.yaml
├── README.md
│
├── assets/
│   ├── images/
│   ├── icons/
│   ├── fonts/
│   └── animations/
│
├── lib/
│   ├── main.dart
│   │
│   └── src/
│       │
│       ├── core/
│       │   ├── constants/
│       │   │   └── app_constants.dart
│       │   │
│       │   ├── errors/
│       │   │   ├── failures.dart
│       │   │   └── exceptions.dart
│       │   │
│       │   ├── theme/
│       │   │   └── antigravity_theme.dart
│       │   │
│       │   ├── database/
│       │   │   └── hive_service.dart
│       │   │
│       │   └── di/
│       │       └── injector.dart
│       │
│       ├── domain/
│       │   ├── entities/
│       │   │   ├── employee.dart
│       │   │   ├── attraction.dart
│       │   │   ├── ticket.dart
│       │   │   └── sale.dart
│       │   │
│       │   ├── repositories/
│       │   │   ├── employee_repository.dart
│       │   │   ├── attraction_repository.dart
│       │   │   ├── ticket_repository.dart
│       │   │   └── sale_repository.dart
│       │   │
│       │   └── usecases/
│       │       ├── login_employee.dart
│       │       ├── buy_ticket.dart
│       │       ├── validate_access.dart
│       │       └── register_sale.dart
│       │
│       ├── data/
│       │   ├── models/
│       │   │   ├── employee_model.dart
│       │   │   ├── attraction_model.dart
│       │   │   ├── ticket_model.dart
│       │   │   └── sale_model.dart
│       │   │
│       │   ├── datasources/
│       │   │   └── local_datasource.dart
│       │   │
│       │   ├── mappers/
│       │   │   └── entity_mappers.dart
│       │   │
│       │   └── repositories/
│       │       ├── employee_repository_impl.dart
│       │       ├── attraction_repository_impl.dart
│       │       ├── ticket_repository_impl.dart
│       │       └── sale_repository_impl.dart
│       │
│       └── presentation/
│           ├── pages/
│           │   ├── login/
│           │   │   └── login_page.dart
│           │   │
│           │   ├── dashboard/
│           │   │   └── dashboard_page.dart
│           │   │
│           │   ├── attractions/
│           │   │   └── attractions_page.dart
│           │   │
│           │   └── sales/
│           │       └── sales_page.dart
│           │
│           ├── widgets/
│           │   ├── antigravity_button.dart
│           │   ├── attraction_card.dart
│           │   └── ticket_widget.dart
│           │
│           ├── providers/
│           │   ├── auth_provider.dart
│           │   ├── ticket_provider.dart
│           │   └── attraction_provider.dart
│           │
│           └── navigation/
│               └── app_router.dart
│
└── test/
    ├── domain/
    ├── data/
    └── presentation/
```
### 📦 2. DEPENDENCIAS OFICIALES — pubspec.yaml

✔ SIN ANALÍTICAS
✔ SIN CONFIGURACIÓN PRODUCCIÓN
✔ MULTIPLATAFORMA REAL

name: antigravity
description: Plataforma multiplataforma de gestión de parque de atracciones

environment:
  sdk: ">=3.3.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter

  # Functional Programming
  equatable: ^2.0.5
  dartz: ^0.10.1

  # Dependency Injection
  get_it: ^7.7.0

  # Local Database (Mobile + Windows)
  sqflite: ^2.3.3
  path: ^1.9.0

  # Web Database
  hive: ^2.2.3
  hive_flutter: ^1.1.0

  # Utilities
  uuid: ^4.4.0

  # Responsive UI
  flutter_screenutil: ^5.9.0

  # PDF Desktop
  pdf: ^3.10.8
  printing: ^5.12.0

dev_dependencies:
  flutter_test:
    sdk: flutter

🚫 NO Firebase
🚫 NO Analytics
🚫 NO Backend Cloud

### 🎨 3. IDENTIDAD VISUAL — ANTIGRAVITY
Concepto visual

Sistema futurista inspirado en:

Antigravedad
Física extrema
Fuerza G
Experiencias inmersivas
Paleta Oficial
Elemento	Color
Primario	Morado Oscuro
Secundario	Violeta Neón
Acento	Magenta
Fondo	Negro Espacial
Cards	Morado Translúcido

UI estilo:

✅ Neon Theme
✅ Glassmorphism
✅ Dark First Design

### 🧠 4. DICCIONARIO DE DATOS (BASE LOCAL)
EMPLOYEE
Campo	Tipo
id	TEXT UUID
name	TEXT
role	TEXT
username	TEXT
password	TEXT
active	INTEGER
ATTRACTION
Campo	Tipo
id	TEXT
name	TEXT
type	BASIC / VIP
minHeight	REAL
gForce	REAL
status	TEXT
TICKET
Campo	Tipo
id	TEXT
type	BASIC / VIP / FAMILY / ANNUAL
price	REAL
purchaseDate	TEXT
validUntil	TEXT
SALE
Campo	Tipo
id	TEXT
ticketId	TEXT
employeeId	TEXT
total	REAL
timestamp	TEXT
Relaciones
Employee 1 ---- N Sale
Sale 1 ---- 1 Ticket
Ticket N ---- N Attraction (por reglas)
### ⚙️ 5. REGLAS DE NEGOCIO (CORE)
🎟 Tipos de boletos
Tipo	Acceso
Básico	Atracciones Básicas
Familiar	Atracciones Básicas
VIP	Todas
Anual	Todas
Validación de acceso
IF ticket == BASIC/FAMILY
   -> only BASIC attractions

IF ticket == VIP/ANNUAL
   -> FULL ACCESS
Branding obligatorio

Cada atracción incluye:

G-Force Rating

Ejemplo:

HyperLoop → 4.7G
### 🚀 6. GIGA PLAN DE IMPLEMENTACIÓN
## ✅ FASE 1 — CORE & DATA
Objetivo

Construir la base arquitectónica estable.

Actividades
Configurar Clean Architecture
Crear entidades inmutables
Implementar repositorios abstractos
Configurar DI con GetIt
Inicializar DB local
Persistencia
Plataforma	DB
Android	sqflite
iOS	sqflite
Windows	sqflite
Web	Hive
Resultado

✔ Dominio independiente
✔ Base lista para lógica

## ✅ FASE 2 — BUSINESS LOGIC
Use Cases principales
LoginEmployee
valida credenciales locales
sesión offline
BuyTicket
genera UUID
guarda venta
crea ticket
ValidateAccess
verifica permiso por tipo
compara con atracción
GenerateTicket
prepara información del recibo
Patrón
UI → Controller → UseCase → Repository → DataSource

Resultado:

✔ Sistema funcional completo
✔ Reglas centralizadas

## ✅ FASE 3 — UI ADAPTATIVA
Objetivo

Una sola app → múltiples dispositivos.

Breakpoints
Device	Layout
Mobile	Bottom Navigation
Tablet	Hybrid
Windows	Sidebar Navigation
Web	Responsive Grid
Pantallas
Login
Dashboard
Atracciones
Venta de boletos
Configuración
Diseño Antigravity
tonos morados
animaciones suaves
tarjetas flotantes
indicadores G-Force

Resultado:

✔ Experiencia multiplataforma real

## ✅ FASE 4 — HARDWARE & DESKTOP
Windows Features

✔ Atajos de teclado:

Acción	Shortcut
Nueva venta	CTRL + N
Buscar	CTRL + F
Imprimir	CTRL + P
PDF Ticket

Contenido:

ANTIGRAVITY PARK
Ticket ID
Tipo
Precio
Fecha
Empleado
QR interno

Generado localmente.

Web

Hive Storage
Offline Ready

Resultado final:

✔ Sistema profesional offline
✔ Desktop Ready

### 🧩 7. ESTÁNDARES DE CALIDAD
Naming
Elemento	Regla
Clases	PascalCase
Variables	camelCase
Archivos	snake_case
Interfaces	abstract class
Manejo de errores

Uso obligatorio:

Either<Failure, Success>

Tipos:

DatabaseFailure
AuthFailure
ValidationFailure
Clean Architecture Rules

🚫 Presentation NO conoce Data
🚫 Data NO conoce UI
✅ Domain independiente

Testing Strategy
Unit Test → UseCases
Widget Test → UI
Repository Mocking
🛑 RESTRICCIONES OFICIALES DEL PROYECTO

✔ Flutter Multiplataforma
✔ Sin Firebase
✔ Sin Analytics
✔ Sin backend cloud
✔ Solo base local
✔ No modo producción Android

🏁 RESULTADO ESPERADO

ANTIGRAVITY será:

Sistema empresarial offline
Arquitectura escalable
Desktop + Mobile + Web
Clean Architecture real
Branding científico basado en Fuerza G

# PROMPT

Actúa como un **Senior Fullstack Software Architect** especializado en:

* Flutter 3.x
* Clean Architecture
* Domain Driven Design
* Arquitectura multiplataforma profesional
* Desarrollo Desktop + Mobile + Web
* Ingeniería de software empresarial

---

## REGLAS DE COMPORTAMIENTO

NO actúes como tutor.
NO simplifiques explicaciones.
NO hagas resúmenes.
NO expliques conceptos básicos.
NO generes código fuente todavía.

Tu objetivo es generar **documentación técnica profesional**, como si fuera entregada por un **Software Architect Senior antes del desarrollo real**.

El resultado debe sentirse como un **Architecture Master Plan empresarial**.

---

# PROYECTO

Diseñar desde cero la plataforma:

# **ANTIGRAVITY**

Sistema profesional multiplataforma para la gestión integral de un parque de atracciones.

Debe ejecutarse en:

* Android
* iOS
* Web
* Windows Desktop

El sistema debe ser:

* Escalable
* Modular
* Offline First
* Enterprise Grade

---

# CONTEXTO DE NEGOCIO

## 1. Gestión de Usuarios

* Base de datos LOCAL
* Empleados con roles
* Login offline
* Sin backend cloud
* Sin autenticación remota

---

## 2. Sistema de Boletos (CRÍTICO)

Tipos obligatorios:

* Básico
* VIP
* Familiar
* Anual

### Reglas de acceso

* Básico + Familiar → solo atracciones Básicas
* VIP + Anual → acceso TOTAL

---

## 3. Jerarquía de Atracciones

Cada atracción debe contener:

* nombre
* tipo (Basic / VIP)
* altura mínima
* estado
* **valor G-Force (Fuerza G)** obligatorio como branding Antigravity

---

## 4. Flujo de Venta

Debe existir:

* botón de compra
* registro de transacción
* almacenamiento local
* generación automática de ticket
* recibo PDF

---

# RESTRICCIONES TÉCNICAS (OBLIGATORIAS)

Arquitectura:

* Clean Architecture estricta
* Separación Domain / Data / Presentation

Persistencia:

* sqflite → Android / iOS / Windows
* Hive → Web

Prohibido:

* Firebase
* Analytics
* SDK de rastreo
* Backend cloud
* Configuración Android production

El sistema es **100% OFFLINE FIRST**.

---

# IDENTIDAD VISUAL

Diseñar concepto visual:

* estética futurista
* ciencia / antigravedad
* interfaz profesional empresarial
* dark theme
* tonos morados
* branding tecnológico ANTIGRAVITY

---

# MODELO DE DATOS BASE (OBLIGATORIO INTEGRAR)

Usar estas tablas como referencia del dominio:

## Cliente

id INT PK
nombre VARCHAR(80) NOT NULL
apellido VARCHAR(80) NOT NULL
fecha_nacimiento DATE
email VARCHAR(120) UNIQUE
telefono VARCHAR(20)
documento VARCHAR(30) UNIQUE

## Entrada

id INT PK
cliente_id INT FK
tipo_entrada_id INT FK
fecha_visita DATE NOT NULL
precio DECIMAL(8,2) NOT NULL
descuento DECIMAL(5,2) DEFAULT 0
estado ENUM(vendida/usada/cancelada)
canal_venta VARCHAR(30)

## TipoEntrada

id INT PK
nombre VARCHAR(60)
precio_base DECIMAL(8,2)
descripcion TEXT
vigencia_horas INT

## Atraccion

id INT PK
zona_id INT FK
nombre VARCHAR(100)
tipo VARCHAR(50)
capacidad_turno INT
duracion_min INT
altura_minima_cm INT
peso_maximo_kg INT
estado ENUM(activa/mantenimiento/inactiva)

## Zona

id INT PK
nombre VARCHAR(80)
descripcion TEXT
capacidad_max INT
mapa_coordenadas VARCHAR(100)

## Horario

id INT PK
atraccion_id INT FK
fecha DATE
hora_apertura TIME
hora_cierre TIME
turnos_por_hora INT

Estas tablas deben reflejarse conceptualmente dentro del diseño Domain Driven Design.

---

# ENTREGABLES OBLIGATORIOS

Genera TODO en un único documento profesional:

---

## 1️⃣ ESTRUCTURA DE ARCHIVOS PROFESIONAL

Mostrar árbol completo del proyecto desde raíz hasta archivos `.dart`.

Debe incluir:

* pubspec.yaml
* lib/src/core
* lib/src/domain
* lib/src/data
* lib/src/presentation

Nivel empresarial real.

---

## 2️⃣ DEPENDENCIAS OFICIALES

Incluir sección completa pubspec.yaml con:

* equatable
* dartz
* get_it
* sqflite
* hive
* uuid
* librerías PDF Desktop
* utilidades necesarias

NO analytics.
NO cloud.

---

## 3️⃣ DICCIONARIO DE DATOS

Definir entidades:

* Employee
* Client
* Attraction
* Ticket
* Sale
* Zone
* Schedule

Incluir:

* campos
* tipos
* claves
* relaciones
* reglas de negocio

---

## 4️⃣ GIGA PLAN DE IMPLEMENTACIÓN

Dividir en fases profesionales:

### Fase 1 — Core & Data

* entidades inmutables
* DTOs
* mappers
* repositorios abstractos
* configuración DB
* dependency injection

### Fase 2 — Business Logic

Use Cases:

* Login empleado
* Comprar boleto
* Validar acceso
* Generar ticket

### Fase 3 — UI Adaptativa

* layouts responsive
* diferencias Mobile vs Desktop
* navegación profesional
* diseño visual Antigravity

### Fase 4 — Hardware & Desktop

* atajos teclado Windows
* generación PDF
* almacenamiento Hive Web
* comportamiento offline

Cada fase debe parecer planificación real de ingeniería.

---

## 5️⃣ ESTÁNDARES DE CALIDAD

Definir:

* reglas de nombrado
* manejo funcional de errores (Either<Failure, Success>)
* principios Clean Architecture
* testing strategy
* separación estricta de capas

---

# FORMATO FINAL

La respuesta debe:

* parecer documentación empresarial real
* organizada por secciones claras
* lista para copiar y pegar
* sin explicaciones educativas
* sin ejemplos simples
* sin código aún

Debe sentirse como un **Architecture Master Plan profesional** entregado antes del desarrollo.

Genera el documento completo ahora.
