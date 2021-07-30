--1
select
    p.nome as nome
from seguir s
inner join perfil p on s.fk_seguidor=p.id_perfil and s.fk_seguido=2
order by p.nome;

--2
select
    p.nome as nome
from seguir s
inner join perfil p on s.fk_seguidor=1 and s.fk_seguido=p.id_perfil;

-- 3
select 
	p.texto as texto,
	to_char(p.data_hora,'HH24:MI:SS DD/MM/YYYY') as data_hora
from post p
left join comentario c on c.fk_post = p.id_post
where c.id_comentario is null;

--4
select
    pt.texto as texto,
    to_char(pt.data_hora,'HH24:MI:SS DD/MM/YYYY')  as data_hora
from post pt
left join comentario c on c.fk_post = pt.id_post   
group by pt.id_post
having count(*)>3;

-- 5
with
coment as (
	select 
		p.id_post as codigo,
		count(p.fk_perfil) as valor
	from post p
	left join comentario c on c.fk_post = p.id_post
	group by p.id_post
),
curtidas as (
	select 
		p.id_post as codigo,
		count(p.fk_perfil) as valor
	from post p
	left join curtir cu on cu.fk_post = p.id_post
	group by p.id_post

)
select
	p.texto as texto,
	to_char(p.data_hora,'HH24:MI:SS DD/MM/YYYY') as data_hora,
	c.valor as comentarios,
	cu.valor as curtidas
from post p
inner join coment c on c.codigo = p.id_post
inner join curtidas cu on cu.codigo = p.id_post;

--6
select
    pt.texto as texto,
	to_char(pt.data_hora,'HH24:MI:SS DD/MM/YYYY') as data_hora
from post pt
where pt.fk_perfil=1
order by pt.data_hora desc;

--7
with
seguidos as( --QUEM O DETERMINADO PERFIL SEGUE
    select
        p.id_perfil,
        p.nome
    from seguir s
    inner join perfil p on s.fk_seguidor=1 and s.fk_seguido=p.id_perfil --FILTRO DE UM DETERMINADO PERFIL
)
select
    pt.texto as texto,
	to_char(pt.data_hora,'HH24:MI:SS DD/MM/YYYY') as data_hora,
	ss.nome as nome
from seguidos ss
inner join post pt on pt.fk_perfil = ss.id_perfil
where pt.data_hora = pt.data_hora--esse segundo 'pt.data_hora' é o filtro de hora
order by pt.data_hora desc;

-- 8
select
	c.texto
from comentario c
inner join post p on p.id_post = c.fk_post
where c.fk_post = 12
order by p.data_hora;