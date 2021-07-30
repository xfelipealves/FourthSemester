--1. Listar o nome de cada projeto, bem como a matrícula e o nome do funcionário coordenador. Ordenar
--por nome do projeto.

select 
	p.nome as nome_proj,
	pe.nome as nome_coord,
	f.matricula as matri_coord
from projeto p
inner join funcionario f on p.fk_funcionario_coordenador= f.matricula
inner join pessoa pe on f.fk_pessoa = pe.cpf
order by p.nome

--2. Listar o nome de cada projeto bem como o nome do órgão a quem pertence, além da matrícula e o nome
--do funcionário coordenador, bem como o nome do órgão onde está lotado. Ordenar por nome do
--projeto. 

select
	p.nome as nome_proj,
	o.nome as nome_orgProj,
	pe.nome as nome_coord,
	f.matricula as matri_coord,
	o2.nome as nome_orgLot
from projeto p
inner join funcionario f on p.fk_funcionario_coordenador = f.matricula
inner join pessoa pe on f.fk_pessoa = pe.cpf
inner join orgao o on p.fk_orgao_responsavel = o.id
inner join orgao o2 on f.fk_orgao = o2.id
order by p.nome

--3. Listar a matrícula e o nome de cada funcionário bem como a quantidade de projetos em que está
--alocado. Na mesma consulta, deverão ser retornados, também, os funcionários que não estão alocados
--em nenhum projeto. Obviamente, nesse caso, a quantidade é zero. O resultado da consulta deverá estar
--ordenado pela quantidade de projetos decrescente (ou seja, o funcionário que estiver envolvido em mais
--projetos será o primeiro da lista). Quando a quantidade for a mesma, ordenar pela matrícula (crescente).

select 
	f.matricula as func_mat,
	pe.nome as func_nome,
	count (pe.cpf) as qtd_proj
from funcionario f
inner join pessoa pe on f.fk_pessoa = pe.cpf
left join funcionario_projeto fp on fp.fk_funcionario = f.matricula
inner join projeto p on fp.fk_projeto = p.codigo
group by pe.cpf, f.matricula
order by count(pe.nome) desc

--4. Listar o nome de cada projeto bem como a quantidade de funcionários alocados a cada um. Ordenar por
--nome do projeto.

select
	p.nome,
	count(p.codigo) as qtd_func
from projeto p
left join funcionario_projeto fp on fp.fk_projeto = p.codigo
group by p.codigo
order by p.nome

--5. Listar o CPF, a matrícula e o nome de cada funcionário que é coordenador, bem como seus telefones.
--Ordenar por nome e CPF.

select
	pe.cpf as cpf,
	pe.nome as func_nome_coord,
	f.matricula as func_matricula_coord,
	t.numero as numero_telefone
from projeto p
inner join funcionario f on p.fk_funcionario_coordenador = f.matricula
inner join pessoa pe on f.fk_pessoa = pe.cpf
inner join telefone t on pe.cpf = t.fk_pessoa
order by pe.nome, pe.cpf

--6. Listar o CPF, a matrícula, o nome de cada funcionário e, na mesma tupla de retorno, APENAS UM
--(aleatório) de seus telefones. Ou seja, se o funcionário tiver três telefones, além de CPF, matrícula e
--nome, deverá constar na projeção um dos telefones. Funcionários sem telefone deverão constar na lista
--da mesma maneira, mas com o campo de telefone contendo a seguinte mensagem: "Sem telefone
--cadastrado". Ordenar por nome do funcionário.

select
	pe.cpf as cpf,
	f.matricula as matricula,
	pe.nome as nome,
	coalesce (
	(select t.numero
	 from telefone t
	 where t.fk_pessoa = pe.cpf
	 order by random()
	 limit 1),'Sem telefone cadastrado') as numero
from funcionario f
inner join pessoa pe on f.fk_pessoa = pe.cpf
order by pe.nome

--7. Listar o nome e a data de aniversário (Dia/Mês) dos funcionários aniversariantes do mês de dezembro.
--Ordenar pelo nome do funcionário.

select 
	pe.nome as nome,
	to_char(pe.data_nascimento, 'DD-MM') as data
from pessoa pe
inner join funcionario f on f.fk_pessoa = pe.cpf
where extract (month from pe.data_nascimento) = 12
order by pe.nome

--8. Para um determinado órgão (filtrar pelo ID do órgão), listar todos os cargos e quantidade de
--funcionários em cada cargo. Ordenar por nome do cargo.

select * from cargo
select * from orgao o
inner join funcionario f on f.fk_orgao = o.id
inner join cargo c on f.fk_cargo = c.id order by o.id
group by o.id, c.id

with 
orgao_total as(
	select
		o.id as org_id,
		o.nome as org_nome,
		c.id as carg_id,
		c.nome as carg_nome,
		count (*) as qtd_func
	from orgao o
	inner join funcionario f on f.fk_orgao = o.id
	inner join cargo c on f.fk_cargo = c.id
	group by o.id, c.id
	order by o.id, c.id
)
select * 
from orgao_total ot
right join cargo c on c.id = ot.carg_id

--COMANDO CORRETO
select
	c.nome,
	count(f.matricula)
from cargo c
left join funcionario f on (f.fk_orgao = 1 and f.fk_cargo = c.id)
group by c.id
order by c.nome

--9. Para um determinado projeto (filtrar pelo código do projeto), listar todos os cargos e quantidade de
--funcionários em cada cargo. Ordenar por nome do cargo.

select
	c.nome,
	count(f.matricula)
from funcionario_projeto fp
inner join funcionario f on fp.fk_funcionario = f.matricula
right join cargo c on (fp.fk_projeto = 1 and f.fk_cargo = c.id)
group by c.id
order by c.nome


--10. Listar o nome e a data de aniversário (Dia/Mês) dos funcionários aniversariantes do mês de dezembro,
--ordenado pela data de aniversário (não pela data de nascimento).
						
select 
	pe.nome as nome,
	to_char(pe.data_nascimento, 'DD-MM') as data
from pessoa pe
inner join funcionario f on f.fk_pessoa = pe.cpf
where extract (month from pe.data_nascimento) = 12
order by extract (day from pe.data_nascimento)
						
--11. Listar o nome e a idade dos 10 funcionários mais velhos. Ordenar pela idade (decrescente). Dica: Utilize
--a função age para calcular a idade a partir de uma data informada. 

select
	pe.nome,
	extract (year from age(pe.data_nascimento)) as age
from pessoa pe
inner join funcionario f on f.fk_pessoa = pe.cpf
order by age(pe.data_nascimento) desc
limit 10

--12. Listar a matrícula, o nome, o cargo e a idade do funcionário mais velho de cada cargo. Ordenar por
--nome do cargo.
with
cargao as (
	select
		c.id,
		c.nome,
		min(pe.data_nascimento) as data_mais_velho
	from cargo c
	inner join funcionario f on f.fk_cargo = c.id
	inner join pessoa pe on f.fk_pessoa = pe.cpf
	group by c.id
)
select
	pe.nome as nome_func_mais_velho,
	f.matricula as matricula_func_mais_velho,
	ca.nome as nome_cargo,
	extract (year from age(ca.data_mais_velho)) as idade
from cargao as ca
inner join pessoa pe on pe.data_nascimento = ca.data_mais_velho
inner join funcionario f on (f.fk_cargo, f.fk_pessoa) = (ca.id, pe.cpf)
order by ca.nome
						
--13. Listar a matrícula, o nome, o órgão e a idade do funcionário mais velho de cada órgão. Ordenar por
--nome do órgão.
						
with
orgao_brabo as(
	select
		o.id,
		o.nome,
		min(pe.data_nascimento) as datinha
	from orgao o
	inner join funcionario f on f.fk_orgao = o.id
	inner join pessoa pe on f.fk_pessoa = pe.cpf
	group by o.id
	order by o.nome
)
select
	pe.nome as nome_mais_velho,
	f.matricula as matricula_mais_velho,
	ob.nome as nome_orgao,
	extract(year from age(ob.datinha)) as idade
from orgao_brabo ob
inner join pessoa pe on ob.datinha = pe.data_nascimento
inner join funcionario f on (f.fk_pessoa, f.fk_orgao) = (pe.cpf, ob.id)
order by ob.nome
						
--14. Apresentar a média de idade dos funcionários de cada órgão. Ordenar por nome do órgão.
						
select 
	o.nome, avg(extract (year from age(pe.data_nascimento))) as media
from orgao o
inner join funcionario f on f.fk_orgao = o.id
inner join pessoa pe on f.fk_pessoa = pe.cpf
group by o.id
order by o.nome

--15. Apresentar a média de idade dos funcionários de cada cargo. Ordenar por nome do cargo.
						
select 
	c.nome, avg(extract (year from age(pe.data_nascimento))) as media
from cargo c
inner join funcionario f on f.fk_cargo = c.id
inner join pessoa pe on f.fk_pessoa = pe.cpf
group by c.id
order by c.nome

--16. Apresentar nome de cada órgão seguido da soma dos salários de todos os funcionários do órgão.
--Ordenar por nome do órgão.
						
select
	o.nome,
	sum(c.salario) as salario_total
from orgao o
inner join funcionario f on f.fk_orgao = o.id
inner join cargo c on f.fk_cargo = c.id
group by o.id
order by o.nome
						
--17. Apresentar nome de cada cargo seguido da soma dos salários de todos os funcionários de cada cargo.
--Ordenar por nome do cargo.
						
select
	c.nome,
	sum(c.salario) as soma_salarios
from cargo c
inner join funcionario f on f.fk_cargo = c.id
group by c.id
order by c.nome
						
--18. Listar o CPF, o nome e o nome do município onde nasceu de todos os funcionários que trabalham em
--algum projeto que pertença a um órgão que esteja localizado na mesma cidade em que o funcionário
--nasceu. Ordenar por nome do funcionário e pelo seu CPF.

--Alternativa Redundante
select 
	pe.cpf,
	pe.nome,
	m.nome
from pessoa pe
inner join funcionario f on f.fk_pessoa = pe.cpf
inner join funcionario_projeto fp on fp.fk_funcionario = f.matricula
inner join projeto p on (fp.fk_projeto = p.codigo)-- or (p.fk_funcionario_coordenador = f.matricula)
inner join orgao o on (p.fk_orgao_responsavel = o.id)-- or (f.fk_orgao = o.id)
inner join municipio m on (m.id = pe.fk_municipio_nascimento) and (m.id = o.fk_municipio)
group by pe.cpf, m.nome
order by pe.nome desc

--alternativa usual seria utilizar um where para especificar a junção do municipio do func com o org



--19. [LEVEL HARD] Listar CPF e nome de cada funcionário que é coordenador em pelo menos um projeto
--e, listar junto, o nome de cada projeto que esses funcionários estão alocados (independente de ser
--coordenador ou não) e adicionar na tupla projetada, uma coluna indicando se o funcionário é
--coordenador do projeto ou não. Veja ALGUNS exemplos de linhas retornadas:

select * from projeto p order by p.nome

with
func_coord_proj as(
	select
		pe.cpf,
		pe.nome,
		p.codigo,
		f.matricula
	from projeto p
	inner join funcionario f on p.fk_funcionario_coordenador = f.matricula
	inner join pessoa pe on f.fk_pessoa = pe.cpf
)
select
	fcp.cpf as cpf_func,
	fcp.nome as nome_func,
	p.nome as nome_proj,
	(case when (p.codigo = fcp.codigo) then 'Sim' else 'Não' end) as eh_coord
from func_coord_proj fcp
inner join funcionario_projeto fp on fp.fk_funcionario = fcp.matricula 
inner join projeto p on fp.fk_projeto = p.codigo
order by fcp.cpf

--20. [LEVEL VERY HARD] Listar nome do projeto e o custo em mão de obra do projeto até o momento.
--Considere que o custo de mão de obra de um projeto é calculado pela soma de todos os salários pagos
--aos funcionários envolvidos. Assim, seja n a quantidade de funcionários no banco de dados, sj o
--salário do funcionário j e t
--ij a quantidade de meses trabalhados pelo funcionário j no projeto i
--até então, o custo atual ci do projeto i é dado por:


select
	p.nome as nom_proj,
	sum( c.salario *coalesce((current_date - fp.data_alocacao)/30, 0)) as custo_atual
from funcionario f
inner join funcionario_projeto fp on fp.fk_funcionario = f.matricula
inner join projeto p on fp.fk_projeto = p.codigo
inner join cargo c on c.id = f.fk_cargo
group by p.codigo
order by p.nome