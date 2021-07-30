--1. [1.5 pontos] Listar o código das aeronaves e a quantidade de voos que cada aeronave já fez. Ordenar pelo código da aeronave.

select
    a.codigo_aeronave,
    count(a.codigo_aeronave) qtd_voos
from aeronave a
left join voo v on a.codigo_aeronave = v.codigo_aeronave
group by a.codigo_aeronave
order by a.codigo_aeronave;

--2. [1.5 pontos] Listar o CPF e o nome de todos os passageiros do voo número S1182 bem como o número do assento que cada
--passageiro ocupa na aeronave. O resultado deverá ser ordenado pelo número do assento.

select
    p.cpf_pessoa as cpf,
    p2.nome_pessoa as nome,
    p.numero_assento
from passageiro p
inner join pessoa p2 on p.cpf_pessoa = p2.cpf_pessoa
where p.numero_voo = 'S1182'
order by p.numero_assento;


--3. [1.5 pontos] Listar o nome do aeroporto de origem, o nome do aeroporto de destino, a data/hora de partida e a data/hora de
--chegada de todos os voos da aeronave 303 com data de partida no mês de agosto de 2020. Ordenar pela data de partida.

select
    a.nome_aeroporto as aeroporto_origem,
    a2.nome_aeroporto as aeroporto_destino,
    v.data_hora_partida,
    v.data_hora_chegada
from voo v
inner join aeroporto a on v.id_aeroporto_origem = a.id_aeroporto
inner join aeroporto a2 on v.id_aeroporto_destino = a2.id_aeroporto
where v.codigo_aeronave = '303' and v.data_hora_partida between '2020-08-01' and '2020-08-31'
order by v.data_hora_partida;

--4. [1.5 pontos] Listar o CPF da pessoa, nome da pessoa, e código da aeronave em todas as combinações pessoa/aeronave em que
--uma mesma pessoa realizou mais de um voo na mesma aeronave. Em cada linha, projetar também a quantidade de vezes em
--que a mesma pessoa esteve na mesma aeronave. Ordenar por CPF e código da aeronave.

select
    p.cpf_pessoa,
    p.nome_pessoa,
    v.codigo_aeronave,
    count(v.codigo_aeronave) as qtde_vezes
from pessoa p
inner join passageiro p2 on p.cpf_pessoa = p2.cpf_pessoa
inner join voo v on p2.numero_voo = v.numero_voo
group by p.cpf_pessoa, p.nome_pessoa, v.codigo_aeronave
having count(v.codigo_aeronave) > 1
order by p.cpf_pessoa, v.codigo_aeronave;


--5. [2.0 pontos] Listar o número de todos os voos com overbooking (vendeu mais assentos do que a capacidade da aeronave), bem
--como a capacidade de passageiros e a quantidade de passagens vendidas para cada voo.

select
    v.numero_voo,
    a.capacidade_passageiros,
    count(*) qtde_passagens_vendidas
from voo v
inner join aeronave a on v.codigo_aeronave = a.codigo_aeronave
inner join passageiro p on v.numero_voo = p.numero_voo
group by v.numero_voo, a.codigo_aeronave, a.capacidade_passageiros
having count(*) > a.capacidade_passageiros
order by v.numero_voo;

--6. [2.0 pontos] Consultar e retornar uma relação composta de APENAS uma ÚNICA tupla contendo as seguintes seis colunas:
--id e nome do aeroporto de onde mais saem voos, bem como a quantidade de voos que saiu deste aeroporto; e id e nome do
--aeroporto para onde vão mais voos, bem como a quantidade de voos que chegou nesse aeroporto. Caso haja mais de um
--aeroporto empatado em mais partidas e/ou mais chegadas, sua consulta deverá escolher arbitrariamente apenas um deles, de
--modo que sua consulta deverá SEMPRE retornar APENAS uma ÚNICA tupla.

with
saidinha_braba as (
    select a.id_aeroporto,
           a.nome_aeroporto,
           count(*) as qtde_voos
    from voo v
             inner join aeroporto a on v.id_aeroporto_origem = a.id_aeroporto
    group by a.id_aeroporto
    order by count(*) desc, a.id_aeroporto
    limit 1
),
entradinha_monstra as (
    select a.id_aeroporto,
           a.nome_aeroporto,
           count(*) as qtde_voos
    from voo v
             inner join aeroporto a on v.id_aeroporto_destino = a.id_aeroporto
    group by a.id_aeroporto
    order by count(*) desc, a.id_aeroporto
    limit 1
)
select
    s.id_aeroporto as id_aeroporto_origem,
    s.nome_aeroporto as nome_aeroporto_origem,
    s.qtde_voos as qtde_voos_saem,
    e.id_aeroporto as id_aeroporto_destino,
    e.nome_aeroporto as nome_aeroporto_destino,
    e.qtde_voos as qtde_voos_chegam
from saidinha_braba s , entradinha_monstra e;

