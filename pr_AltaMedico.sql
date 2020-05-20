/*
	Programa que llama al programa dbo.pr_IntroducirMedico
*/

DECLARE @VSalida int
EXEC dbo.pr_IntroducirMedico 'MMM', 'Mikel' ,'Mikel Mikel', 'Psiquiatria','1999-01-01','Titular', 1, 'Esta proxima su retirada', @VSalida output
Print @VSalida 

/*
	Introducir un medico a la base de datos, con los siguientes restricciones:
		Los Numeros de colegiado mas antiguos son los que son entre 0 y 999. Hoy
		en dia, no se aceptan estos numeros.
*/
ALTER PROCEDURE dbo.pr_IntroducirMedico
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