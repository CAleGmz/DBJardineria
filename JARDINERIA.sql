--Base de  datos jardineria
--Se usa para almacenar informacion sobre oficinas, clienetes, productos
--trabajadores, pedidos y clasificaciones
--Fecha de creacion: 20 de abril de 2022
--Fecha de ultima modificacion: 04 de mayo de 2022
--Autores: Carson Alejandro Gomez Lugo
--Torreon Coahuila, INTS tecnologico de la laguna

--Crear BD
create database JARDINERIA
GO

--Usar BD
use JARDINERIA
GO

--Crear Tablas
--Crear tabla oficina
create table oficina
(
id_ofi varchar (3),
telefono varchar (12),
direc varchar (30),
ciud varchar (15),
est varchar (15)
primary key (id_ofi)
)
GO

--Crear tabla empleado
create table empleado
(
id_emple varchar(4),
nom varchar (15),
apat varchar (15),
amat varchar (15),
puest varchar (15),
telf varchar (10),
mail varchar (25),
id_jef varchar (10),
id_ofic varchar (3),
primary key (id_emple)
)
GO

--Crear tabla cliente
create table cliente
(
id_clien varchar (10),
nom_clien varchar (15),
ape_clien varchar (15),
tef_clien varchar (10),
dire_clien varchar (25),
id_empla varchar(4),
primary key (id_clien)
)
GO

--Crear tabla 
create table pedido
(
id_ped varchar(10),
fec_ped date,
fec_prev date,
fec_delv date,
est_ped varchar (15),
coment text,
id_clien varchar (10),
primary key (id_ped)
)
GO

--Crear tabla clasificacion
create table clasificacion
(
id_clas varchar (4),
nomclas varchar (15),
descr text,
primary key (id_clas)
)
GO

--Crear tabla producto
create table producto
(
id_prod varchar (10),
nom_prod varchar (20),
descr text,
pre_ven smallmoney,
pre_uni smallmoney,
No_uni int,
imagen tinyint,
id_clasif varchar(4),
primary key (id_prod)
)
GO

--Crear tabla fertilizante
create table fertilizante
(
id_profer varchar (10),
peso_grm int
primary key (id_profer)
)
GO

--Crear tabla planta
create table planta
(
id_proplan varchar (10),
tam int
primary key (id_proplan)
)
GO

--Crear tabla herramienta
create table herramienta
(
id_proherra varchar (10),
mate varchar (10)
primary key (id_proherra)
)
GO

--Crear tabla pedido_producto
create table pedido_producto
(
id_pedid varchar (10),
id_prod varchar (10),
No_unida int,
primary key (id_pedid,id_prod)
)
GO

--Crear restricciones de integridad a las tablas
--Crear restricciones de empleado
alter table empleado
add constraint fk_id_ofi
foreign key (id_ofic)
references oficina (id_ofi)
GO

--Crear restricciones de cliente
alter table cliente
add constraint fk_id_de_emple
foreign key (id_empla)
references empleado (id_emple)
GO

--Crear restricciones de pedido
alter table pedido
add constraint fk_id_de_client
foreign key (id_clien)
references cliente (id_clien)
GO

--Crear restricciones de fertilizante
alter table fertilizante
add constraint fk_id_produ
foreign key (id_profer)
references producto (id_prod)
GO

--Crear restricciones de planta
alter table planta
add constraint fk_id_plan
foreign key (id_proplan)
references producto (id_prod)
GO

--Crear restricciones de herramienta
alter table herramienta
add constraint fk_id_her
foreign key (id_proherra)
references producto (id_prod)

--Crear restricciones de pedido_producto con el pedido 
alter table pedido_producto
add constraint fk_id_pedpro
foreign key (id_pedid)
references  pedido (id_ped)
GO

--Crear restricciones de pedido_producto con el producto 
alter table pedido_producto
add constraint fk_id_proped
foreign key ([id_prod])
references  producto (id_prod)
GO


--Crear restricciones de clasificacion
alter table producto
add constraint fk_id_clasif
foreign key (id_clasif)
references clasificacion (id_clas)
Go

--Insertar datos a las tablas
--datos oficina
insert into oficina
values
('TRC'	,'528717299600'	,'Calz. Colon 77'	,'Torreon'	,'Coahuila'),
('CUU'	,'526144301500'	,'Av. Universidad 3316'		,'Chihuahua'	,'Chihuahua'),
('GJA'	,'523336141405'	,'Calz. Independencia nte. 362'	,'Guadalajara'	,'Jalisco'),
('MOR'	,'524432320054'	,'C. Cuautla 196'	,'Morelia'	,'Michoacan'),
('MER'	,'529992495170'	,'C. 41 548'		,'Merida'	,'Yucat�n'),
('TXL'	,'529616171200'	,'Av. 11a nte. 265'	,'Tuxla Gutierrez'	,'Chiapas'),
('MNT'	,'528118708000'	,'Av. Frc. I. Madero 580'	,'Monterrey'	,'Nuevo Leon'),
('HER'	,'526621030110'	,'C. Olivares 2072'	,'Hermosillo'	,'Sonora'),
('ACA'	,'527444350334'	,'Av. Universidad 599'	,	'Acapulco'	,'Guerrero'),
('TJA'	,'526642108216'	,'C. Villasana 678'	,'Tijuana'	,'Baja California'),
('LEO'	,'524777630865'	,'C. Nelubio 205'	,'Leon'	,'Guanajuato');
GO

--datos empleado
insert into dbo.empleado
values
('C254','Jose','Martinez','Hernandez','Cajero',		'8712653298',	'Mariahdz22@gmail.com',			'C255',	'TRC'),
('C255','Silvia','Jimenez','Sanchez','Almacenista',	'8715238965',	'SilviaJimSan@gmail.com',		'C255',	'TRC'),
('I645','Pablo','Mendoza','Garza','Almacenista',	'6145626502',	'PabloMG515@hotmail.com',		'I600',	'CUU'),
('R326','Andrea','Rodriguez','Herrera','Supervisor','6624561289',	'AndreaRodH87@outlook.com',		'R320',	'GJA'),
('A666','Sofia','Flores','Guzman','Almacenista',	'3334560189',	'SofiaFrsG@gmail.com',			'A602',	'HER'),
('R987','Ximena','Torres','Mu�os','Cajero',			'4434560790',	'XimenaTrrsMu�@gmail.com',		'R222',	'LEO'),
('R365','Lucia','Castro','Rivera','Almacenista',	'9994567891',	'LuciaCstr55@hotmail.com',		'R369',	'MER'),
('L987','Valeria','Luna','Vargas','Supervisor',		'9614589789',	'ValeriaLuna8755@gmail.com',	'L990',	'MNT'),
('A869','Jose','Lopez','Garcia','Repartidor',		'7447819878',	'JoseLpzGrz@hotmail.com',		'A800',	'MOR'),
('A025','Valeria','Soto','Velasquez','Cajero',		'6640049856',	'Valeriasotovz@gmail.com',		'A007',	'TJA'),
('O887','Antonella','Moreno','Moralez','Repartidor','4777456819',	'AntonellaMM48@gmail.com',		'O852',	'TXL');
GO

--datos cliente
insert into cliente
values
('3000005011'	,'Priscila' 	,'Vazquez' 	,'8712549223'	,'C. Rio Jordan 1287'	,'C254'),
('3000005012'	,'Mario' 	,'Casas'	,'8721528953'	,'Av Alamos 154'			,'R987'),
('3000005013'	,'Juana' 	,'Calderon' 	,'5512396448'	,'C Amsterdam 649'		,'I645'),
('3000005014'	,'Carlos' 	,'Vargas' 	,'6447823679'	,'Av Rio Nazas 573'			,'R987'),
('3000005015'	,'Jesus'	,'Hernandez'	,'8123487265'	,'Av Panama 871'		,'A869'),
('3000005016'	,'Gabriela' 	,'Miranda'	,'5527894262'	,'C Onceava 349'		,'C254'),
('3000005017'	,'Fernanda' 	,'Uribe' 	,'1800741551'	,'Av Sexta 726'			,'L987'),
('3000005018'	,'Julian' 	,'Martinez' 	,'6147221525'	,'C Escobedo 237'		,'A666'),
('3000005019'	,'Elena'	,'Barraza'	,'4444128905'	,'C Bravo 637'				,'R987'),
('3000005020'	,'Alex' 	,'Pacheco'	,'6231109035'	,'Av Patoni 304'			,'O887'),
('3000005021'	,'Daniela'	,'Olivares' 	,'9001812240'	,'C Corregidora 208'	,'L987');
GO

--datos pedido
insert into pedido
values
('8700022912'	,'2021-02-03'	,'2021-02-20'	,'2021-02-20'	,'Entregado'	,'El articulo estaba da�ado >:-	','3000005015'),
('8700021654'	,'2021-03-09'	,'2021-03-15'	,'2021-03-30'	,'Entregado'	,'Al fin llego, tardo pero valio la pena'	,'3000005017'),
('8700015628'	,'2021-05-23'	,'2021-05-30'	,'2021-05-30'	,'Entregado'		,'El paquete estaba abierto e incompleto, espero que me den un cambio'	,'3000005012'),
('8700026499'	,'2021-05-23'	,'2021-06-01'	,''				,'Perdido'		,'El pedido nunca llego, espero mi rembolso'	,'3000005021'),
('8700156794'	,'2021-06-29'	,'2021-07-01'	,''				,'Perdido'		,'El pedido no fue entregado y  no obtuve rembolso,  no vuelvo a comprar aqui =/'	,'3000005018'),
('8700001568'	,'2021-07-02'	,'2021-07-20'	,'2021-07-22'	,'Entregado'	,'Llego despues de la fecha estimada,  pero el estado es impecable'	,'3000005019'),
('8700001586'	,'2021-07-03'	,'2021-07-15'	,'2021-07-15'	,'Entregado'	,'Llego en perfectas condiciones'	,'3000005016'),
('8700001689'	,'2021-07-20'	,'2021-07-25'	,'2021-07-27'	,'Entregado'	,'Un poco de retraso, pero en perfecto estado'	,'3000005013'),
('8700156879'	,'2022-02-03'	,'2022-02-10'	,'2022-02-10'	,'Entregado'	,'Llego exelente, gracias'	,'3000005011'),
('8700649782'	,'2022-03-09'	,'2022-03-20'	,''				,'Retenido'		,'//No entregado aun//'	,'3000005020'),
('8700135598'	,'2022-04-17'	,'2022-04-25'	,''				,'Transito'		,'//No entregado aun//'	,'3000005014');
GO

--datos clasificacion
insert into clasificacion
values
('RO35'	,'Riego'		,'Articulos para el riego'),
('MS65'	,'Macetas'		,'Todo tipo de macetas'),
('DN21'	,'Decoracion'	,'Articulos para decorar el jard�n'),
('IS45'	,'Insecticidas'	,'Todo para evitar plagas'),
('PL60'	,'Profesional'	,'Para jardineria profesional'),
('MJ99'	,'Maquinaria'	,'Maquinaria para facilitar el trabajo'),
('ST08'	,'Set'			,'Sets para comenzar en la jardienria'),
('PR65'	,'Plantar'		,'Todo para comenzar a plantar'),
('AL83'	,'A granel'		,'Articulos a granel'),
('RN14'	,'Recreacion'	,'Para disfrutar mas de la jardineria');
GO

--datos producto
insert into producto
values
('7822000101'	,'Organodel'			,'Cafe, organico'									,256.00	,215.48	,15	,3	,'PR65'),
('7822000102'	,'FertiPlus'			,'Liquido, blanco'									,115.00	,96.60	,23	,2	,'PR65'),
('7822000103'	,'NutriGarden'		,'Para orquideas y violetas'							,115.00	,96.60	,10	,3	,'PL60'),
('7822000104'	,'Vitaorganic'		,'Humus de lobriz'										,29.00	,24.36	,35	,2	,'PR65'),
('7822000105'	,'Magic Root'		,'Blanco, organico'										,231.00	,194.04	,35	,2	,'PR65'),
('7822000106'	,'Delta'				,'Composta organica champi�on'						,127.00	,106.68	,48	,1	,'PL60'),
('7822000107'	,'Ecosustrato'		,'Blanco, organico'										,99.00	,83.16	,6	,2	,'PR65'),
('7822000108'	,'Peatmost'			,'Turba, cafe'											,569.00	,477.96	,62	,1	,'PR65'),
('7822000109'	,'Pisumma'			,'Polvillo de coco'										,112.00	,94.08	,55	,1	,'PL60'),
('7822000100'	,'Fax'				,'Enraizador, rojo'										,186.00	,156.24	,78	,5	,'PR65'),
('3622000101'	,'Orquidea'			,'Para climas templados, regar a diario'				,16.00	,13.44	,35	,3	,'AL83'),
('3622000102'	,'Palma Robelina'	,'Para climas templados, regar cada tres dias'			,25.00	,21.00	,17	,4	,'AL83'),
('3622000103'	,'Violeta'			,'Para climas humedos,  regar una vez a la semana'		,19.00	,15.96	,100,2	,'AL83'),
('3622000104'	,'Rosa'				,'Para clima frio,  regar cada semana'					,18.00	,17.84	,263,1	,'AL83'),
('3622000105'	,'Cactus'			,'Para clima seco,  regar cada semana'					,25.00	,21.00	,56	,3	,'AL83'),
('3622000106'	,'Lili Holandesa'	,'Para clima templado,  regar a diario'					,35.00	,29.40	,25	,2	,'AL83'),
('3622000107'	,'Belen'			,'Para clima seco, regar cada tres dias'				,18.00	,17.84	,66	,2	,'AL83'),
('3622000108'	,'Geranio'			,'Para clima humedo,  regar cada cuatro dias'			,35.00	,29.40	,45	,4	,'AL83'),
('3622000109'	,'Girasol'			,'Para clima templado,  regar a diario'					,16.00	,13.44	,14	,3	,'AL83'),
('3622000100'	,'Lirio'			,'Para clima templado,  regar a diario'					,20.00	,16.80	,10	,2	,'AL83'),
('5122000101'	,'Hilo de Corte'	,'Para maquina de podar  de .95'' por 250 pies'			,499.00	,419.16	,23	,2	,'PL60'),
('5122000102'	,'Tijeras para podar','Para ramas de 22 por 5.2 por 2 cm'					,385.00	,323.40	,203,4	,'ST08'),
('5122000103'	,'Escoba'			,'Para ramas de 150  por 30 por 11 cm'					,85.00	,71.40	,22	,1	,'PL60'),
('5122000104'	,'Portamaceta'		,'Grande de 40 por 40 por 11cm,  Beige'					,59.00	,49.56	,54	,2	,'MS65'),
('5122000105'	,'Rastrillo'		,'De 40 pulgadas, amarillo'								,285.00	,239.40	,45	,3	,'PL60'),
('5122000106'	,'Pala cuadrada'	,'Mango largo 145 cm'									,335.00	,301.40	,32	,2	,'PL60'),
('5122000107'	,'Tijera Tubular'	,'Para poda 17 pulgadas,  naranja'						,215.00	,180.60	,66	,4	,'PL60'),
('5122000108'	,'Pison'			,'De 24.5 por 20.32 por 20.32 cm,  negro'				,625.00	,525.00	,25	,1	,'PL60'),
('5122000109'	,'Azadon'			,'Jardinero de 150 cm'									,269.00	,225.96	,15	,3	,'PL60'),
('5122000100'	,'Llanta'			,'Para carretilla de 36.5 cm'							,359.00	,301.56	,20	,2	,'MJ99');
GO

--datos fertilizante
insert into fertilizante
values
('7822000101'	,'300'),
('7822000102'	,'825'),
('7822000103'	,'225'),
('7822000104'	,'300'),
('7822000105'	,'550'),
('7822000106'	,'425'),
('7822000107'	,'500'),
('7822000108'	,'200'),
('7822000109'	,'1100'),
('7822000100'	,'150');
GO

--datos planta
insert into planta
values
('3622000101'	,'10'),
('3622000102'	,'50'),
('3622000103'	,'15'),
('3622000104'	,'62'),
('3622000105'	,'24'),
('3622000106'	,'30'),
('3622000107'	,'46'),
('3622000108'	,'120'),
('3622000109'	,'72'),
('3622000100'	,'56');
GO

--datos herramienta
insert into herramienta
values
('3622000101'	,'10'),
('3622000102'	,'50'),
('3622000103'	,'15'),
('3622000104'	,'62'),
('3622000105'	,'24'),
('3622000106'	,'30'),
('3622000107'	,'46'),
('3622000108'	,'120'),
('3622000109'	,'72'),
('3622000100'	,'56');
GO

--datos pedido_producto
insert into pedido_producto
values
('8700022912'	,'7822000104'	,5),
('8700021654'	,'3622000104'	,8),
('8700015628'	,'3622000100'	,5),
('8700026499'	,'5122000103'	,9),
('8700156794'	,'7822000100'	,2),
('8700001568'	,'3622000108'	,4),
('8700001586'	,'7822000104'	,5),
('8700001689'	,'7822000103'	,4),
('8700156879'	,'7822000101'	,6),
('8700649782'	,'5122000100'	,1),
('8700135598'	,'7822000107'	,3);
GO

--Indices
--Crear indice telefono en oficina
create index idx_telefono
on oficina(telefono)

--Crear indice nombre clasif en clasificacion
create index idx_nomclas
on clasificacion(nomclas)

--Crear indice tef_clien en cliente
create index idx_tef_clien
on cliente(tef_clien)

--Crear indice telf en empledo
create index idx_telf
on empleado(telf)

--Crear indice producto
create index idx_nom_prod
on producto(nom_prod)

--Consultas
--C1 Nombre de los trabajadores que trabajan en la oficina de torre�n
select [nom],[apat],[amat]
from[dbo].[empleado]
where [id_ofic] in (select [id_ofi]
					  from [dbo].[oficina]
					  where [ciud] like 'Torreon')

--C2 Precio de venta total de todos los productos
select sum([pre_ven])
from[dbo].[producto]

--C3 Precio de los fertilizantes
select [pre_ven] as 'Costo de Fertilizantes'
from [dbo].[producto]
where [id_prod] in (select [id_profer]
					from [dbo].[fertilizante])

--C4 Nombre de los productos en los que hay menos de 10 unidades en stock
select [nom_prod] as 'Con menos de 10 en stock'
from [dbo].[producto]
where [No_uni] < 10

--C5 Numero total de art�culos en stock
select sum([No_uni]) as 'stock total'
from [dbo].[producto]

--C6 Nombre de los productos que est�n el la clasificaci�n profesional  *****
select [nom_prod] as 'Clasificacion Profesional'
from [dbo].[producto]
where [id_clasif] in (select [id_clas]
					  from [dbo].[clasificacion]
					  where [nomclas] like 'Profesional')

--C7 Nombre de los clientes que sus pedidos se perdieron
select [nom_clien] as 'Nombre cliente con pedido perdido',[ape_clien] as 'Apellido'
from [dbo].[cliente]
where [id_clien] in (select [id_clien]
					 from [dbo].[pedido]
					 where [est_ped] like 'perdido')

--C8 Promedio de precio de venta  las herramientas 
select avg([pre_ven]) as 'Promedio precio de venta de herramientas'
from [dbo].[producto]
where [id_prod] in (select [id_proherra]
					from [dbo].[herramienta])

--C9 Nombre y Apellido de clientes atendidos por Jose Martinez
select [nom_clien],[ape_clien]
from [dbo].[cliente]
where [id_empla] like (select [id_emple]
					   from [dbo].[empleado]
					   where [nom] like 'Jose' and [apat] like 'Martinez')

--C10 Actualizar el producto rosa de la tabla producto y cambiar el nombre a clavel
update [dbo].[producto]
set [nom_prod] = 'Clavel'
where [nom_prod] like 'Rosa'

--C11 Cuantos empleados son almacenistas 
select [id_emple], [nom],[apat]
from [dbo].[empleado]
where [puest] like 'almacenista'

--C12 Numero de pedido de Fernanda Uribe 
select [id_ped], [id_clien]
from [dbo].[pedido]
where [id_clien] in
(
select [id_clien]
from [dbo].[cliente]
where [nom_clien] like 'fernanda' and [ape_clien] like 'uribe')

--C13 Cuantos productos tienen 3 imagenes
select COUNT(*) [imagen]
from [dbo].[producto]
where imagen = 3

--C14 Cual es el producto mas caro 
select MAX (pre_ven) as product_caro
from [dbo].[producto]

--C15 Cual es producto mas barato
select MIN (pre_ven) as product_bara
from [dbo].[producto]

--C16 Actualizar el domicilio del cliente Julian Martinez 
update [dbo].[cliente]
set [dire_clien] = 'C Cuarta 185'
where [nom_clien] like 'julian' and [ape_clien] like 'martinez'

--C17 Nombre de los clientes que se les ha perdido su pedido
select [nom_clien],[ape_clien]
from [dbo].[cliente]
where [id_clien] in 
(select [id_clien]
from [dbo].[pedido]
where [est_ped] like 'perdido')

--C18 Cambiar el estado del pedido de Carlos Vargas 
update [dbo].[pedido]
set [est_ped] = 'Entregado'
where [id_clien] in
(select [id_clien]
from [dbo].[cliente]
where [nom_clien] like 'carlos' and [ape_clien] like 'vargas')

--C19 Cambiar el estado del pedido del cliente Jesus Hernandez 
update [dbo].[pedido]
set [est_ped] = 'Devuelto'
where [id_clien] in
(select [id_clien]
from [dbo].[cliente]
where [nom_clien] like 'jesus' and [ape_clien] like 'hernandez')

--C20 Numero de unidades compradas por Juana Calderon
select [No_unida]
from [dbo].[pedido_producto]
where [id_pedid] in 
(select [id_ped]
from [dbo].[pedido]
where [id_clien] in (select [id_clien] from [dbo].[cliente] where [nom_clien] like 'juana' and [ape_clien] like 'calderon'))


--VER Tabla oficina
SELECT *
FROM oficina 

--Ver tabala empleado
SELECT *
FROM empleado

--Ver tabala pedido
SELECT *
FROM pedido

--VER Tabla pedido_producto
SELECT *
FROM pedido_producto

--VER Tabla clasificacion
SELECT *
FROM clasificacion 

--Ver tabala cliente
SELECT *
FROM cliente

--Ver tabala herramienta
SELECT *
FROM herramienta

--VER Tabla planta
SELECT *
FROM planta

--VER Tabla fertilizante
SELECT *
FROM fertilizante 

--VER Tabla producto
SELECT *
FROM producto