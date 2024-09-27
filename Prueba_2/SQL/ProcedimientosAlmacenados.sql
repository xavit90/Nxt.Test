USE [NxtTest]
GO
-- =============================================
-- SCRIPTS PRUEBA 2
-- =============================================
SELECT
     [U].[UserId]
    ,[U].[Login]
    ,[U].[Nombre]
    ,[U].[Paterno]
    ,[U].[Materno]
    ,[E].[Sueldo]
    ,[E].[FechaIngreso]
 FROM [dbo].[Usuarios]      [U]
    JOIN [dbo].[Empleados]  [E] ON [E].[UserId] = [U].[UserId]

-- Listar top 10 usuarios de la base antes creada
SELECT TOP 10 * FROM [dbo].[Usuarios]
GO

-- Generar un archivo csv con las siguienets campos con su información(Login, Nombre completo, sueldo, fecha Ingreso)
SELECT
         [U].[Login]
        ,[U].[Nombre]
        ,[U].[Paterno]
        ,[U].[Materno]
        ,[E].[Sueldo]
        ,[E].[FechaIngreso]
     FROM [dbo].[Usuarios]      [U]
        JOIN [dbo].[Empleados]  [E] ON [E].[UserId] = [U].[UserId]
GO

--Poder actualizar el salario del algun usuario especifico
DECLARE @userId INT,
        @sueldo DECIMAL(8,2);

IF (EXISTS(SELECT [UserId] FROM [dbo].[Empleados] WHERE [UserId] = @userId)) BEGIN
    UPDATE [dbo].[Empleados] SET [Sueldo] = @sueldo WHERE [UserId] = @userId;
END
GO

--Poder Tener una opcion para agregar un nuevo usuario y se pueda asiganar el salario y la fecha de ingreso por default el dia de hoy
DECLARE  @login         VARCHAR(100)
        ,@nombre        VARCHAR(100)
        ,@paterno       VARCHAR(100)
        ,@materno       VARCHAR(100)
        ,@userId        INT
        ,@sueldo        DECIMAL(8,2)
        ,@fechaIngreso  DATE = GETDATE();

INSERT INTO [dbo].[Usuarios] VALUES(@login, @nombre, @paterno, @materno);
SET @userId = SCOPE_IDENTITY();
INSERT INTO [dbo].[Empleados] VALUES (@userId, @sueldo, @fechaIngreso);
GO