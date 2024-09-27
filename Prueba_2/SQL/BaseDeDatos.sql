USE [master]
GO
-- =============================================
-- BASE DE DATOS
-- =============================================
CREATE DATABASE [NxtTest] ON (
    NAME = N'NxtTest',
    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\NxtTest.mdf',
    SIZE = 8192KB,
    MAXSIZE = 4096000KB,
    FILEGROWTH = 10240KB
)
LOG ON (
    NAME = N'NxtTest_log',
    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\NxtTest_log.ldf',
    SIZE = 8192KB,
    MAXSIZE = 1024000KB,
    FILEGROWTH = 65536KB
)
GO