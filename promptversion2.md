# Prompt

Actúa como un Senior Fullstack Software Architect especializado en Flutter 3.x, Clean Architecture, Domain Driven Design y desarrollo multiplataforma profesional.

NO actúes como tutor.
NO simplifiques.
NO resumas.
NO generes código fuente todavía.
NO expliques conceptos básicos.

Tu rol es diseñar documentación técnica profesional lista para ingeniería real.

---

PROYECTO:
Diseñar desde cero la plataforma multiplataforma llamada **ANTIGRAVITY**, un sistema profesional de gestión para un parque de atracciones.

Debe funcionar en:

* Android
* iOS
* Web
* Windows Desktop

---

OBJETIVO GENERAL:

Crear el PLAN MAESTRO DE INGENIERÍA COMPLETO siguiendo estándares de software enterprise.

El sistema debe ser:

* escalable
* mantenible
* offline-first
* desacoplado
* multiplataforma
* profesional

---

REGLAS DE NEGOCIO (OBLIGATORIAS):

1. Sistema de empleados local con roles.
2. Sistema de venta de boletos con 4 tipos:

* Básico
* VIP
* Familiar
* Anual

3. Jerarquía de Atracciones:

* Atracciones Básicas
* Atracciones VIP

4. Reglas de acceso:

* Básico y Familiar → SOLO atracciones básicas
* VIP y Anual → acceso total

5. Branding obligatorio:

Cada atracción debe tener atributo:
"G-Force" (fuerza G) como identidad Antigravity.

6. Flujo de Venta:

Empleado inicia sesión →
Compra boleto →
Registro en base local →
Generación automática de ticket.

---

RESTRICCIONES TÉCNICAS (MUY IMPORTANTES):

Arquitectura:
✔ Clean Architecture estricta

Capas obligatorias:

* Core
* Domain
* Data
* Presentation

Persistencia:

* sqflite para Mobile y Desktop
* Hive para Web

PROHIBIDO:

* Firebase Analytics
* SDKs de tracking
* Backend online
* Servicios cloud pesados

Sistema completamente LOCAL.

---

ENTREGABLES QUE DEBES GENERAR:

ENTREGA TODO EN UN SOLO DOCUMENTO EXTENSO.

NO DIVIDIR RESPUESTAS.

---

1️⃣ ESTRUCTURA PROFESIONAL DE ARCHIVOS

Genera el árbol completo del proyecto Flutter incluyendo:

lib/src/core
lib/src/domain
lib/src/data
lib/src/presentation

Mostrar directorios y archivos .dart.

---

2️⃣ PLAN DE IMPLEMENTACIÓN COMPLETO

Genera TODAS las fases completas:

FASE 1 — Core & Data

* entidades
* DTOs
* persistencia local
* factory database
* manejo de errores

FASE 2 — Business Logic

* repositories
* use cases
* reglas del parque
* validación de accesos
* value objects

FASE 3 — UI Adaptativa

* diseño mobile vs desktop
* navegación
* flujo de venta
* state management
* arquitectura presentation

FASE 4 — Desktop & Hardware

* atajos teclado Windows
* generación PDF
* offline-first
* preparación hardware futuro

Cada fase debe explicarse como PLAN DE IMPLEMENTACIÓN PROFESIONAL.

NO incluir código.

---

3️⃣ DICCIONARIO DE DATOS

Definir:

* tablas
* campos
* tipos
* relaciones (1:N, N:M)
* claves primarias y foráneas

---

4️⃣ ESTÁNDARES DE CALIDAD

Definir:

* reglas de naming (camelCase, PascalCase)
* manejo de errores funcional
* convenciones arquitectónicas
* responsabilidades por capa
* principios SOLID aplicados

---

FORMATO DE RESPUESTA:

* Documento técnico profesional
* Extenso
* Bien estructurado
* Nivel arquitecto senior
* Sin explicaciones educativas
* Sin ejemplos simples
* Sin código fuente

---

OBJETIVO FINAL:

Generar la documentación base completa para iniciar el desarrollo profesional del sistema Antigravity.
