USE [master]
GO
/****** Object:  Database [sql_Repaso_Hospital]    Script Date: 20/05/2020 21:26:27 ******/
CREATE DATABASE [sql_Repaso_Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sql_Repaso_Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sql_Repaso_Hospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sql_Repaso_Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sql_Repaso_Hospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sql_Repaso_Hospital] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sql_Repaso_Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sql_Repaso_Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET RECOVERY FULL 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sql_Repaso_Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sql_Repaso_Hospital] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'sql_Repaso_Hospital', N'ON'
GO
ALTER DATABASE [sql_Repaso_Hospital] SET QUERY_STORE = OFF
GO
USE [sql_Repaso_Hospital]
GO
/****** Object:  UserDefinedFunction [dbo].[fc_Contar_Pacientes]    Script Date: 20/05/2020 21:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[fc_Contar_Pacientes]
(
	-- Add the parameters for the function here
	 
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result =  COUNT([Numero de historial]) from [dbo].[Pacientes] 

	-- Return the result of the function
	RETURN @Result

END
GO
/****** Object:  UserDefinedFunction [dbo].[fc_Contar_Pacinte_Sexo]    Script Date: 20/05/2020 21:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[fc_Contar_Pacinte_Sexo] 
(
	--Tienes que introducir H o M o O 
	@Sexo int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = COUNT([Numero de historial])
	from [dbo].[Pacientes] 
	where [Sexo] = @Sexo

	-- Return the result of the function
	RETURN @Result
	
END
GO
/****** Object:  Table [dbo].[Ingresos]    Script Date: 20/05/2020 21:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingresos](
	[Numero de Ingreso] [int] NOT NULL,
	[Numero de Historial] [varchar](9) NULL,
	[Fecha de Ingreso] [date] NULL,
	[Codigo de Identificacion] [varchar](4) NULL,
	[Numero de planta] [int] NULL,
	[Numero de cama] [int] NULL,
	[Alergico] [bit] NULL,
	[Observacion] [varchar](150) NULL,
	[Coste del tratamienta] [int] NULL,
	[Diagnostico] [varchar](40) NULL,
 CONSTRAINT [PK_Ingresos] PRIMARY KEY CLUSTERED 
(
	[Numero de Ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 20/05/2020 21:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[Codigo identificacion] [varchar](4) NOT NULL,
	[Nombre del Medico] [varchar](15) NULL,
	[Apellidos del Medico] [varchar](30) NULL,
	[Espacialidad] [varchar](25) NULL,
	[Fecha de ingreso] [date] NULL,
	[Cargo] [varchar](25) NULL,
	[Numero de Colegiado] [int] NULL,
	[Observaciones] [varchar](150) NULL,
 CONSTRAINT [PK_Medicos] PRIMARY KEY CLUSTERED 
(
	[Codigo identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 20/05/2020 21:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[N Seguridad Social] [varchar](15) NULL,
	[Nombre] [varchar](15) NULL,
	[Apellidos] [varchar](30) NULL,
	[Domicilio] [varchar](30) NULL,
	[Poblacion] [varchar](25) NULL,
	[Provincia] [varchar](15) NULL,
	[Codigo Postal] [varchar](5) NULL,
	[Telefono] [varchar](12) NULL,
	[Numero de historial] [varchar](9) NOT NULL,
	[Sexo] [varchar](1) NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[Numero de historial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ingresos]  WITH CHECK ADD  CONSTRAINT [FK_Ingresos_Medicos] FOREIGN KEY([Codigo de Identificacion])
REFERENCES [dbo].[Medicos] ([Codigo identificacion])
GO
ALTER TABLE [dbo].[Ingresos] CHECK CONSTRAINT [FK_Ingresos_Medicos]
GO
ALTER TABLE [dbo].[Ingresos]  WITH CHECK ADD  CONSTRAINT [FK_Ingresos_Pacientes] FOREIGN KEY([Numero de Historial])
REFERENCES [dbo].[Pacientes] ([Numero de historial])
GO
ALTER TABLE [dbo].[Ingresos] CHECK CONSTRAINT [FK_Ingresos_Pacientes]
GO
ALTER TABLE [dbo].[Ingresos]  WITH CHECK ADD  CONSTRAINT [Restriccion_Ingreso_10Plantas] CHECK  (([Numero de planta]<=(10)))
GO
ALTER TABLE [dbo].[Ingresos] CHECK CONSTRAINT [Restriccion_Ingreso_10Plantas]
GO
ALTER TABLE [dbo].[Ingresos]  WITH CHECK ADD  CONSTRAINT [Restriccion_Ingresos_Cama200] CHECK  (([Numero de cama]<=(200)))
GO
ALTER TABLE [dbo].[Ingresos] CHECK CONSTRAINT [Restriccion_Ingresos_Cama200]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [Restriccion_Pacientes_Sexo] CHECK  (([Sexo]='H' OR [Sexo]='O' OR [Sexo]='M'))
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [Restriccion_Pacientes_Sexo]
GO
/****** Object:  StoredProcedure [dbo].[pr_IntroducirMedico]    Script Date: 20/05/2020 21:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_IntroducirMedico]
	@p_CodigoIdentificacion Varchar(4),
	@p_NombreDelMedico Varchar(15),
	@p_ApellidosDelMedio Varchar(30),
	@p_Espacialidad Varchar(25),
	@p_FecheDeIngreso date,
	@p_Cargo Varchar(25),
	@p_NumeroDeColegiado int,
	@p_Observarciones Varchar(150),
	@p_Salida int OUTPUT
AS

BEGIN
-- Control de numero de colegiado entre 0 y 999
	IF @p_NumeroDeColegiado BETWEEN 0 AND 999
			BEGIN
					SET @p_Salida = -1
					RETURN
			END
-- ALTA DEL MEDICO EN LA TABLA dbo.Medicos
	BEGIN TRY
			INSERT INTO dbo.Medicos ([Codigo identificacion],[Nombre del Medico],[Apellidos del Medico],Espacialidad,[Fecha de ingreso],Cargo,[Numero de Colegiado],Observaciones)
			VALUES (@p_CodigoIdentificacion,@p_NombreDelMedico,@p_ApellidosDelMedio,@p_Espacialidad,@p_FecheDeIngreso,@p_Cargo,@p_NumeroDeColegiado,@p_Observarciones)
	END TRY
	BEGIN CATCH --Errores del motor
		SET @p_Salida = @@ERROR
		RETURN
	END CATCH

	SET @p_Salida = 1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_MostrarPacientesIngresados]    Script Date: 20/05/2020 21:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_MostrarPacientesIngresados]
	@p_Fecha_A DATE,
	@p_Fecha_B DATE
AS

BEGIN
	select * from [dbo].[Ingresos] as I
	inner join [dbo].[Pacientes] as P on i.[Numero de Historial] = P.[Numero de historial]
	WHERE i.[Fecha de Ingreso] between @p_Fecha_A and @p_Fecha_B 

END
GO
USE [master]
GO
ALTER DATABASE [sql_Repaso_Hospital] SET  READ_WRITE 
GO
