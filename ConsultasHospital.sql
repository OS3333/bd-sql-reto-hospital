--consultas
--1 Nombre y fecha de toma de posesion de los medicos pediatras del hospital.
Select [Nombre del Medico], [Fecha de ingreso] FROM [dbo].[Medicos]

where [Espacialidad] ='Pediatria'

--2 Nombre de los pacientes residentes en Madrid capital.
Select [Nombre] FROM [dbo].[Pacientes]

WHERE [Provincia] = 'Madrid'

--3 Nombre de los medicos que autorizaron ingresos entre enero y febrero de 2010.
select m.[Nombre del Medico] from [dbo].[Ingresos] as I
inner join [dbo].[Medicos] as M on i.[Codigo de Identificacion] = M.[Codigo identificacion]
WHERE i.[Fecha de Ingreso] between '2010-01-01' and '2010-02-01'

--4 Nombres y apellidos de los pacientes que ingresaron entre enero y mayo de 2009 y son alergicos.
select p.Nombre,p.Apellidos from [dbo].[Ingresos] as I
inner join [dbo].[Pacientes] as P on i.[Numero de Historial] = P.[Numero de historial]
WHERE i.[Fecha de Ingreso] between '2009-01-01' and '2009-05-01' and I.Alergico = 1

--5 Pacientes cuyo ingreso haya sido autorizado por el doctor Antonio Jaen Hernandez.
select p.Nombre,p.Apellidos from [dbo].[Ingresos] as I
inner join [dbo].[Pacientes] as P on i.[Numero de Historial] = P.[Numero de historial]
inner join [dbo].[Medicos] as M on m.[Codigo identificacion] = i.[Codigo de Identificacion]
WHERE m.[Codigo identificacion] = 'AJH' 