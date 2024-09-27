USE [NxtTest]
GO
-- =============================================
-- SCRIPTS PRUEBA 1
-- Las sentencias se generan con un rollback para comprobar
-- =============================================

-- Depurar solo los ID diferentes de 6,7,9 y 10 de la tabla usuarios
BEGIN TRAN [T]
    DELETE FROM [dbo].[Usuarios] WHERE [UserId] NOT IN (6,7,9,10); -->
    SELECT * FROM [dbo].[Usuarios];
ROLLBACK TRAN [T]

--Actualizar el dato Sueldo en un 10 porciento a los empleados que tienen fechas entre el año 2000 y 2001
BEGIN TRAN [T]
    UPDATE [dbo].[Empleados] SET [Sueldo] = [Sueldo] * 1.10 WHERE DATEPART(YEAR, [FechaIngreso]) BETWEEN 2000 AND 2001; -->
    SELECT * FROM [dbo].[Empleados];
ROLLBACK TRAN [T]

--Realiza una consulta para traer el nombre de usuario y fecha de ingreso de los usuarios que gananen mas de 10000 y su apellido comience con T ordernado del mas reciente al mas antiguo
SELECT
     [U].[Login]
    ,[Nombre] = CONCAT([U].[Nombre], ' ', [U].[Paterno])
    ,[E].[FechaIngreso]
 FROM [dbo].[Usuarios]      [U]
    JOIN [dbo].[Empleados]  [E] ON [E].[UserId] = [U].[UserId]
 WHERE [U].[Paterno] LIKE 'T%'
 ORDER BY [E].[FechaIngreso] DESC

--Realiza una consulta donde agrupes a los empleados por sueldo, un grupo con los que ganan menos de 1200 y uno mayor o igual a 1200, cuantos hay en cada grupo?
DECLARE @monto DECIMAL(18,2) = 1200;--12000

WITH [GruposEmpleado] ([Descripcion], [Total]) AS (
    SELECT CONCAT('Menor a $', @monto), COUNT(*)
     FROM [dbo].[Empleados] [E]
     WHERE [E].[Sueldo] < @monto
    UNION
    SELECT CONCAT('Mayor o igual a $', @monto), COUNT(*)
     FROM [dbo].[Empleados] [E]
     WHERE [E].[Sueldo] >= @monto
)
SELECT * FROM [GruposEmpleado];