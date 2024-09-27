USE [NxtTest]
GO
-- =============================================
-- TABLAS PRUEBA 1
-- =============================================
IF (OBJECT_ID('[dbo].[Empleados]', 'U') IS NOT NULL)
    DROP TABLE [dbo].[Empleados];

IF (OBJECT_ID('[dbo].[Usuarios]', 'U') IS NOT NULL)
    DROP TABLE [dbo].[Usuarios];
GO

CREATE TABLE [dbo].[Usuarios] (
     [UserId]   INT IDENTITY(1,1)
    ,[Login]    VARCHAR(100) UNIQUE NOT NULL
    ,[Nombre]   VARCHAR(100) NOT NULL
    ,[Paterno]  VARCHAR(100) NOT NULL
    ,[Materno]  VARCHAR(100)
    ,CONSTRAINT [PK_Usuarios_UserId] PRIMARY KEY ([UserId])
)
GO

CREATE TABLE [dbo].[Empleados] (
     [UserId]       INT
    ,[Sueldo]       DECIMAL(8,2)
    ,[FechaIngreso] DATE
    ,CONSTRAINT [FK_Empleados_UserId] FOREIGN KEY ([UserId])
        REFERENCES [Usuarios]([UserId])
        ON DELETE CASCADE
        ON UPDATE CASCADE
)
GO

-- =============================================
-- DATOS PRUEBA 1   
-- =============================================
INSERT INTO [dbo].[Usuarios]
    VALUES   ('user01', 'BERE', 'NARANJO', 'GONZALEZ')
            ,('user02', 'ALEXIS', 'CAMPOS', 'NARANJO')
            ,('user03', 'SERGIO ALEJANDRO', 'CAMPOS', 'HERNANDEZ')
            ,('user04', 'DIEGO ISMAEL', 'BERUMEN', 'CEDILLO')
            ,('user05', 'AURORA', 'ESCALANTE', 'PALAFOX')
            ,('user06', 'JOYCELENE FABIOLA', 'ESTRADA', 'BARBA')
            ,('user07', 'FRANCISCO', 'ESTRADA', 'GOMEZ')
            ,('user08', 'LEONARDO DANIEL', 'FARIAS', 'ROSAS')
            ,('user09', 'RAMON ANDRES', 'FIERROS', 'ROBLES')
            ,('user10', 'EDGAR ANDRES', 'FLORES', 'OLIVARES')
            ,('user11', 'MARIA FERNANDA', 'FRANCO', 'ESQUIVEL')
            ,('user12', 'ALEJANDRO', 'GALVAN', 'MUÑIZ')
            ,('user13', 'MARTHA ALICIA', 'GUTIERREZ', 'ORTIZ')
            ,('user14', 'JOSAFAT GERARDO', 'HERNANDEZ', 'SAUCEDO')
            ,('user15', 'ROSALIA', 'JIMENEZ', 'GONZALEZ')
            ,('user16', 'LAURA CELENE', 'JIMENEZ', 'RIOS')
            ,('user17', 'ANGELICA', 'LOPEZ', 'CORTES')
            ,('user18', 'CRISTIAN IVAN', 'LOPEZ', 'GOMEZ')
            ,('user19', 'MARLENE GABRIELA', 'LOPEZ', 'MEZA')
            ,('user20', 'ALEJANDRA', 'MEDINA', 'IBARRA')
            ,('user21', 'CONSUELO YURIDIANA THALIA', 'MEJIA', 'ALVAREZ')
            ,('user22', 'JAVIER ADRIAN', 'MEJIA', 'ALVAREZ')
            ,('user23', 'JUAN CARLOS EVARISTO', 'PEÑA', 'GUTIERREZ')
            ,('user24', 'JAZMIN ALEJANDRA', 'PEREZ', 'VELEZ')
            ,('user25', 'GUSTAVO', 'RAMIREZ', 'RIVERA')
            ,('user26', 'CARLOS NIVARDO', 'RODRIGUEZ', 'ASCENCIO')
            ,('user27', 'KARLA JOHANA', 'ROMERO', 'LUEVANOS')
            ,('user28', 'YESSICA YOSELINNE', 'RUIZ', 'HERNANDEZ')
            ,('user29', 'CHRISTIAN EDUARDO', 'SALAS', 'SANCHEZ')
            ,('user30', 'LUIS ROBERTO', 'SALDAÑA', 'ESPINOZA')
            ,('user31', 'ADRIAN', 'SANCHEZ', 'ORTIZ')
            ,('user32', 'EDUARDO YAIR', 'SUAREZ', 'HERNANDEZ')
            ,('user33', 'JUAN FRANCISCO', 'TABAREZ', 'GARCIA')
            ,('user34', 'ZULEICA ELIZABETH', 'TERAN', 'TORRES')
            ,('user35', 'ADRIANA YUNUHEN', 'VARGAS', 'AYALA')
            ,('user36', 'OSCAR URIEL', 'VELAZQUEZ', 'ALVAREZ')
            ,('user37', 'ERICK DE JESUS', 'CORONA', 'DIAZ')
            ,('user38', 'MARIA GUADALUPE', 'RAMOS', 'HERNANDEZ')
            ,('user39', 'JESSICA NOEMI', 'JIMENEZ', 'VENTURA')
            ,('user40', 'FLOR MARGARITA', 'ROJAS', 'HERNANDEZ')
            ,('user41', 'LUIS ANTONIO', 'ALVARADO', 'VALENCIA')
            ,('user42', 'EDGAR IVAN', 'AGUILAR', 'PADILLA')
            ,('user43', 'LUIS ALFONSO', 'MICHEL', 'SANCHEZ')
            ,('user44', 'JOSE CARLOS', 'SILVA', 'ROCHA')
            ,('user45', 'JUDITH', 'RODRIGUEZ', 'REYES')
            ,('user46', 'BRENDA SORAYA', 'CHAVEZ', 'GARCIA')
            ,('user47', 'ALMA ROSA', 'MARQUEZ', 'AGUILA')
GO

INSERT INTO [dbo].[Empleados]
    VALUES   ('1', 8837, '2000-01-11')
            ,('2', 8837, '2000-01-11')
            ,('3', 15000, '2000-01-11')
            ,('4', 15000, '2000-01-11')
            ,('5', 7812, '2000-01-18')
            ,('6', 7812, '2000-01-18')
            ,('7', 10200, '2000-01-18')
            ,('8', 10200, '2000-01-18')
            ,('9', 13800, '2001-05-20')
            ,('10', 13800, '2001-05-20')
            ,('11', 18880, '2001-05-20')
            ,('12', 18880, '2001-05-20')
            ,('13', 8000, '2001-07-13')
            ,('14', 8000, '2001-07-13')
            ,('15', 6000, '2001-07-13')
            ,('16', 19470, '2001-07-13')
            ,('17', 19470, '2001-07-13')
            ,('18', 10200, '2001-07-16')
            ,('19', 10200, '2001-07-16')
            ,('20', 25000, '2001-07-16')
            ,('21', 7812, '2001-07-16')
            ,('22', 7812, '2001-07-16')
            ,('23', 12210, '2001-11-24')
            ,('24', 12210, '2001-11-24')
            ,('25', 7500, '2001-11-24')
            ,('26', 15020, '2001-11-24')
            ,('27', 15020, '2001-11-24')
            ,('28', 25000, '2001-11-24')
            ,('29', 7812, '2001-11-24')
            ,('30', 15020, '2001-12-12')
            ,('31', 15020, '2001-12-12')
            ,('32', 12210, '2001-12-12')
            ,('33', 12210, '2001-12-12')
            ,('34', 19470, '2008-08-17')
            ,('35', 19470, '2008-08-17')
            ,('36', 8000, '2008-08-17')
            ,('37', 8000, '2008-08-17')
            ,('38', 18880, '2009-06-11')
            ,('39', 18880, '2009-06-11')
            ,('40', 14000, '2009-06-11')
            ,('41', 13800, '2009-06-11')
            ,('42', 13800, '2009-06-11')
            ,('43', 15000, '2009-10-06')
            ,('44', 15000, '2009-10-06')
            ,('45', 13000, '2009-10-06')
            ,('46', 8837, '2009-10-06')
GO