select b.nombre as modelo, c.nombre as marca, d.nombre as grupo, a.dt_compra, a.n_matricula, e.nombre as color, a.n_km, f.nombre as aseguradora, a.n_poliza
from practica_vrg.coches a
inner join practica_vrg.modelo b on a.id_modelo = b.id_modelo
inner join practica_vrg.marca c on b.id_marca = c.id_marca
inner join practica_vrg.grupo d on c.id_grupo = d.id_grupo
inner join practica_vrg.color e on a.id_color = e.id_color
inner join practica_vrg.aseguradoras f on a.id_aseguradoras = f.id_aseguradoras
where a.dt_baja = '4000/12/31'
order by a.dt_compra;
