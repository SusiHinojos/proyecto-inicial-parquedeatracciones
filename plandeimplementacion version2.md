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
📦 2. DEPENDENCIAS OFICIALES — pubspec.yaml

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

🎨 3. IDENTIDAD VISUAL — ANTIGRAVITY
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

🧠 4. DICCIONARIO DE DATOS (BASE LOCAL)
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
⚙️ 5. REGLAS DE NEGOCIO (CORE)
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
🚀 6. GIGA PLAN DE IMPLEMENTACIÓN
✅ FASE 1 — CORE & DATA
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

✅ FASE 2 — BUSINESS LOGIC
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

✅ FASE 3 — UI ADAPTATIVA
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

✅ FASE 4 — HARDWARE & DESKTOP
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

🧩 7. ESTÁNDARES DE CALIDAD
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

Actúa como un Senior Fullstack Software Architect especializado en:

Flutter 3.x
Clean Architecture
Domain Driven Design
Arquitectura multiplataforma profesional
Desarrollo Desktop + Mobile + Web
Ingeniería de software empresarial

NO actúes como tutor.
NO simplifiques explicaciones.
NO hagas resúmenes.
NO generes código fuente todavía.
NO expliques conceptos básicos.

Tu objetivo es generar documentación técnica profesional lista para ingeniería real, como si fuera entregada por un arquitecto senior antes del desarrollo.

PROYECTO

Diseñar desde cero la plataforma ANTIGRAVITY.

ANTIGRAVITY es un sistema profesional multiplataforma para la gestión de un parque de atracciones.

Debe ejecutarse en:

Android
iOS
Web
Windows Desktop

El sistema debe ser altamente escalable, modular y seguir estándares industriales reales.

CONTEXTO DE NEGOCIO

El sistema incluye:

1. Mantenimiento de Usuarios
Base de datos LOCAL.
Empleados con roles.
Login offline.
Sin servicios cloud.
2. Sistema de Boletos (CRÍTICO)

Tipos obligatorios:

Básico
VIP
Familiar
Anual

Reglas:

Boletos Básicos y Familiares → solo atracciones Básicas.
Boletos VIP y Anuales → acceso TOTAL.
3. Jerarquía de Atracciones

Cada atracción debe incluir:

nombre
tipo (Basic/VIP)
altura mínima
estado
valor G-Force (Fuerza G) obligatorio como atributo de branding Antigravity.
4. Flujo de Venta

Debe existir:

botón de compra
registro de transacción
almacenamiento local
generación de ticket
recibo PDF
RESTRICCIONES TÉCNICAS (OBLIGATORIAS)

Arquitectura:

Clean Architecture estricta.
Separación Domain / Data / Presentation.

Persistencia:

sqflite → Android / iOS / Windows
Hive → Web

Prohibiciones:

NO Firebase
NO Analytics
NO SDK de rastreo
NO backend cloud
NO configuraciones de producción Android

La aplicación será OFFLINE FIRST.

IDENTIDAD VISUAL

Diseñar concepto visual:

estilo futurista
ciencia y antigravedad
interfaz en tonos morados
dark theme
UI profesional empresarial
ENTREGABLES OBLIGATORIOS

Genera TODO lo siguiente en un único documento profesional:

1️⃣ ESTRUCTURA DE ARCHIVOS PROFESIONAL

Mostrar árbol completo desde la raíz:

pubspec.yaml
lib/src/core
lib/src/domain
lib/src/data
lib/src/presentation

Debe llegar hasta archivos .dart reales.

Debe seguir estándares Clean Architecture industriales.

2️⃣ DEPENDENCIAS OFICIALES

Incluir sección completa de pubspec.yaml con:

equatable
dartz
get_it
sqflite
hive
uuid
utilidades necesarias
librerías PDF desktop

NO agregar analytics ni servicios cloud.

3️⃣ DICCIONARIO DE DATOS

Definir tablas locales:

Employee
Attraction
Ticket
Sale

Incluir:

campos
tipos
claves
relaciones 1 y N
reglas de negocio relacionadas.
4️⃣ GIGA PLAN DE IMPLEMENTACIÓN

Desarrollar un plan EXTENSO dividido en 4 fases completas:

Fase 1 — Core & Data
entidades inmutables
DTOs
mappers
repositorios abstractos
configuración base de datos
dependency injection
Fase 2 — Business Logic
Use Cases
Login empleado
Comprar boleto
Validar acceso
Generar ticket
Fase 3 — UI Adaptativa
layouts responsive
diferencias Mobile vs Windows
navegación profesional
diseño Antigravity
Fase 4 — Hardware & Desktop
atajos teclado Windows
generación PDF
funcionamiento offline
almacenamiento web Hive

Cada fase debe parecer planificación de ingeniería real.

5️⃣ ESTÁNDARES DE CALIDAD

Definir:

reglas de nombrado
manejo de errores funcional (Either<Failure, Success>)
principios Clean Architecture
testing strategy
separación de capas
FORMATO DE RESPUESTA

La respuesta debe:

verse como documentación empresarial real
estar organizada por secciones claras
lista para copiar y pegar
sin explicaciones educativas
sin ejemplos simples
sin código de implementación todavía

Debe sentirse como un Architecture Master Plan profesional.

INSTRUCCIÓN FINAL:

Genera el documento completo del proyecto ANTIGRAVITY ahora.
