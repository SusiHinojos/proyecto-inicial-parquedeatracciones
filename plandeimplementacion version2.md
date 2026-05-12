

# 🚀 ANTIGRAVITY — MASTER SOFTWARE ARCHITECTURE

**Tipo:** Plataforma multiplataforma
**Tecnología:** Flutter 3.x
**Arquitectura:** Clean Architecture + Modular Feature Architecture
**Targets:**
✅ Android
✅ iOS
✅ Web
✅ Windows Desktop

---

# 1️⃣ ESTRUCTURA PROFESIONAL DEL PROYECTO

Principio rector:

👉 **Feature First + Clean Architecture híbrida**

Esto evita el caos típico en proyectos Flutter grandes.

---

## 🌐 Estructura Global

```
antigravity/
│
├── android/
├── ios/
├── web/
├── windows/
├── linux/
├── macos/
│
├── assets/
│   ├── images/
│   ├── icons/
│   └── fonts/
│
├── test/
│
├── pubspec.yaml
├── analysis_options.yaml
│
└── lib/
    └── src/
```

---

## 🧠 Núcleo Clean Architecture

```
lib/src/
│
├── core/
│   ├── config/
│   │   ├── app_config.dart
│   │   ├── env.dart
│   │   └── platform_config.dart
│   │
│   ├── constants/
│   │   ├── app_constants.dart
│   │   ├── routes.dart
│   │   └── db_constants.dart
│   │
│   ├── error/
│   │   ├── failures.dart
│   │   ├── exceptions.dart
│   │   └── result.dart
│   │
│   ├── utils/
│   │   ├── responsive.dart
│   │   ├── validators.dart
│   │   ├── formatters.dart
│   │   └── extensions.dart
│   │
│   ├── database/
│   │   ├── database_factory.dart
│   │   ├── sqflite_service.dart
│   │   └── hive_service.dart
│   │
│   └── dependency_injection/
│       └── injector.dart
│
├── domain/
│   ├── entities/
│   │   ├── employee.dart
│   │   ├── attraction.dart
│   │   ├── ticket.dart
│   │   ├── transaction.dart
│   │   └── access_rule.dart
│   │
│   ├── repositories/
│   │   ├── employee_repository.dart
│   │   ├── ticket_repository.dart
│   │   ├── attraction_repository.dart
│   │   └── transaction_repository.dart
│   │
│   ├── usecases/
│   │   ├── auth/
│   │   │   └── login_employee.dart
│   │   │
│   │   ├── ticket/
│   │   │   ├── buy_ticket.dart
│   │   │   ├── validate_access.dart
│   │   │   └── generate_ticket.dart
│   │   │
│   │   └── attraction/
│   │       └── get_attractions.dart
│   │
│   └── value_objects/
│       ├── ticket_type.dart
│       ├── attraction_type.dart
│       └── gforce.dart
│
├── data/
│   ├── models/
│   │   ├── employee_model.dart
│   │   ├── ticket_model.dart
│   │   ├── attraction_model.dart
│   │   └── transaction_model.dart
│   │
│   ├── datasources/
│   │   ├── local/
│   │   │   ├── employee_local_ds.dart
│   │   │   ├── ticket_local_ds.dart
│   │   │   ├── attraction_local_ds.dart
│   │   │   └── transaction_local_ds.dart
│   │
│   ├── mappers/
│   │   ├── employee_mapper.dart
│   │   ├── ticket_mapper.dart
│   │   └── attraction_mapper.dart
│   │
│   └── repositories/
│       ├── employee_repository_impl.dart
│       ├── ticket_repository_impl.dart
│       ├── attraction_repository_impl.dart
│       └── transaction_repository_impl.dart
│
└── presentation/
    ├── app/
    │   ├── antigravity_app.dart
    │   └── router.dart
    │
    ├── shared/
    │   ├── widgets/
    │   ├── themes/
    │   └── layouts/
    │
    ├── features/
    │   ├── auth/
    │   │   ├── login_page.dart
    │   │   └── auth_controller.dart
    │   │
    │   ├── dashboard/
    │   │   └── dashboard_page.dart
    │   │
    │   ├── attractions/
    │   │   ├── attractions_page.dart
    │   │   └── attractions_controller.dart
    │   │
    │   ├── tickets/
    │   │   ├── ticket_sale_page.dart
    │   │   ├── ticket_result_page.dart
    │   │   └── ticket_controller.dart
    │   │
    │   └── employees/
    │       └── employee_page.dart
    │
    └── state/
        ├── base_controller.dart
        └── app_state.dart
```

---

# 2️⃣ GIGA-PLAN DE IMPLEMENTACIÓN

---

# 🧱 FASE 1 — CORE & DATA

Objetivo: **Sistema estable antes de UI**

---

## 1.1 Entidades Inmutables (Domain)

Regla:

```
Entities = PURE BUSINESS
NO Flutter
NO Database
NO JSON
```

Ejemplo conceptual:

* Employee
* Ticket
* Attraction
* Transaction

Todos:

✅ `const constructors`
✅ `copyWith()`
✅ `Equatable`

---

## 1.2 Value Objects

Evita errores humanos.

```
TicketType
AttractionType
GForce
```

Ejemplo:

```
GForce(value: 4.5)
```

Nunca usar `double` directo.

---

## 1.3 Persistencia Híbrida

### Mobile + Desktop

✅ sqflite

### Web

✅ Hive

---

## Database Factory Pattern

```
if(web)
   Hive
else
   Sqflite
```

La app **no sabe qué DB usa**.

---

## 1.4 DTO / Model Layer

Separación obligatoria:

| Tipo   | Uso          |
| ------ | ------------ |
| Entity | Dominio      |
| Model  | Persistencia |
| Mapper | Conversión   |

---

# 🧠 FASE 2 — BUSINESS LOGIC

Esta fase convierte el proyecto en **software profesional**.

---

## Use Case 1 — Login Employee

```
LoginEmployeeUseCase
```

Flujo:

1. validar credenciales
2. buscar empleado local
3. verificar rol
4. devolver sesión

---

## Use Case 2 — Buy Ticket ⭐ CRÍTICO

Reglas:

| Ticket   | Acceso  |
| -------- | ------- |
| Básico   | Básicas |
| Familiar | Básicas |
| VIP      | Todas   |
| Anual    | Todas   |

Proceso:

```
Seleccionar tipo
↓
Crear ticket
↓
Guardar transacción
↓
Generar ticket digital
↓
Retornar resultado
```

---

## Use Case 3 — Validate Access

Input:

```
ticket + attraction
```

Motor de reglas:

```
if VIP or ANUAL -> allow
if BASIC/FAMILY && BASIC attraction -> allow
else deny
```

---

## Use Case 4 — Generate Ticket

Responsabilidades:

* ID único
* Fecha
* Fuerza G destacada
* Código QR (posterior)

---

# 🖥️ FASE 3 — UI ADAPTATIVA

Principio:

👉 **UNA APP — MÚLTIPLES EXPERIENCIAS**

---

## Breakpoints

| Plataforma | Layout  |
| ---------- | ------- |
| < 600px    | Mobile  |
| 600–1000   | Tablet  |
| >1000      | Desktop |

---

## Layout Strategy

```
ResponsiveLayout(
 mobile: MobileScaffold,
 tablet: TabletScaffold,
 desktop: DesktopScaffold
)
```

---

## Navegación

Recomendado:

```
GoRouter
```

Rutas:

```
/login
/dashboard
/attractions
/tickets
/employees
```

---

## UX Antigravity Concept

Elementos visuales:

* tarjetas flotantes
* sombras suaves
* animaciones verticales
* indicadores de G-Force

---

# 🖥️ FASE 4 — HARDWARE & DESKTOP

Aquí el proyecto se vuelve **nivel enterprise**.

---

## Windows Shortcuts

| Acción           | Shortcut |
| ---------------- | -------- |
| Nueva venta      | CTRL + N |
| Buscar atracción | CTRL + F |
| Dashboard        | CTRL + D |
| Imprimir         | CTRL + P |

---

## Generación de Recibos PDF

Contenido:

* Logo Antigravity
* Tipo boleto
* Fecha
* ID transacción
* Fuerza G máxima incluida
* QR Code

Librería sugerida:

```
pdf + printing
```

---

## Desktop UX

* navegación lateral permanente
* mouse hover effects
* soporte teclado completo

---

# 3️⃣ DICCIONARIO DE DATOS

---

## Tabla: employees

| Campo         | Tipo       |
| ------------- | ---------- |
| id            | INTEGER PK |
| name          | TEXT       |
| role          | TEXT       |
| username      | TEXT       |
| password_hash | TEXT       |
| created_at    | TEXT       |

Relación:

```
Employee 1:N Transactions
```

---

## Tabla: attractions

| Campo      | Tipo             |
| ---------- | ---------------- |
| id         | INTEGER PK       |
| name       | TEXT             |
| type       | TEXT (BASIC/VIP) |
| g_force    | REAL             |
| min_height | REAL             |
| status     | TEXT             |

---

## Tabla: tickets

| Campo       | Tipo       |
| ----------- | ---------- |
| id          | INTEGER PK |
| type        | TEXT       |
| price       | REAL       |
| valid_until | TEXT       |
| created_at  | TEXT       |

---

## Tabla: transactions

| Campo       | Tipo       |
| ----------- | ---------- |
| id          | INTEGER PK |
| employee_id | FK         |
| ticket_id   | FK         |
| total       | REAL       |
| created_at  | TEXT       |

Relaciones:

```
Employee 1:N Transaction
Ticket 1:1 Transaction
```

---

# 4️⃣ ESTÁNDARES DE CALIDAD

---

## Naming Convention

| Elemento   | Convención      |
| ---------- | --------------- |
| Clases     | PascalCase      |
| Variables  | camelCase       |
| Archivos   | snake_case.dart |
| Constantes | UPPER_CASE      |
| Widgets    | PascalCase      |

---

## Arquitectura Obligatoria

❌ UI llama DB directamente
❌ Widgets con lógica
❌ Models en Presentation

✅ UI → UseCase → Repository → Datasource

---

## Manejo de Errores (Funcional)

Usar patrón:

```
Result<Success, Failure>
```

Failures:

```
DatabaseFailure
AuthFailure
ValidationFailure
AccessDeniedFailure
```

---

## Reglas de Ingeniería

### 🔒 Inmutabilidad

Entities nunca cambian.

### 🧪 Testabilidad

Cada UseCase testeable sin Flutter.

### ♻️ Dependency Injection

Toda dependencia registrada en:

```
injector.dart
```

---

## Linting Profesional

`analysis_options.yaml`

* evitar dynamic
* evitar nullable innecesario
* prefer const
* prefer final

---

# 🧭 VISIÓN ARQUITECTÓNICA FINAL

Antigravity queda diseñado como:

✅ Modular
✅ Multiplataforma real
✅ Offline First
✅ Escalable
✅ Enterprise Ready
✅ Clean Architecture pura

---

# ✅ ENTREGABLE COMPLETADO

Has recibido:

✔ Estructura profesional completa
✔ GIGA-PLAN por fases
✔ Diccionario de datos
✔ Estándares de calidad

---

# 🚀 ANTIGRAVITY — FASE 1 (CORE & DATA)

Objetivo:

✅ Base profesional
✅ Multiplataforma
✅ Clean Architecture real
✅ Offline First
✅ Lista para crecer

---

# 1️⃣ CREAR EL PROYECTO

```bash
flutter create antigravity
cd antigravity
```

---

# 2️⃣ DEPENDENCIAS OFICIALES

Editar `pubspec.yaml`

```yaml
dependencies:
  flutter:
    sdk: flutter

  # Functional
  equatable: ^2.0.5
  dartz: ^0.10.1

  # DI
  get_it: ^7.7.0

  # Database
  sqflite: ^2.3.3
  path: ^1.9.0

  # Web database
  hive: ^2.2.3
  hive_flutter: ^1.1.0

  # Utilities
  uuid: ^4.4.0
```

---

# 3️⃣ CREAR ESTRUCTURA BASE

Dentro de `lib/`

```
lib/
 └── src/
     ├── core/
     ├── domain/
     └── data/
```

---

# 4️⃣ CORE LAYER

El CORE es el **cerebro técnico**.

---

## 📁 core/error/failures.dart

```dart
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

class AccessDeniedFailure extends Failure {
  const AccessDeniedFailure(super.message);
}
```

---

## 📁 core/error/result.dart

👉 Manejo funcional profesional.

```dart
import 'package:dartz/dartz.dart';
import 'failures.dart';

typedef Result<T> = Either<Failure, T>;
```

---

## 📁 core/constants/db_constants.dart

```dart
class DBConstants {
  static const databaseName = 'antigravity.db';

  static const employeeTable = 'employees';
  static const attractionTable = 'attractions';
  static const ticketTable = 'tickets';
  static const transactionTable = 'transactions';
}
```

---

## 📁 core/database/database_factory.dart

Detecta plataforma automáticamente.

```dart
import 'package:flutter/foundation.dart';
import 'sqflite_service.dart';
import 'hive_service.dart';

abstract class DatabaseService {}

class DatabaseFactory {
  static DatabaseService create() {
    if (kIsWeb) {
      return HiveService();
    }
    return SqfliteService();
  }
}
```

---

## 📁 core/database/sqflite_service.dart

```dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../constants/db_constants.dart';
import 'database_factory.dart';

class SqfliteService implements DatabaseService {
  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;

    final path = join(await getDatabasesPath(), DBConstants.databaseName);

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE employees(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          role TEXT,
          username TEXT,
          password_hash TEXT
        )
        ''');

        await db.execute('''
        CREATE TABLE attractions(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          type TEXT,
          g_force REAL,
          min_height REAL,
          status TEXT
        )
        ''');

        await db.execute('''
        CREATE TABLE tickets(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          type TEXT,
          price REAL,
          valid_until TEXT
        )
        ''');

        await db.execute('''
        CREATE TABLE transactions(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          employee_id INTEGER,
          ticket_id INTEGER,
          total REAL,
          created_at TEXT
        )
        ''');
      },
    );

    return _db!;
  }
}
```

---

## 📁 core/database/hive_service.dart

```dart
import 'package:hive_flutter/hive_flutter.dart';
import 'database_factory.dart';

class HiveService implements DatabaseService {

  Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox('employees');
    await Hive.openBox('attractions');
    await Hive.openBox('tickets');
    await Hive.openBox('transactions');
  }
}
```

---

# 5️⃣ DOMAIN LAYER (💎 MÁS IMPORTANTE)

Aquí vive el negocio REAL.

---

## 📁 domain/value_objects/ticket_type.dart

```dart
enum TicketType {
  basic,
  vip,
  family,
  annual,
}
```

---

## 📁 domain/value_objects/attraction_type.dart

```dart
enum AttractionType {
  basic,
  vip,
}
```

---

## 📁 domain/value_objects/gforce.dart

```dart
class GForce {
  final double value;

  const GForce(this.value) : assert(value >= 0);

  bool get isExtreme => value >= 4.0;
}
```

---

## 📁 domain/entities/employee.dart

```dart
import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final int? id;
  final String name;
  final String role;
  final String username;

  const Employee({
    this.id,
    required this.name,
    required this.role,
    required this.username,
  });

  @override
  List<Object?> get props => [id, name, role, username];
}
```

---

## 📁 domain/entities/attraction.dart

```dart
import 'package:equatable/equatable.dart';
import '../value_objects/attraction_type.dart';
import '../value_objects/gforce.dart';

class Attraction extends Equatable {
  final int? id;
  final String name;
  final AttractionType type;
  final GForce gForce;
  final double minHeight;

  const Attraction({
    this.id,
    required this.name,
    required this.type,
    required this.gForce,
    required this.minHeight,
  });

  @override
  List<Object?> get props => [id, name, type, gForce, minHeight];
}
```

---

## 📁 domain/entities/ticket.dart

```dart
import 'package:equatable/equatable.dart';
import '../value_objects/ticket_type.dart';

class Ticket extends Equatable {
  final int? id;
  final TicketType type;
  final double price;
  final DateTime validUntil;

  const Ticket({
    this.id,
    required this.type,
    required this.price,
    required this.validUntil,
  });

  @override
  List<Object?> get props => [id, type, price, validUntil];
}
```

---

## 📁 domain/entities/transaction.dart

```dart
import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final int? id;
  final int employeeId;
  final int ticketId;
  final double total;
  final DateTime createdAt;

  const Transaction({
    this.id,
    required this.employeeId,
    required this.ticketId,
    required this.total,
    required this.createdAt,
  });

  @override
  List<Object?> get props =>
      [id, employeeId, ticketId, total, createdAt];
}
```

---

## 📁 domain/repositories/ticket_repository.dart

```dart
import '../../core/error/result.dart';
import '../entities/ticket.dart';

abstract class TicketRepository {
  Future<Result<Ticket>> createTicket(Ticket ticket);
  Future<Result<List<Ticket>>> getTickets();
}
```

---

## 📁 domain/repositories/attraction_repository.dart

```dart
import '../../core/error/result.dart';
import '../entities/attraction.dart';

abstract class AttractionRepository {
  Future<Result<List<Attraction>>> getAttractions();
}
```

---

## 📁 domain/repositories/employee_repository.dart

```dart
import '../../core/error/result.dart';
import '../entities/employee.dart';

abstract class EmployeeRepository {
  Future<Result<Employee>> login(
    String username,
    String password,
  );
}
```

---

# 6️⃣ DATA LAYER

Aquí conectamos dominio con base de datos.

---

## 📁 data/models/employee_model.dart

```dart
import '../../domain/entities/employee.dart';

class EmployeeModel extends Employee {
  const EmployeeModel({
    super.id,
    required super.name,
    required super.role,
    required super.username,
  });

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'],
      name: map['name'],
      role: map['role'],
      username: map['username'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'role': role,
        'username': username,
      };
}
```

---

## 📁 data/datasources/local/employee_local_ds.dart

```dart
abstract class EmployeeLocalDataSource {
  Future<Map<String, dynamic>?> login(
    String username,
    String password,
  );
}
```

(La implementación real se hará en Fase 2.)

---

# ✅ FASE 1 COMPLETADA

Ya tienes:

✅ Clean Architecture real
✅ Entidades inmutables
✅ Value Objects profesionales
✅ Persistencia multiplataforma
✅ Repositorios abstractos
✅ Base empresarial lista

---
AAAAA ya entendí 😄
👉 **NO código**
👉 **SOLO PLAN DE IMPLEMENTACIÓN**
👉 Igual que la **Fase 1**
👉 **Fases 2, 3 y 4 juntas** para copiar y pegar.

Aquí va el **MASTER PLAN COMPLETO** de ingeniería.

---

# 🚀 ANTIGRAVITY — PLAN MAESTRO DE IMPLEMENTACIÓN

## FASES 2, 3 Y 4

---

# 🧠 FASE 2 — BUSINESS LOGIC (DOMINIO Y REGLAS DEL PARQUE)

## 🎯 Objetivo

Implementar toda la **lógica real del negocio** separada totalmente de UI y Base de Datos.

La aplicación debe poder funcionar incluso sin interfaz gráfica.

---

## 🏗 Componentes Principales

### 1. Repositories (Contratos del Dominio)

Se definen interfaces puras:

* EmployeeRepository
* TicketRepository
* AttractionRepository
* SaleRepository

Responsabilidad:

* No conocen Flutter
* No conocen sqflite ni Hive
* Solo describen *qué puede hacer el sistema*

Ejemplo conceptual:

* loginEmployee()
* buyTicket()
* validateAccess()
* getAttractions()

---

### 2. Use Cases (Casos de Uso)

Cada acción del parque se convierte en un caso de uso independiente.

#### Use Cases obligatorios

✅ LoginEmployee

* Valida credenciales locales
* Retorna empleado autenticado

✅ BuyTicket

* Crea venta
* Genera ticket
* Guarda transacción local

✅ ValidateAccess ⭐ (CRÍTICO)
Implementa reglas del parque:

| Tipo Boleto | Acceso                   |
| ----------- | ------------------------ |
| Básico      | Solo Atracciones Básicas |
| Familiar    | Solo Básicas             |
| VIP         | Todas                    |
| Anual       | Todas                    |

Regla centralizada → **NO duplicar lógica en UI**.

---

### 3. Value Objects

Evitan errores humanos.

* TicketType
* AttractionType
* GForce

Ejemplo conceptual:

```
TicketType.basic
TicketType.vip
AttractionType.vip
```

---

### 4. Motor Antigravity (Branding Core)

Cada atracción posee:

* nombre
* nivel adrenalina
* valor G-Force

El sistema permitirá:

* clasificar intensidad
* mostrar advertencias
* futura analítica interna (sin analytics externos)

---

### 5. Manejo Profesional de Errores

Arquitectura funcional:

* Result<Success, Failure>
* AuthFailure
* DatabaseFailure
* ValidationFailure

Regla:

❌ No usar try/catch en UI
✅ Los errores viven en Domain/Core

---

### ✅ Resultado de Fase 2

El sistema ya puede:

* vender boletos
* validar accesos
* autenticar empleados
* aplicar reglas del parque

👉 **Sin interfaz todavía**.

---

# 🎨 FASE 3 — UI ADAPTATIVA MULTIPLATAFORMA

## 🎯 Objetivo

Crear una interfaz única capaz de ejecutarse en:

* Android
* iOS
* Web
* Windows Desktop

con un solo código Flutter.

---

## 🧱 Estrategia de Diseño

### Arquitectura Presentation

Separación estricta:

```
presentation/
 ├── screens
 ├── widgets
 ├── state
 ├── navigation
 └── responsive
```

---

## 1. Responsive System

Se crea un motor adaptativo:

| Tamaño  | Layout  |
| ------- | ------- |
| < 800px | Mobile  |
| ≥ 800px | Desktop |

---

### Mobile Experience

Diseño tipo app:

* navegación inferior
* flujo rápido de venta
* botones grandes
* operador caminando en parque

Pantallas:

* Login
* Venta de boletos
* Lista de atracciones
* Validación de acceso

---

### Desktop / Windows Experience

Diseño tipo software empresarial:

* Sidebar izquierda
* Dashboard central
* Panel de ventas
* Control administrativo

Pensado para:

👉 taquilla principal del parque.

---

## 2. Sistema de Navegación

Se implementa navegación modular:

* Router central
* Rutas declarativas
* Deep linking preparado

Pantallas base:

* Splash
* Login
* Dashboard
* Ticket Sales
* Attractions
* Employees

---

## 3. State Management

Responsabilidad:

* UI reactiva
* desacoplada del dominio

Se recomienda:

✅ Riverpod (arquitectura limpia)

Flujo:

```
UI → Provider → UseCase → Repository
```

---

## 4. Flujo de Venta (UX Principal)

Proceso:

1. Empleado inicia sesión
2. Selecciona tipo de boleto
3. Sistema calcula acceso
4. Compra registrada
5. Ticket generado
6. Listo para validación

---

### Principio Clave

La UI **NO decide reglas**.

Solo muestra resultados del dominio.

---

### ✅ Resultado Fase 3

Antigravity ya funciona como:

✅ App móvil
✅ Software Windows
✅ Sistema de ventas real

---

# 🖥 FASE 4 — HARDWARE, WINDOWS Y OPERACIÓN REAL

## 🎯 Objetivo

Convertir Antigravity en software profesional de parque.

---

## 1. Soporte Desktop Completo

Optimización Windows:

* ventanas amplias
* mouse + teclado
* multitarea
* pantallas grandes

---

## 2. Atajos de Teclado (Operación Rápida)

Ejemplos:

| Atajo    | Acción          |
| -------- | --------------- |
| F1       | Nueva venta     |
| F2       | Buscar boleto   |
| F3       | Validar acceso  |
| ESC      | Cancelar venta  |
| CTRL + P | Imprimir ticket |

Diseñado para taquilleros reales.

---

## 3. Generación de Tickets PDF

Cada compra genera:

* ID de ticket
* tipo boleto
* fecha
* atracciones permitidas
* branding Antigravity
* valor G-Force destacado

Salida:

* impresión directa
* descarga PDF
* futura integración QR

---

## 4. Persistencia Multiplataforma

| Plataforma          | Tecnología |
| ------------------- | ---------- |
| Android/iOS/Windows | sqflite    |
| Web                 | Hive       |

Factory Pattern decide automáticamente.

---

## 5. Offline First

Sistema completo funciona:

✅ sin internet
✅ sin servidores
✅ sin Firebase Analytics

Ideal para parques reales.

---

## 6. Preparación Hardware Futuro

Arquitectura lista para:

* lectores QR
* escáner código barras
* impresoras térmicas
* kioscos autoservicio

---

### ✅ Resultado Fase 4

Antigravity se convierte en:

⭐ Software profesional de operación de parque
⭐ Sistema multiplataforma real
⭐ Arquitectura escalable empresarial

---

# 🏁 ESTADO FINAL DEL PROYECTO

Después de las 4 fases:

✔ Clean Architecture completa
✔ Dominio desacoplado
✔ UI adaptable
✔ Motor de reglas del parque
✔ Venta real de boletos
✔ Operación Windows profesional
✔ Offline First

---


