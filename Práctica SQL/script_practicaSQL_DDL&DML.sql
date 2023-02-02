create schema practica_vrg authorization ocdabxec;

--create tabla de color

create table practica_vrg.color(
id_color varchar(50) not null,
nombre varchar(50) not null,

constraint color_PK primary key(id_color)
);

--create tabla de aseguradoras

create table practica_vrg.aseguradoras(
id_aseguradoras varchar(50) not null,
nombre varchar(50) not null,

constraint aseguradoras_PK primary key(id_aseguradoras)
);

--create tabla de moneda

create table practica_vrg.moneda(
id_moneda varchar(50) not null,
nombre varchar(50) not null,

constraint moneda_PK primary key(id_moneda)
);

--create tabla de grupo

create table practica_vrg.grupo(
id_grupo varchar(50) not null,
nombre varchar(50) not null,

constraint grupo_PK primary key(id_grupo)
);

--create tabla de marca

create table practica_vrg.marca(
id_marca varchar(50) not null,
id_grupo varchar(50) not null,
nombre varchar(50) not null,

constraint marca_PK primary key(id_marca),
constraint id_grupo_FK foreign key(id_grupo)
references practica_vrg.grupo(id_grupo)
);

--create tabla de modelo

create table practica_vrg.modelo(
id_modelo varchar(50) not null,
id_marca varchar(50) not null,
nombre varchar(50) not null,

constraint modelo_PK primary key(id_modelo),
constraint id_marca_FK foreign key(id_marca)
references practica_vrg.marca(id_marca)
);

--create tabla de coches

create table practica_vrg.coches(
id_coche varchar(50) not null,
id_color varchar(50) not null,
id_aseguradoras varchar(50) not null,
id_modelo varchar(50) not null,
n_matricula varchar(50) not null,
n_km integer not null,
n_poliza varchar(50) not null,
dt_compra date not null,
dt_baja date not null,

constraint coches_PK primary key(id_coche),
constraint id_color_FK foreign key(id_color)
references practica_vrg.color(id_color),
constraint id_aseguradoras_FK foreign key(id_aseguradoras)
references practica_vrg.aseguradoras(id_aseguradoras),
constraint id_modelo_FK foreign key(id_modelo)
references practica_vrg.modelo(id_modelo)
);

--create tabla de HistRevision
create table practica_vrg.hist_revisiones(
id_revision varchar(50) not null,
id_moneda varchar(50) not null,
id_coche varchar(50) not null,
n_km_rev integer not null,
dt_rev date not null,
n_importe integer not null,

constraint hist_revisiones_PK primary key(id_revision),
constraint id_moneda_FK foreign key(id_moneda)
references practica_vrg.moneda(id_moneda),
constraint id_coche_FK foreign key(id_coche)
references practica_vrg.coches(id_coche)
);

--insert into color
insert into practica_vrg.color
(id_color,nombre)
values('1', 'rojo');

insert into practica_vrg.color
(id_color,nombre)
values('2', 'verde');

insert into practica_vrg.color
(id_color,nombre)
values('3', 'azul');

--insert into moneda
insert into practica_vrg.moneda
(id_moneda,nombre)
values
('EUR', 'Euro'),
('USD', 'EEUU Dolar'),
('JPY', 'Japon Yen');

--insert into aseguradoras
insert into practica_vrg.aseguradoras
(id_aseguradoras,nombre)
values('1', 'Mapfre');

insert into practica_vrg.aseguradoras
(id_aseguradoras,nombre)
values('2', 'Allianz');

insert into practica_vrg.aseguradoras
(id_aseguradoras,nombre)
values('3', 'Mutua Madrileña');

--insert into grupo
insert into practica_vrg.grupo
(id_grupo,nombre)
values('1', 'Volkswagen');

insert into practica_vrg.grupo
(id_grupo,nombre)
values('2', 'Renault');

insert into practica_vrg.grupo
(id_grupo,nombre)
values('3', 'Stellantis');

--insert into marca
insert into practica_vrg.marca
(id_marca,id_grupo,nombre)
values('1', '1', 'Audi'),
('2', '1', 'Seat'),
('3', '2', 'Dacia'),
('4', '2', 'Renault'),
('5', '3', 'Peugeot'),
('6', '3', 'Citroen');

--insert into modelo
insert into practica_vrg.modelo
(id_modelo,id_marca,nombre)
values('1', '1', 'A3'),
('2', '1', 'A4'),
('3', '2', 'Ibiza'),
('4', '2', 'Panda'),
('5', '3', 'Logan'),
('6', '3', 'Sandero'),
('7', '4', 'Megane'),
('8', '4', 'Talisman'),
('9', '5', '307'),
('10', '5', '407'),
('11', '6', 'C3'),
('12', '6', 'C4');

--insert into coches
insert into practica_vrg.coches
(id_coche, id_color, id_aseguradoras, id_modelo, n_matricula, n_km, n_poliza, dt_compra, dt_baja)
values
('001', '1', '2', '1', '3757FGF',35678,'468941P', '2007/11/06', '4000/12/31'),
('002', '1', '1', '2', '3781LGF',75671,'896652O', '2015/06/17', '4000/12/31'),
('003', '3', '2', '3', '7801GKI',41579,'783518K', '2017/10/11', '4000/12/31'),
('004', '2', '3', '4', '8175GKL',40118,'967435J', '2017/11/29', '4000/12/31'),
('005', '1', '2', '5', '3142GKV',51789,'980001K', '2018/01/06', '4000/12/31'),
('006', '1', '1', '6', '1787GKV',33475,'977761X', '2018/02/02', '4000/12/31'),
('007', '3', '3', '7', '3757EHF',81907,'100089B', '2005/02/17', '4000/12/31'),
('008', '2', '2', '7', '2376DGF',180897,'677754Y', '2004/01/02', '2020/11/30'),
('009', '2', '1', '4', '3226DGG',190099,'876541Q', '2004/11/06', '2019/10/15'),
('010', '1', '1', '8', '7854GVV',56342,'655543S', '2018/06/07', '4000/12/31'),
('011', '1', '1', '9', '0056GVV',31674,'886540G', '2018/06/19', '4000/12/31'),
('012', '3', '2', '10', '1765GWY',45789,'990764T', '2018/11/02', '4000/12/31'),
('013', '1', '1', '11', '2345GWZ',51678,'007800L', '2018/12/12', '4000/12/31'),
('014', '3', '3', '12', '7776GWZ',33412,'982300K', '2018/12/27', '4000/12/31'),
('015', '1', '2', '2', '1118GWL',67890,'765124R', '2018/09/03', '4000/12/31'),
('016', '1', '2', '3', '2276EIJ',89007,'975652T', '2005/10/09', '4000/12/31'),
('017', '1', '3', '1', '1456CDD',234002,'000022U', '2003/03/22', '2019/02/01'),
('018', '2', '2', '12', '3757GKM',47890,'002461H', '2018/04/02', '4000/12/31');

--insert into hist_revisiones
insert into practica_vrg.hist_revisiones
(id_revision, id_moneda, id_coche, n_km_rev, dt_rev, n_importe)
values
('001', 'EUR', '017', 50027, '2006/01/23', 275),
('002', 'EUR', '017', 100127, '2009/04/12', 275),
('003', 'EUR', '007', 50236, '2010/04/14', 300),
('004', 'EUR', '017', 152478, '2013/01/23', 305),
('005', 'EUR', '002', 50123, '2017/02/11', 315),
('006', 'EUR', '005', 50057, '2020/01/09', 345),
('007', 'USD', '010', 51987, '2020/02/11', 370);