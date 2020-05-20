/*
	Programa que llama al programa dbo.usp_MostrarPacientesIngresados 
*/

EXEC dbo.usp_MostrarPacientesIngresados '1/1/2009' , '1/2/2009'

/*
	Mostrar los nombres  y otros datos de los pacientes segun la fecha
*/
CREATE PROCEDURE dbo.usp_MostrarPacientesIngresados
	@p_Fecha_A DATE,
	@p_Fecha_B DATE
AS

BEGIN
	select * from [dbo].[Ingresos] as I
	inner join [dbo].[Pacientes] as P on i.[Numero de Historial] = P.[Numero de historial]
	WHERE i.[Fecha de Ingreso] between @p_Fecha_A and @p_Fecha_B 

END