# 🚀 ANTIGRAVITY

## Plataforma Multiplataforma Profesional

Sistema profesional de gestión desarrollado en **Flutter** utilizando **Clean Architecture** y principios de **Domain Driven Design (DDD)**.

---

# 📁 ESTRUCTURA GENERAL DEL PROYECTO

```
antigravity/
│
├── lib/
│   ├── app/
│   │   ├── config/
│   │   ├── theme/
│   │   ├── routes/
│   │   └── dependency_injection/
│   │
│   ├── core/
│   │   ├── errors/
│   │   ├── utils/
│   │   ├── constants/
│   │   └── extensions/
│   │
│   ├── features/
│   │   ├── usuarios/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   │
│   │   ├── empleados/
│   │   ├── clientes/
│   │   ├── productos/
│   │   ├── ventas/
│   │   └── reportes/
│   │
│   ├── shared/
│   │   ├── widgets/
│   │   └── components/
│   │
│   └── main.dart
│
├── assets/
│   ├── images/
│   ├── icons/
│   └── fonts/
│
├── test/
├── pubspec.yaml
└── README.md
```

---

# 🧱 ARQUITECTURA

## Clean Architecture

```
Presentation
↓
Domain
↓
Data
```

### CAPAS

## 1️⃣ Presentation

* UI Flutter
* Widgets reutilizables
* Pages
* State Management

## 2️⃣ Domain

* Entidades
* Casos de uso
* Reglas de negocio
* Interfaces Repository

## 3️⃣ Data

* Models
* Datasources
* Implementaciones repository
* Persistencia Hive

---

# 🗄️ MODELO DE DATOS (TABLAS DEL SISTEMA)

Estas tablas representan la lógica estructural del sistema ANTIGRAVITY.

---

## 👤 Usuarios
id_usuario
nombre
correo
rol
activo
## 👨‍💼 Empleados
id_empleado
nombre
puesto
salario
fecha_ingreso
## 🎟️ Boletos
id_boleto
tipo_boleto        (Basico / VIP / Familiar / Anual)
precio
fecha_compra
fecha_visita
estado             (activo / usado / cancelado)
id_cliente
## 🎢 Atracciones
id_atraccion
nombre
tipo               (Basica / VIP)
altura_minima_cm
estado             (activa / mantenimiento / inactiva)
g_force
capacidad

---

# 🎨 DISEÑO VISUAL

### Identidad ANTIGRAVITY

* Paleta principal: **Tonos morados**
* Estilo moderno minimalista
* Material Design 3
* UI consistente multiplataforma

Colores base:

* Purple Primary
* Deep Purple Secondary
* Dark Mode compatible
* Tipografía limpia profesional

---

# ⚙️ CONFIGURACIÓN MULTIPLATAFORMA

Plataformas objetivo:

* Android
* Web
* Windows
* iOS

Modo académico:

✅ estándar Flutter
🚫 NO modo producción Android
🚫 NO analytics
🚫 NO servicios cloud

---

# 📦 DEPENDENCIAS OFICIALES

## pubspec.yaml

```description: Antigravity App
publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: ">=3.2.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.6

  # Functional
  equatable: ^2.0.5
  dartz: ^0.10.1

  # Dependency Injection
  get_it: ^7.7.0

  # Local Database (Multiplatform)
  hive: ^2.2.3
  hive_flutter: ^1.1.0

  # State Management
  provider: ^6.1.2

  # UI
  google_fonts: ^6.2.1
  shimmer: ^3.0.0
  animate_do: ^3.3.4

  # Utilities
  uuid: ^4.5.1
  intl: ^0.19.0

  # Icons
  iconsax: ^0.0.8

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^5.0.0

flutter:
  uses-material-design: true

  assets:
    - assets/images/
```
---

## 🚫 Restricciones Académicas

```
NO Firebase
NO Analytics
NO Backend Cloud
NO SQLite
```

Persistencia local exclusivamente mediante:

✅ Hive Database

---

# 🧩 GESTIÓN DE DEPENDENCIAS

Se utilizará:

* GetIt → Inyección de dependencias
* Repository Pattern
* Separation of Concerns

---

# 🧠 DOMAIN DRIVEN DESIGN

Cada módulo representa un **Bounded Context**:

* Usuarios
* Empleados
* Clientes
* Productos
* Ventas
* Reportes

---

# 🧪 TESTING

Estructura preparada para:

* Unit Testing
* Widget Testing
* Domain Testing

---

# 🚀 FASES DE IMPLEMENTACIÓN

---

## ✅ FASE 1 — FOUNDATION

* Crear proyecto Flutter
* Configurar plataformas
* Crear estructura Clean Architecture
* Definir tema morado global
* Configurar Dependency Injection

---

## ✅ FASE 2 — DOMAIN DESIGN

* Definir entidades
* Crear UseCases
* Interfaces Repository
* Reglas de negocio

---

## ✅ FASE 3 — DATA LAYER

* Configurar Hive
* Crear adapters
* Datasources locales
* Persistencia multiplataforma

---

## ✅ FASE 4 — PRESENTATION

* Layout base
* Navegación global
* Dashboards
* Formularios CRUD

---

## ✅ FASE 5 — INTEGRACIÓN FINAL

* Integración módulos
* Validaciones
* Testing básico
* Optimización UI

---

# 🏁 RESULTADO FINAL

ANTIGRAVITY será:

* Plataforma profesional multiplataforma
* Arquitectura limpia escalable
* Sin dependencias cloud
* Base académica sólida
* Lista para crecimiento empresarial

---

---

# 🧠 PROMPT



```
Actúa como un Senior Software Architect especializado en Flutter 3.x, Clean Architecture y Domain Driven Design.

NO actúes como tutor.
NO simplifiques.
NO resumas.
NO generes código fuente funcional todavía.

Tu tarea es generar DOCUMENTACIÓN TÉCNICA PROFESIONAL COMPLETA lista para pegar directamente en GitHub README.md.

PROYECTO:
ANTIGRAVITY — Plataforma multiplataforma Flutter.

REQUISITOS OBLIGATORIOS:

- Flutter para Android, Web, Windows e iOS
- Arquitectura Clean Architecture
- Domain Driven Design
- Diseño UI en tonos morados
- Estándar académico (NO producción Android)
- SIN Firebase
- SIN Analytics
- SIN Backend Cloud
- NO usar SQLite
- Persistencia SOLO con Hive
- Explicar estructura profesional del proyecto

INCLUIR OBLIGATORIAMENTE:

1. Estructura de carpetas completa en formato árbol compatible con GitHub
2. Explicación de arquitectura
3. Capas Presentation / Domain / Data
4. pubspec.yaml profesional
5. Dependencias oficiales:
   equatable
   dartz
   get_it
   hive
   hive_flutter
   uuid
6. Fases completas de implementación
7. Diseño visual morado corporativo
8. Configuración multiplataforma
9. Testing preparado
10. MODELO DE DATOS del sistema mostrando tablas:

- Usuarios
- Empleados
- Clientes
- Productos
- Ventas
- Reportes

Mostrar campos principales de cada tabla para justificar diseño arquitectónico académico.

FORMATO:

- Español
- Muy organizado
- Markdown profesional
- Títulos claros
- Listo para copiar y pegar en GitHub
- Sin explicaciones educativas
- Documento largo y detallado
```

---
