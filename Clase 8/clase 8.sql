-- Agrupaciones
use pubs;

-- listar la cantidad de titulos por categoria.
-- No incluir las categorias no definidas.
-- Incluir solo las categorias cuya cantidad de 
-- titulos pertenecientes sea mayor que 2.
-- Ordenar por cantidad en forma descendente.
-- Mostrar solo los 2 primeros registros de todo lo anterior
select 		type as categoria,
			count(title_id) cantidad
from		titles
where		type <> ''
group by	type
having 		count(title_id) > 2
order by	count(title_id) desc
limit		2;


