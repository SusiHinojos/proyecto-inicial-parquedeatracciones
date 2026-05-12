# 📱 Plan de Implementación: Aplicación "Jardín de las Maravillas"
> **Stack:** Flutter (Dart) + Firebase (Auth + Firestore) + Provider  
> **IDE Principal:** VS Code  
> **Alcance:** Multiplataforma (iOS, Android, Web) | Sin código en esta fase

---

## 🧰 Fase 0: Prerrequisitos y Herramientas
1. **Instalar SDKs y Entornos**
   - Flutter SDK (última versión estable)
   - Dart SDK (incluido en Flutter)
   - Android Studio (solo para SDKs de Android, emuladores y CLI tools)
   - Xcode (solo macOS, para compilación iOS)
2. **Configurar VS Code**
   - Extensiones obligatorias: `Flutter`, `Dart`, `Firebase`, `Pubspec Assist`, `Error Lens`
   - Activar formateo automático y linting (`flutter_lints`)
3. **Firebase CLI & FlutterFire**
   - Instalar `firebase-tools` via npm
   - Autenticar con `firebase login`
   - Instalar `flutterfire` CLI para generar configuración automática
4. **Control de Versiones**
   - Inicializar repositorio Git
   - Configurar `.gitignore` estándar para Flutter + Firebase
   - Establecer rama principal `main` y flujo de desarrollo `dev`

---

## 🎨 Fase 1: Diseño UI/UX y Arquitectura de Navegación
1. **Definir Sistema de Diseño**
   - Paleta de colores: temática jardín/maravillas (verdes, dorados, blancos, acentos vibrantes)
   - Tipografía: 1 fuente principal (legible en móvil), 1 fuente decorativa para títulos
   - Componentes reutilizables: botones primarios/secundarios, tarjetas, loaders, diálogos de error
2. **Wireframes y Flujos de Pantalla**
   - `Login / Registro` → Validación, recuperación de contraseña
   - `Home / Dashboard` → Bienvenida, estado del parque, acceso rápido
   - `Catálogo de Boletos` → 4 tipos con detalles, precios y beneficios
   - `Atracciones` → Filtros (Básicas / VIP), estado en tiempo real, mapas o listas
   - `Perfil / Mis Compras` → Historial, boletos activos, configuración
3. **Arquitectura de Navegación**
   - Definir rutas protegidas (requieren auth) y públicas
   - Establecer navegación inferior (BottomNavigationBar) o Drawer según prioridad de UX
   - Definir transiciones y manejo de estados de carga/empty/error

---

## 📦 Fase 2: Configuración de Dependencias (`pubspec.yaml`)
1. **Núcleo Firebase**
   - `firebase_core`
   - `firebase_auth`
   - `cloud_firestore`
2. **Gestión de Estado**
   - `provider`
3. **UI y Utilidades**
   - `google_fonts` / `flutter_svg` (si hay íconos vectoriales)
   - `cached_network_image` (para imágenes de atracciones/boletos)
   - `intl` (formato de fechas, monedas)
   - `flutter_lints` + `equatable` (modelos inmutables)
4. **Validación y Formularios (Opcional)**
   - `formz` o `flutter_form_builder` + `form_builder_validators`
5. **Notas de Mantenimiento**
   - Congelar versiones compatibles
   - Ejecutar `flutter pub get` y verificar conflictos
   - Documentar propósito de cada dependencia en `README.md`

---

## 🔐 Fase 3: Autenticación (Email/Password) y Configuración Firebase
1. **Configuración en Firebase Console**
   - Crear proyecto `jardin-de-las-maravillas`
   - Habilitar `Authentication → Email/Password`
   - Generar apps iOS/Android/Web y descargar `firebase_options.dart` vía `flutterfire configure`
2. **Estructura de Servicio de Auth**
   - Crear repositorio/clase `AuthService`
   - Métodos: `signIn`, `register`, `signOut`, `resetPassword`, `getCurrentUser`
   - Manejo de errores traducidos a mensajes de UI (ej. `wrong-password`, `user-not-found`)
3. **Estado de Sesión**
   - Implementar `Stream<User?>` para escuchar cambios de autenticación
   - Redirección automática a `Home` si hay sesión activa, o a `Login` si no
   - Persistencia de sesión manejada nativamente por Firebase Auth

---

## 🗄️ Fase 4: Base de Datos Firestore y Modelos de Datos
1. **Diseño de Colecciones**
   - `users/{uid}`: perfil, rol, historial de compras
   - `tickets`: definiciones de los 4 tipos (nombre, precio, beneficios, vigencia)
   - `attractions`: nombre, descripción, categoría (`basic`/`vip`), estado, tiempo de espera
   - `bookings/{uid}/purchases`: compras realizadas, fecha, ticket asociado, QR/código
2. **Modelos Dart**
   - Clases inmutables con `fromJson` / `toJson`
   - Enumeraciones: `TicketType`, `AttractionCategory`, `BookingStatus`
   - Validación de campos obligatorios
3. **Reglas de Seguridad Firestore**
   - Usuarios solo leen/escriben sus propios datos
   - Colecciones `tickets` y `attractions`: lectura pública, escritura solo admin
   - Validar tipos de datos y restricciones básicas en reglas

---

## 📊 Fase 5: Gestión de Estado con Provider
1. **Estructura de Providers**
   - `AuthProvider`: gestiona sesión, estado de carga, errores de login
   - `TicketProvider`: carga catálogo de boletos, selección, simulación de compra
   - `AttractionProvider`: carga atracciones, filtrado (Básico/VIP), actualizaciones en tiempo real
2. **Inyección en `main.dart`**
   - Envolver `MaterialApp` con `MultiProvider`
   - Inicializar streams y listeners solo cuando sean necesarios (lazy loading si aplica)
3. **Flujo de Datos UI ↔ Lógica**
   - `context.read()` para acciones que no reconstruyen UI
   - `context.watch()` / `Consumer` para suscripciones reactivas
   - Estados explícitos: `initial`, `loading`, `success`, `error`

---

## 🎟️ Fase 6: Desarrollo de Funcionalidades Core
1. **Módulo de Autenticación**
   - Pantalla con formulario validado
   - Manejo de errores en UI (snackbars, diálogos)
   - Enlace a recuperación de contraseña
2. **Catálogo de Boletos (4 Tipos)**
   - UI tipo cards con detalles y CTA
   - Lógica de selección y validación (edad, grupo, etc.)
   - Flujo de confirmación (mock de pago inicial)
3. **Atracciones Básicas y VIP**
   - Lista filtrable con indicadores visuales (badge VIP)
   - Información dinámica: estado, tiempo de espera, restricciones
   - Listener en tiempo real para cambios de estado (opcional: `StreamBuilder` + Firestore)
4. **Perfil y Historial**
   - Visualización de boletos activos
   - Historial de compras con estados
   - Cierre de sesión seguro

---

## 🧪 Fase 7: Pruebas, Optimización y Despliegue
1. **Pruebas Automatizadas**
   - Unit tests: modelos, lógica de proveedores, validaciones
   - Widget tests: pantallas de login, catálogo, filtros
   - Mock Firebase para pruebas aisladas
2. **Optimización de Rendimiento**
   - Evitar rebuilds innecesarios con `const` widgets y `Provider` selectivo
   - Cache de imágenes y datos estáticos
   - Lazy loading de listas largas (`ListView.builder`)
3. **Monitoreo y Analítica**
   - Integrar `firebase_crashlytics` y `firebase_analytics`
   - Eventos clave: login, compra simulada, filtrado de atracciones
4. **Compilación y Publicación**
   - `flutter build apk` / `aab` (Android)
   - `flutter build ios` (macOS + Xcode)
   - Preparar assets, íconos y splash screen
   - Revisar guías de Play Store / App Store (privacidad, permisos, política de datos)

---

## 📌 Notas y Buenas Prácticas para el Desarrollo
- ✅ **Arquitectura limpia:** separar UI, lógica de negocio, acceso a datos y modelos
- ✅ **Manejo de errores centralizado:** no exponer excepciones de Firebase directamente al usuario
- ✅ **Responsive:** probar en móvil, tablet y web desde `flutter run -d`
- ✅ **Variables de entorno:** usar `flutter_dotenv` para claves o configuraciones sensibles (no aplicar a Firebase, que usa `firebase_options.dart`)
- ✅ **Documentación:** mantener `README.md` actualizado con pasos de configuración local
- ✅ **Commits semánticos:** `feat:`, `fix:`, `refactor:`, `docs:`, `test:`

---

🔹 **Siguiente paso:** Cuando valides y apruebes este plan, puedo generar el código fase por fase (empezando por configuración del proyecto, `pubspec.yaml`, estructura de carpetas y autenticación). ¿Deseas ajustar algún flujo, agregar integraciones (ej. pasarela de pago, notificaciones push) o proceder con la primera entrega de código?
