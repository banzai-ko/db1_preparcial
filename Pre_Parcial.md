# Pre Parcial


## CREACION
```sql
--Linux capital cases
CREATE DATABASE IF NOT EXISTS CompumundohipermegaredSA;

-- Si es necesario, según admin de db
USE CompumundohipermegaredSA;

CREATE TABLE IF NOT EXISTS Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    email VARCHAR(100) UNIQUE
);
-- ok clientes

CREATE TABLE IF NOT EXISTS Productos (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    stock INT
);

-- ok productos

CREATE TABLE IF NOT EXISTS Ventas (
    venta_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha DATE NOT,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);
-- ok ventas 

CREATE TABLE IF NOT EXISTS DetalleVenta (
    detalle_id INT PRIMARY KEY AUTO_INCREMENT,
    venta_id INT,
    producto_id INT,
    cantidad INT,
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (venta_id) REFERENCES Ventas(venta_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);

-- ok detalleventa

```
## Data Clientes

| cliente_id | nombre              | direccion                                   | telefono | email                               |
|------------|---------------------|---------------------------------------------|----------|-------------------------------------|
| 1          | Juan Pérez          | Calle Falsa 123, Springfield                | 555-1234 | juan.perez@example.com              |
| 2          | Ana Gómez           | Avenida Siempre Viva 456, Springfield       | 555-5678 | ana.gomez@example.com               |
| 3          | Carlos Fernández    | Plaza Central 789, Shelbyville              | 555-8765 | carlos.fernandez@example.com        |
| 4          | María López         | Calle Real 321, Shelbyville                 | 555-4321 | maria.lopez@example.com             |
| 5          | Pedro Martínez      | Boulevard de los Sueños 654, Springfield    | 555-9876 | pedro.martinez@example.com          |
### SQL

```sql
INSERT INTO Clientes (nombre, direccion, telefono, email)
VALUES
('Juan Pérez', 'Calle Falsa 123, Springfield', '555-1234', 'juan.perez@example.com'),
('Ana Gómez', 'Avenida Siempre Viva 456, Springfield', '555-5678', 'ana.gomez@example.com'),
('Carlos Fernández', 'Plaza Central 789, Shelbyville', '555-8765', 'carlos.fernandez@example.com'),
('María López', 'Calle Real 321, Shelbyville', '555-4321', 'maria.lopez@example.com'),
('Pedro Martínez', 'Boulevard de los Sueños 654, Springfield', '555-9876', 'pedro.martinez@example.com');


``` 

### Data Productos

| producto_id | nombre                   | descripcion                                                     | precio  | stock  |
|-------------|--------------------------|----------------------------------------------------------------|----------|--------|
| 1           | Laptop Gamer             | Laptop con procesador i7, 16GB RAM, 512GB SSD                  | 1500.00  | 10     |
| 2           | Monitor 24" Full HD      | Monitor LED 24 pulgadas, resolución Full HD                    | 200.00   | 20     |
| 3           | Teclado Mecánico         | Teclado mecánico retroiluminado RGB                            | 80.00    | 15     |
| 4           | Ratón Ergonómico         | Ratón ergonómico con ajuste de DPI                             | 50.00    | 25     |
| 5           | Auriculares Gaming       | Auriculares con micrófono y sonido envolvente                  | 120.00   | 30     |

```sql
INSERT INTO Productos (nombre, descripcion, precio, stock)
VALUES
('Laptop Gamer', 'Laptop con procesador i7, 16GB RAM, 512GB SSD', 1500.00, 10),
('Monitor 24" Full HD', 'Monitor LED 24 pulgadas, resolución Full HD', 200.00, 20),
('Teclado Mecánico', 'Teclado mecánico retroiluminado RGB', 80.00, 15),
('Ratón Ergonómico', 'Ratón ergonómico con ajuste de DPI', 50.00, 25),
('Auriculares Gaming', 'Auriculares con micrófono y sonido envolvente', 120.00, 30);
```

### Data Ventas

## Data Ventas

| venta_id  | cliente_id | fecha      | total   |
|-----------|-------------|-------------|---------|
| 1         | 1           | 2024-08-01  | 1680.00 |
| 2         | 2           | 2024-08-02  | 280.00  |
| 3         | 3           | 2024-08-03  | 80.00   |
| 4         | 4           | 2024-08-04  | 50.00   |
| 5         | 5           | 2024-08-05  | 120.00  |

```sql
INSERT INTO Ventas (venta_id, cliente_id, fecha, total)
VALUES
(1, 1, '2024-08-01', 1680.00),
(2, 2, '2024-08-02', 280.00),
(3, 3, '2024-08-03', 80.00),
(4, 4, '2024-08-04', 50.00),
(5, 5, '2024-08-05', 120.00);
```

### Data Detalle de Venta

## Data DetalleVenta

| detalle_id  | venta_id  | producto_id  | cantidad  | subtotal  |
|-------------|-----------|--------------|-----------|-----------|
| 1           | 1         | 1            | 1         | 1500.00   |
| 2           | 1         | 2            | 1         | 200.00    |
| 3           | 2         | 2            | 1         | 200.00    |
| 4           | 3         | 3            | 1         | 80.00     |
| 5           | 4         | 4            | 1         | 50.00     |
| 6           | 5         | 5            | 1         | 120.00    |


```sql
INSERT INTO DetalleVenta (venta_id, producto_id, cantidad, subtotal)
VALUES
(1, 1, 1, 1500.00),
(1, 2, 1, 200.00),
(2, 2, 1, 200.00),
(3, 3, 1, 80.00),
(4, 4, 1, 50.00),
(5, 5, 1, 120.00);
--Inserciones ok
```


### Actualizar 

```sql
UPDATE Clientes 
SET direccion = 'Avenida del Sol 789, Ciudad',
    telefono = '555-111', 
    email ='juan.perez@nuevoemail.com' 
WHERE cliente_id = 1;
-- Mostart
SELECT * FROM Clientes WHERE cliente_id = 1;
```

Debería verse cliente_id 1 actualizado con la nueva información.

### Restricciones

#### Borrando ambos: 
```sql

-- 1. Verificar qué detalle pertenece a la venta 3
SELECT * 
FROM Detalleventa
WHERE venta_id = 3;

-- 2. Eliminar primero el detalle de venta asociado
DELETE FROM Detalleventa
WHERE venta_id = 3;

-- 3. Eliminar la venta
DELETE FROM Ventas
WHERE venta_id = 3;

-- 4. Verificar que la venta fue eliminada
SELECT * 
FROM Ventas
WHERE venta_id = 3;

-- 5. Verificar que también se eliminó el detalle
SELECT * 
FROM DetalleVenta
WHERE venta_id = 3;

```

### Relación NULL
```sql
-- 1. Quitar la relación solo para la venta 3
UPDATE DetalleVenta
SET venta_id = NULL
WHERE venta_id = 3;

-- 2. Eliminar la venta
DELETE FROM Ventas
WHERE venta_id = 3;

-- 3. Verificar
SELECT * 
FROM DetalleVenta
WHERE detalle_id = 4;
-- 4. Check

SELECT * 
FROM Ventas 
where venta_id = 3;

-- PASS: RESULT 0 PASS
-- FAIL: RESULTA > 0
```


#### Transaction

```sql
START TRANSACTION;

-- 1. Quitar la relación solo para la venta 3
UPDATE DetalleVenta
SET venta_id = NULL
WHERE venta_id = 3;

-- 2. Eliminar la venta
DELETE FROM Ventas
WHERE venta_id = 3;

-- 3. Verificar antes de confirmar
SELECT *
FROM DetalleVenta
WHERE detalle_id = 4;

-- 4. Confirmar cambios si todo está correcto
COMMIT;

-- Si algo sale mal, usar:
-- ROLLBACK;


```


### Indice en campo Fecha

```sql
CREATE INDEX idx_ventas_fecha
ON Ventas (fecha);
``` 
#### Revisar
```sql
SHOW INDEX FROM Ventas
WHERE Key_name = 'idx_ventas_fecha';
```

#### Ejemplo
**Consultas:**
```sql
SELECT *
FROM Ventas
WHERE fecha BETWEEN '2024-08-01' AND '2024-08-31';
``` 
**Orden:**
```sql
SELECT *
FROM Ventas
ORDER BY fecha
```


### Vistas

#### Vista Total Ventas
Mostrar el total de ventas del último año

```sql
CREATE VIEW vista_total_ventas AS
SELECT 
    SUM(total) AS total_ventas
FROM Ventas
WHERE fecha BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 MONTH) AND CURDATE();
```

**Uso:**
```sql
SELECT *
FROM vista_total_ventas;
-- OK. vacia, ventas 2024
```


### Vista Total Compras
Mostrar el nombre de cada cliente y el monto total de todas sus compras.    

```sql 
CREATE VIEW vista_total_compras AS
SELECT
    c.cliente_id,
    c.nombre,
    SUM(v.total) AS total_compras
FROM Clientes c
LEFT JOIN Ventas v ON c.cliente_id = v.cliente_id
GROUP BY c.cliente_id, c.nombre;

```
**Uso:***
```sql 
SELECT *
FROM vista_total_compras;
```

```sql
db/CompumundohipermegaredSA/vista_total_compras/		
Showing rows 0 -  3 (4 total, Query took 0.0004 seconds.)


SELECT *
FROM vista_total_compras;


cliente_id	nombre	total_compras	
1	Juan Pérez	1680.00	
2	Ana Gómez	280.00	
4	María López	50.00	
5	Pedro Martínez	120.00	

```



### Vista Detalle Ventas
Mostrar el detalle de venta donde se incluya la fecha de venta, el nombre del cliente, el nombre del
producto, la cantidad vendida y el subtotal.

```sql
CREATE VIEW vista_detalle_ventas AS
SELECT
    v.fecha,
    c.nombre AS cliente,
    p.nombre AS producto,
    dv.cantidad,
    dv.subtotal
FROM DetalleVenta dv
JOIN Ventas v ON dv.venta_id = v.venta_id
JOIN Clientes c ON v.cliente_id = c.cliente_id
JOIN Productos p ON dv.producto_id = p.producto_id;

```

**Uso:**

```sql
SELECT *
FROM vista_detalle_ventas;

``` 

```sql
db/CompumundohipermegaredSA/vista_detalle_ventas/		

   Showing rows 0 -  4 (5 total, Query took 0.0023 seconds.)


SELECT *
FROM vista_detalle_ventas;
```
```sql
db/CompumundohipermegaredSA/vista_detalle_ventas/		

   Showing rows 0 -  4 (5 total, Query took 0.0005 seconds.)


SELECT *
FROM vista_detalle_ventas;


fecha	cliente	producto	cantidad	subtotal	
2024-08-01	Juan Pérez	Laptop Gamer	1	1500.00	
2024-08-01	Juan Pérez	Monitor 24" Full HD	1	200.00	
2024-08-02	Ana Gómez	Monitor 24" Full HD	1	200.00	
2024-08-04	María López	Ratón Ergonómico	1	50.00	
2024-08-05	Pedro Martínez	Auriculares Gaming	1	120.00	


```



### Vista Contar .com
Mostrar el total de clientes que tienen como dominio en su mail, la terminación ".com". 
```sql
CREATE VIEW vista_contar_punto_com AS
SELECT
    COUNT(*) AS total_clientes_com
FROM Clientes
WHERE email LIKE '%.com';
```

**Uso:**

```sql
SELECT *
FROM vista_contar_punto_com;
```

```sql
db/CompumundohipermegaredSA/vista_contar_punto_com

   Showing rows 0 -  0 (1 total, Query took 0.0006 seconds.)


SELECT *
FROM vista_contar_punto_com;


-- total_clientes_com	
-- 5	
```


#### Borrar vista 
- Monto de las ventas del ultimo año
```sql
DROP VIEW vista_total_compras;
-- ok
``` 

## Catálogo

```sql 
-- Ver todo
SELECT
    TABLE_NAME AS tabla,
    COLUMN_NAME AS columna,
    COLUMN_TYPE AS tipo_dato,
    IS_NULLABLE AS permite_null,
    COLUMN_KEY AS tipo_clave,
    EXTRA AS extra
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'CompumundohipermegaredSA'
  AND TABLE_NAME IN ('Clientes', 'Productos', 'Ventas', 'DetalleVenta')
ORDER BY TABLE_NAME, ORDINAL_POSITION;
```

```sql
db/information_schema/COLUMNS/

   Showing rows 0 - 18 (19 total, Query took 0.0011 seconds.)


SELECT
    TABLE_NAME AS tabla,
    COLUMN_NAME AS columna,
    COLUMN_TYPE AS tipo_dato,
    IS_NULLABLE AS permite_null,
    COLUMN_KEY AS tipo_clave,
    EXTRA AS extra
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'CompumundohipermegaredSA'
  AND TABLE_NAME IN ('Clientes', 'Productos', 'Ventas', 'DetalleVenta')
ORDER BY TABLE_NAME, ORDINAL_POSITION;


tabla	columna	tipo_dato	permite_null	tipo_clave	extra	
Clientes	cliente_id	int	NO	PRI	auto_increment	
Clientes	nombre	varchar(100)	YES			
Clientes	direccion	varchar(255)	YES			
Clientes	email	varchar(100)	YES	UNI		
Clientes	telefono	varchar(15)	YES			
DetalleVenta	detalle_id	int	NO	PRI	auto_increment	
DetalleVenta	venta_id	int	YES	MUL		
DetalleVenta	producto_id	int	YES	MUL		
DetalleVenta	cantidad	int	YES			
DetalleVenta	subtotal	decimal(10,2)	YES			
Productos	producto_id	int	NO	PRI	auto_increment	
Productos	nombre	varchar(100)	YES			
Productos	descripcion	text	YES			
Productos	precio	decimal(10,2)	YES			
Productos	stock	int	YES			
Ventas	venta_id	int	NO	PRI	auto_increment	
Ventas	cliente_id	int	YES	MUL		
Ventas	fecha	date	YES	MUL		
Ventas	total	decimal(10,2)	YES			

```

MAS BASICO >>> HACER ESTE CASO
```sql 

SELECT 
    TABLE_NAME AS nombre,
    TABLE_TYPE AS tipo
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'CompumundohipermegaredSA'
ORDER BY TABLE_TYPE, TABLE_NAME;
```


```sql 
-- Ver detalle de índices de la tabla ventas
SHOW INDEX FROM Ventas;

```
```sql
-- respuesta
db/CompumundohipermegaredSA

   Your SQL query has been executed successfully. (Query took 0.0019 seconds.)


SHOW INDEX FROM Ventas;



Ventas	0	PRIMARY	1	venta_id	A	0	NULL	NULL		BTREE			YES	NULL	
Ventas	1	cliente_id	1	cliente_id	A	0	NULL	NULL	YES	BTREE			YES	NULL	
Ventas	1	idx_ventas_fecha	1	fecha	A	4	NULL	NULL	YES	BTREE			YES	NULL	
```

```sql 
DESCRIBE Ventas;
```

## Constraint

```sql
ALTER TABLE Ventas
ADD CONSTRAINT chk_total_mayor_0
CHECK (total > 0);
```

#### TEST Constraint
FAIL
```sql
-- Caso inválido (debe fallar por el CHECK)
INSERT INTO Ventas (venta_id, cliente_id, fecha, total)
VALUES (7, 2, '2026-05-01', -50.00);
```

PASS
```sql
-- Caso válido 
INSERT INTO Ventas (venta_id, cliente_id, fecha, total)
VALUES (7, 2, '2026-05-01', 150.00);
```

### GROUP

```sql
SELECT
    c.cliente_id,
    c.nombre,
    SUM(v.total) AS total_gastado
FROM Clientes c
JOIN Ventas v ON c.cliente_id = v.cliente_id
GROUP BY c.cliente_id, c.nombre
HAVING SUM(v.total) > 100;
```


```sql
db/CompumundohipermegaredSA/Clientes/

   Showing rows 0 -  2 (3 total, Query took 0.0008 seconds.)


SELECT
    c.cliente_id,
    c.nombre,
    SUM(v.total) AS total_gastado
FROM Clientes c
JOIN Ventas v ON c.cliente_id = v.cliente_id
GROUP BY c.cliente_id, c.nombre
HAVING SUM(v.total) > 100;


cliente_id	nombre	total_gastado	
1	Juan Pérez	1680.00	
2	Ana Gómez	430.00	
5	Pedro Martínez	120.00	

```




#### Vista Grupo 
Opcional
```sql
CREATE VIEW vista_clientes_mas_100 AS
SELECT
    c.cliente_id,
    c.nombre,
    SUM(v.total) AS total_gastado
FROM Clientes c
JOIN Ventas v ON c.cliente_id = v.cliente_id
GROUP BY c.cliente_id, c.nombre
HAVING SUM(v.total) > 100;
```
**Uso:**

```sql
SELECT *
FROM vista_clientes_mas_100;
```

### Trigger 
```sql
DELIMITER $$

CREATE TRIGGER trg_homero
BEFORE INSERT OR UPDATE ON Clientes
FOR EACH ROW
BEGIN
    IF NEW.nombre = 'Homero' AND
       (SELECT COUNT(*) FROM Clientes WHERE nombre LIKE '%Homero%') >= 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solo se permite un cliente llamado Homero';
    END IF;
END$$

DELIMITER ;
```

#### Test Trigger
PASS
```sql
-- Primera inserción (ok)
INSERT INTO Clientes (nombre, direccion, telefono, email)
VALUES ('Homero J Simpson', '742 Evergreen Terrace', '555-0001', 'homero@mailfalso.com');
```

FAIL
```sql
-- Segunda inserción (fallar)
INSERT INTO Clientes (nombre, direccion, telefono, email)
VALUES ('Homero Thomson', 'Av siempre Viva 123', '555-6666', 'homero@plantaenergianuclearspringfield.com');
``` 