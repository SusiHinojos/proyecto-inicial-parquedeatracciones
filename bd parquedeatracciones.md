## prompt

Diseña y genera el script SQL completo para una base de datos llamada "bdparque" utilizando MySQL.

El sistema corresponde a la gestión integral de un parque de atracciones.

Debe incluir EXACTAMENTE 10 entidades principales con sus relaciones, claves primarias y foráneas:
<img width="868" height="602" alt="image" src="https://github.com/user-attachments/assets/0a2245b3-3de5-4960-b418-1d2d84456ce8" />


1. Cliente
- id (PK)
- nombre
- apellido
- fecha_nacimiento
- email (UNIQUE)
- telefono
- documento (UNIQUE)

2. TipoEntrada
- id (PK)
- nombre
- precio_base
- descripcion
- vigencia_horas

3. Entrada
- id (PK)
- cliente_id (FK)
- tipo_entrada_id (FK)
- fecha_visita
- precio
- descuento
- estado (vendida, usada, cancelada)
- canal_venta

4. Zona
- id (PK)
- nombre
- descripcion
- capacidad_max
- mapa_coordenadas

5. Atraccion
- id (PK)
- zona_id (FK)
- nombre
- tipo
- capacidad_turno
- duracion_min
- altura_minima_cm
- peso_maximo_kg
- estado (activa, mantenimiento, cerrada)

6. Horario
- id (PK)
- atraccion_id (FK)
- fecha
- hora_apertura
- hora_cierre
- turnos_por_hora

7. Departamento
- id (PK)
- nombre
- descripcion

8. Empleado
- id (PK)
- departamento_id (FK)
- nombre
- apellido
- cargo
- fecha_contratacion
- salario
- estado (activo, inactivo, vacaciones)

9. Reserva
- id (PK)
- cliente_id (FK)
- entrada_id (FK)
- atraccion_id (FK)
- fecha_reserva
- turno_horario
- estado (pendiente, confirmada, cancelada)

10. AccesoLog
- id (PK)
- entrada_id (FK)
- atraccion_id (FK)
- timestamp
- resultado (permitido, denegado)
- motivo_denegacion


  ## tablas
  <img width="781" height="525" alt="image" src="https://github.com/user-attachments/assets/d7f60432-a9b2-47ac-b750-572b5ede209b" />
<img width="824" height="308" alt="image" src="https://github.com/user-attachments/assets/74e0d26e-c989-45d5-be14-d09311ca3681" />
<img width="757" height="601" alt="image" src="https://github.com/user-attachments/assets/8cea77e6-0dc5-4975-b48c-b3f5d4d416e0" />
<img width="773" height="598" alt="image" src="https://github.com/user-attachments/assets/8381b2b6-1e7e-4a7b-87dc-585d5abb2326" />
<img width="800" height="378" alt="image" src="https://github.com/user-attachments/assets/9c27be5a-81f5-411e-a4f7-267611fc3738" />
<img width="788" height="518" alt="image" src="https://github.com/user-attachments/assets/e72f6b44-55c3-4b9e-944c-02aae22252fd" />
<img width="783" height="301" alt="image" src="https://github.com/user-attachments/assets/b50de07c-57c0-4b26-a527-9c0d57f19ee0" />



REQUISITOS:
- Crear la base de datos bdparque.
- Usar AUTO_INCREMENT en todas las claves primarias.
- Definir correctamente FOREIGN KEY.
- Usar tipos de datos adecuados.
- Incluir ENUM cuando aplique.
- Entregar todo en un único archivo SQL listo para ejecutar.
- Compatible con MySQL Workbench.
