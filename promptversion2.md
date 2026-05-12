Role: Senior Fullstack Software Architect & Flutter Expert.
Project Name: Antigravity Park Management System (Multiplatform).

## INSTRUCCIÓN DE ALTA PRIORIDAD:
Actúa como un Arquitecto de Software Senior con 15 años de experiencia. Necesito que diseñes la arquitectura completa del proyecto "Antigravity". No quiero un código genérico; quiero una estructura de grado empresarial que cumpla con los estándares de Clean Architecture y SOLID. Este proyecto es una solución multiplataforma que debe ejecutarse de forma nativa y fluida en Android, iOS, Windows y Web desde una única base de código.

# 1. CONTEXTO Y LÓGICA DE NEGOCIO "ANTIGRAVITY"
El sistema debe gestionar la operatividad de un parque de atracciones con una lógica de acceso granular basada en el nivel de gravedad y el estatus del usuario.

A. Matriz de Acceso de Boletos:

Básico: Acceso estándar a atracciones de categoría "Básica". Sin prioridades.

VIP: Acceso total a todas las atracciones (Básicas y VIP) con lógica de "Fast Track" integrada.

Familiar: Un boleto maestro que vincula múltiples perfiles (padres/hijos) con acceso compartido a atracciones básicas.

Anual: Membresía de larga duración con persistencia de datos histórica y acceso total.

B. Especificaciones de Atracciones:

Cada atracción debe poseer metadatos técnicos: ID, Nombre, Categoría (VIP/Básica), Estado (Abierta/Mantenimiento/Cerrada), Capacidad Máxima, y el atributo exclusivo G-Force Intensity (Nivel de intensidad de gravedad).

# 2. REQUERIMIENTOS TÉCNICOS Y RESTRICCIONES (ESTRICTO)
Para cumplir con los estándares académicos y profesionales solicitados:

Framework: Flutter 3.x estable con Dart 3.x (uso de Records, Patterns y Sealed Classes).

No Analytics: Queda estrictamente prohibida la importación de cualquier paquete de rastreo (Firebase Analytics, Mixpanel, etc.). La privacidad es prioridad absoluta.

No Production Overkill: No implementar despliegues complejos de CI/CD o microservicios externos; el sistema debe ser un "Monolito Limpio" fácil de ejecutar en modo debug/estándar.

Arquitectura: Implementación obligatoria de Clean Architecture dividida en:

Domain Layer: Entidades puras, Repositorios (interfaces) y Use Cases (Interactors).

Data Layer: Implementaciones de repositorios, DTOs (Data Transfer Objects), Mappers y Data Sources (Local/Remote).

Presentation Layer: State Management (Riverpod o BLoC), UI Widgets y Screens adaptativas.

# 3. TAREAS DE INGENIERÍA PREVIAS AL CÓDIGO
Antes de escribir el main.dart, necesito que generes un plan de implementación "Giga-Extenso" que cubra:

Módulo I: Refinamiento de Datos y Persistencia:

Diseño de un esquema de base de datos optimizado para sqflite (Desktop/Mobile) y Hive o IndexedDB (Web).

Explicación de cómo se manejarán las relaciones N:M entre Visitantes y Atracciones sin generar cuellos de botella.

Módulo II: UI Multiplataforma Adaptativa:

Estrategia de diseño para pantallas de Windows (Uso de Mouse/Keyboard, ventanas redimensionables) frente a Mobile (Touch, SafeArea, Gestos).

Uso de LayoutBuilder y BoxConstraints para una interfaz fluida.

Módulo III: Gestión de Estado y Flujo de Datos:

Propuesta de un sistema de estados reactivo que maneje la compra de boletos y la validación de acceso en tiempo real sin recargar la UI.

Módulo IV: Estándares de Calidad (Gobernanza):

Estructura jerárquica de carpetas completa (desde la raíz hasta los subdirectorios de assets).

Convenciones de nombrado (Clean Code) y manejo de errores mediante tipos funcionales (Either Left/Right).

# 4. ENTREGABLE REQUERIDO
Presenta este plan de forma detallada, técnica y profesional. Utiliza terminología de ingeniería de software. No generes el código todavía. Quiero que primero establezcas los cimientos teóricos y estructurales. Una vez que este plan sea aprobado, procederemos módulo por módulo.
