--1. Listar o nome de todos os candidatos que fizeram alguma prova em um determinado período informado. Por
--exemplo: entre 23/09/2016 à 17/01/2017.

select p.nome as nome_candidato--, co.nome, co.numero, co.data
from pessoa p
inner join candidato c on p.cpf = c.pessoa_cpf
inner join inscricao_c ic on c.pessoa_cpf = ic.candidato_cpf
inner join concurso co on co.numero = ic.concurso_numero
inner join prova pr on ic.candidato_cpf = pr.ins_c_cpf and ic.concurso_numero = pr.ins_c_num_conc
where co.data between '2020-10-01' and '2021-02-25' and ic.presenca = 'true'
group by p.cpf;
--order by co.data;

--2. Buscar a quantidade de concursos que um determinado candidato realizou.

select p.nome, count(*) as qtde_concurso--, p.cpf
from pessoa p
inner join candidato c on p.cpf = c.pessoa_cpf
inner join inscricao_c ic on c.pessoa_cpf = ic.candidato_cpf
inner join concurso co on ic.concurso_numero = co.numero
group by p.cpf
having p.cpf = 70816278794
order by p.nome;

--3. Listar CPF e nome de todos os fiscais que já fizeram algum concurso.

select p.cpf, p.nome
from pessoa p
inner join fiscal f on p.cpf = f.pessoa_cpf
inner join candidato c on p.cpf = c.pessoa_cpf
inner join inscricao_c ic on c.pessoa_cpf = ic.candidato_cpf
--inner join inscricao_f i on f.pessoa_cpf = i.fiscal_cpf
group by p.cpf
order by p.nome;

--4. Listar CPF e nome de todos os fiscais que nunca fizeram algum concurso.

select p.cpf, p.nome
from pessoa p
inner join fiscal f on p.cpf = f.pessoa_cpf
left join candidato c on p.cpf = c.pessoa_cpf
left join inscricao_c ic on c.pessoa_cpf = ic.candidato_cpf
where ic.candidato_cpf is null
order by p.nome;

--5. Listar CPF e nome de todos os candidatos que nuca foram fiscais.

select p.cpf, p.nome
from pessoa p
inner join candidato c on p.cpf = c.pessoa_cpf
left join fiscal f on p.cpf = f.pessoa_cpf
--left join inscricao_f i on f.pessoa_cpf = i.fiscal_cpf
where f.pessoa_cpf is null
order by p.nome;

--6. Listar todos os concursos, retornando para cada concurso a data, o nome descritivo e a quantidade de candidatos.
--O retorno deverá estar ordenado pela data (crescente).

select co.data, co.nome, count(*) as qtde_candidatos
from concurso co
inner join inscricao_c ic on co.numero = ic.concurso_numero
group by co.numero--, co.data
order by co.data asc;

--7. Para um determinado concurso, listar o nome, quantidade de acertos, quantidade de erros e quantidade de questões
--em branco de todos os candidatos não desclassificados, ordenando as linhas retornadas pela quantidade de acertos
--(decrescente), pela quantidade de questões em branco (decrescente) e pela quantidade de questões erradas(crescente).

with
     provas as (
         select
                pr.ins_c_cpf,
                pr.ins_c_num_conc,
                --qp.numero as numero_questao,
                --qp.alternativa_marcada,
                --aq.letra,
                count (case when a.correta=true then 1 end)    as acertos,
                count (case when a.correta=false then 1 end)   as erros,
                count (case when a.correta is null then 1 end) as em_branco
                --a.correta as resposta
         from prova pr
         inner join questao_p qp on pr.ins_c_cpf = qp.prova_cpf and pr.ins_c_num_conc = qp.prova_num_conc
         left join alternativa_qp aq on qp.questao_codigo = aq.qp_cod_ques and
                                        qp.prova_cpf = aq.qp_cpf_prov and
                                        qp.prova_num_conc = aq.qp_num_conc_prov
                                            and qp.alternativa_marcada = aq.letra
         left join alternativa a on aq.alt_seq = a.sequencial and aq.alt_cod_ques = a.questao_codigo
         group by pr.ins_c_cpf, pr.ins_c_num_conc
         order by pr.ins_c_cpf, pr.ins_c_num_conc--, qp.numero
    )
select
    co.nome,
    p.nome,
    pr.acertos,
    --ic.fiscal_cpf_des,
       --ic.motivo_des,
       --ic.presenca,
    pr.erros,
    pr.em_branco
from inscricao_c ic --on co.numero = ic.concurso_numero
inner join candidato c on ic.candidato_cpf = c.pessoa_cpf
inner join pessoa p on c.pessoa_cpf = p.cpf
inner join provas pr on ic.candidato_cpf = pr.ins_c_cpf and 9 = pr.ins_c_num_conc
inner join concurso co on ic.concurso_numero = co.numero --and co.numero=1
where ic.presenca=true  and ic.fiscal_cpf_des is null and pr.ins_c_num_conc=9 and co.numero=9-- and p.cpf=27778567248--candidatos nao desclassificados
order by pr.acertos desc, pr.em_branco desc, pr.erros asc;--, p.nome;

--teste rapido pra validar o cpf se necessario
--select p.cpf, p.nome
--from pessoa p
--where p.cpf=170947163

--8. Listar o CPF e o nome dos 10 fiscais que mais trabalharam em concursos.

with 
fiscal_cont as (
    select f.pessoa_cpf as cpf,
           count(i.fiscal_cpf) as valor
        from fiscal f
        left join inscricao_f i on f.pessoa_cpf = i.fiscal_cpf
    group by f.pessoa_cpf
)
select p.cpf,
       p.nome
from fiscal_cont fc
inner join pessoa p on fc.cpf = p.cpf
order by fc.valor desc
limit 10;

--9. Listar o CPF e o nome dos 10 fiscais que menos trabalharam em concursos, mas que trabalharam ao menos uma
--vez.

with fiscal_cont as (
    select f.pessoa_cpf as cpf,
           count(i.fiscal_cpf) as valor
        from fiscal f
        inner join inscricao_f i on f.pessoa_cpf = i.fiscal_cpf
    group by f.pessoa_cpf
)
select p.cpf,
       p.nome
from fiscal_cont fc
inner join pessoa p on fc.cpf = p.cpf
where fc.valor > 0
order by fc.valor
limit 10;

--10. Listar o CPF, RG e o nome dos candidatos que se inscreveram em pelo menos 3 concursos.

with particitacoes as (
    select c.pessoa_cpf           cpf,
           count(i.candidato_cpf) valor
    from candidato c
             left join inscricao_c i on c.pessoa_cpf = i.candidato_cpf
    group by c.pessoa_cpf
)
select p.cpf                      cpf,
       p.rg                       rg,
       p.nome                     nome
from pessoa p
inner join particitacoes pa on pa.cpf = p.cpf
where pa.valor > 2
order by p.cpf;

--11. Listar o endereço dos locais de prova de um determinado concurso, bem como a capacidade máxima de lotação
--desse local de prova.

select
    --p.codigo as numero_predio,
    p.e_rua,
    p.e_bairro,
    p.e_cidade,
    p.e_complemento,
    p.e_estado,
    p.e_num,
    sum(s.capacidade) as lotacao_max
from concurso
inner join concurso_predio cp on concurso.numero = cp.concurso_num
inner join predio p on cp.predio_cod = p.codigo
inner join sala s on p.codigo = s.predio_codigo
where concurso_num=2
group by p.codigo
order by p.codigo;

--12. Listar todos os locais de prova de um determinado concurso, retornando endereço do local, lotação máxima do local,
--número de vagas restantes (livres) no local de prova.

select
    --p.codigo as numero_predio,
    p.e_rua,
    p.e_bairro,
    p.e_cidade,
    p.e_complemento,
    p.e_estado,
    p.e_num,
    sum(s.capacidade) as lotacao_max,
    sum(s.capacidade) - (
        select
                count(*) as qtd_inscritos
         from inscricao_c ic
         inner join concurso c on ic.concurso_numero = c.numero
         inner join concurso_predio cp2 on c.numero = cp2.concurso_num
         inner join predio p2 on cp2.predio_cod = p2.codigo and ic.sala_codigo_pred = p2.codigo
         where c.numero=2
         group by p2.codigo
         having p.codigo=p2.codigo
    ) as vagas_livres
from concurso
inner join concurso_predio cp on concurso.numero = cp.concurso_num
inner join predio p on cp.predio_cod = p.codigo
inner join sala s on p.codigo = s.predio_codigo
--inner join inscritos i on i.codigo=p.codigo
where concurso_num=2
group by p.codigo
order by p.codigo;

--13. Para um determinado candidato em um determinado concurso, listar todas as questões da prova do candidato,
--retornando o número da questão na prova, o texto descritivo da questão, letra da alternativa correta da questão,
--texto descritivo da alternativa correta e letra da alternativa assinalada pelo candidato na questão. O retorno da
--consulta deverá estar ordenado pelo número da questão.

select
    qp.numero,
    q.descricao quest_desc,
    aq.letra as letra_correta,
    a.descricao as desc_quest,
    qp.alternativa_marcada as letra_marcada
from inscricao_c ic
inner join concurso c on ic.concurso_numero = c.numero
inner join prova p on ic.candidato_cpf = p.ins_c_cpf and ic.concurso_numero = p.ins_c_num_conc
inner join questao_p qp on p.ins_c_cpf = qp.prova_cpf and p.ins_c_num_conc = qp.prova_num_conc
inner join questao q on qp.questao_codigo = q.codigo
inner join alternativa a on a.questao_codigo = q.codigo and a.correta = true
inner join alternativa_qp aq on qp.questao_codigo = aq.qp_cod_ques and
                                qp.prova_cpf = aq.qp_cpf_prov and
                                qp.prova_num_conc = aq.qp_num_conc_prov and
                                aq.alt_seq = a.sequencial and
                                aq.alt_cod_ques = a.questao_codigo
where ins_c_cpf=27778567248 and c.numero=9
order by qp.numero;

select
    ic.candidato_cpf
from inscricao_c ic
inner join concurso c on ic.concurso_numero = c.numero
where c.numero=1;

--14. Listar todas as questões sorteadas em um determinado concurso, retornando o código da questão, o texto descritivo
--da questão, a quantidade de vezes que a questão foi sorteada, a quantidade absoluta de vezes em que ela foi
--assinalada corretamente pelos candidatos e a quantidade relativa de vezes em que foi assinalada corretamente
--(quantidade relativa pode ser calculada dividindo a quantidade de acertos pela quantidade de vezes em que foi
--sorteada). O retorno deverá estar ordenado pela quantidade relativa de vezes em que foi assinalada corretamente
--pelos candidatos (decrescente).

select * from questao;

with
     alternativas as (
        select
                q.codigo,
                --qp.alternativa_marcada,
                --aq.letra,
                count(case when a.correta=true then 1 end)    as acertos,
                count(case when a.correta=false then 1 end)   as erros,
                count(case when a.correta is null then 1 end) as em_branco
                --a.correta as resposta
        from questao q
        inner join questao_p qp on q.codigo = qp.questao_codigo
        left join alternativa_qp aq on qp.questao_codigo = aq.qp_cod_ques and
                                       qp.prova_cpf = aq.qp_cpf_prov and
                                       qp.prova_num_conc = aq.qp_num_conc_prov and
                                       qp.alternativa_marcada = aq.letra
        left join alternativa a on aq.alt_seq = a.sequencial and
                                   aq.alt_cod_ques = a.questao_codigo
        where qp.prova_num_conc=2
        group by q.codigo
     ),
     sort as (
        select
            q.codigo as quest_cod,
            q.descricao as quest_desc,
            count(*) as qtde_sort
        from concurso c
        inner join inscricao_c ic on c.numero = ic.concurso_numero
        inner join prova p on ic.candidato_cpf = p.ins_c_cpf and ic.concurso_numero = p.ins_c_num_conc
        inner join questao_p qp on p.ins_c_cpf = qp.prova_cpf and p.ins_c_num_conc = qp.prova_num_conc
        inner join questao q on qp.questao_codigo = q.codigo
        where c.numero=2
        --inner join alternativas at on at.codigo = q.codigo
        group by q.codigo--, at.acertos
        --order by at.acertos desc
    )
select
    st.quest_cod,
    st.quest_desc,
    st.qtde_sort,
    at.acertos as qtde_acertos,
    trunc((at.acertos::decimal /coalesce((qtde_sort::decimal),1) ),2)*100 as porcentagem_relativa
from sort st
inner join alternativas at on st.quest_cod = at.codigo
order by trunc((at.acertos::decimal /qtde_sort::decimal ),2)*100 desc;

--15. Listar todos os fiscais de prova de um determinado concurso, retornando o endereço do local de prova, a sala em
--que foi alocado, o CPF e o nome do fiscal. O retorno deverá estar ordenado pelo endereço do local de prova, sala,
--nome, CPF.

select
       p2.e_estado as estado,
       p2.e_cidade as cidade,
       p2.e_bairro as bairro,
       p2.e_rua as rua,
       p2.e_num as numero,
       p2.e_complemento as complemento,
       s.numero as numero_sala,
       p.cpf as cpf,
       p.nome as nome
from pessoa p
inner join fiscal f on p.cpf = f.pessoa_cpf
inner join inscricao_f i on f.pessoa_cpf = i.fiscal_cpf
inner join sala s on i.sala_numero = s.numero and i.sala_codigo_pred = s.predio_codigo
inner join  predio p2 on s.predio_codigo = p2.codigo
where i.concurso_numero = 2
order by estado, cidade, bairro, rua, numero, complemento, numero_sala, nome, cpf;

--16. Listar todas as salas de todos os locais de prova de um determinado concurso, retornando o endereço do local de
--prova, o número da sala e a quantidade de fiscais.

select
    p.e_estado as estado,
    p.e_cidade as cidade,
    p.e_bairro as bairro,
    p.e_rua as rua,
    p.e_num as numero,
    p.e_complemento as complemento,
    s.numero as numero_sala,
    count(i.fiscal_cpf) as qtde_fiscal
from sala s
inner join predio p on s.predio_codigo = p.codigo
left join inscricao_f i on s.numero = i.sala_numero and s.predio_codigo = i.sala_codigo_pred and i.concurso_numero = 1
group by p.codigo, s.numero;

--17. Listar os candidatos que foram desclassificados de um determinado concurso, retornando o CPF, nome e número
--de inscrição do candidato, o CPF e nome do fiscal que efetivou a desclassificação e a razão pela qual houve tal
--desclassificação.

with
desclassificados as (
    select p.cpf             as cpf_candidato,
           p.nome            as nome_candidato,
           ic.num_insc       as num_insc_candidato,
           ic.fiscal_cpf_des as cpf_fiscal,
           ic.motivo_des,
           ic.concurso_numero
    from inscricao_c ic
             inner join candidato c on ic.candidato_cpf = c.pessoa_cpf
             inner join pessoa p on c.pessoa_cpf = p.cpf
    where ic.presenca = true
      and fiscal_cpf_des is not null
)
select
    d.cpf_candidato,
    d.nome_candidato,
    d.num_insc_candidato,
    d.cpf_fiscal,
    p.nome as nome_fiscal,
    d.motivo_des
from desclassificados d
inner join inscricao_f if on if.concurso_numero = d.concurso_numero
inner join fiscal f on d.cpf_fiscal = f.pessoa_cpf and if.fiscal_cpf = f.pessoa_cpf
inner join pessoa p on f.pessoa_cpf = p.cpf
where d.concurso_numero = 1;

--18. Listar o número de inscrição e o nome dos n candidatos detentores da maior nota em um determinado concurso,
--considerando que a nota seja calculada pela simples soma de acertos na prova. Caso haja empate, a consulta deverá
--dar prioridade para o candidato de maior idade. Caso ainda haja empate, a busca deve retornar todas as pessoas
--empatadas.

with
     provas as (
         select
                pr.ins_c_cpf,
                pr.ins_c_num_conc,
                --qp.alternativa_marcada,
                --aq.letra,
                count(case when a.correta=true then 1 end)    as acertos,
                count(case when a.correta=false then 1 end)   as erros,
                count(case when a.correta is null then 1 end) as em_branco
                --a.correta as resposta
         from prova pr
         inner join questao_p qp on pr.ins_c_cpf = qp.prova_cpf and pr.ins_c_num_conc = qp.prova_num_conc
         left join alternativa_qp aq on qp.questao_codigo = aq.qp_cod_ques and qp.prova_cpf = aq.qp_cpf_prov and qp.prova_num_conc = aq.qp_num_conc_prov and qp.alternativa_marcada = aq.letra
         left join alternativa a on aq.alt_seq = a.sequencial and aq.alt_cod_ques = a.questao_codigo
         group by pr.ins_c_cpf, pr.ins_c_num_conc
         order by pr.ins_c_cpf, pr.ins_c_num_conc--, qp.numero
    ),
     cte as (
         select co.nome,
                p.nome,
                p.data_nascimento,
                pr.acertos,
                rank() OVER (ORDER BY pr.acertos desc, p.data_nascimento asc) AS rnk
         from inscricao_c ic --on co.numero = ic.concurso_numero
                  inner join candidato c on ic.candidato_cpf = c.pessoa_cpf
                  inner join pessoa p on c.pessoa_cpf = p.cpf
                  inner join provas pr on ic.candidato_cpf = pr.ins_c_cpf and 9 = pr.ins_c_num_conc
                  inner join concurso co on ic.concurso_numero = co.numero --and co.numero=1
         where ic.presenca = true
           and ic.fiscal_cpf_des is null
           and pr.ins_c_num_conc = 9
           and co.numero = 9-- and p.cpf=27778567248--candidatos nao desclassificados
         order by pr.acertos desc, p.data_nascimento asc
     )
select *
from cte
WHERE  rnk <= 20;

--19. Listar o número de inscrição e o nome dos n candidatos detentores da maior nota em um determinado concurso,
--considerando que a nota seja calculada pela diferença entre acertos e erros (ignorando questões em branco). Caso
--haja empate, a consulta deverá dar prioridade para o candidato de maior idade. Caso ainda haja empate, a busca
--deve retornar todas as pessoas empatadas.

with
     provas as (
         select
                pr.ins_c_cpf,
                pr.ins_c_num_conc,
                --qp.alternativa_marcada,
                --aq.letra,
                count(case when a.correta=true then 1 end)    as acertos,
                count(case when a.correta=false then 1 end)   as erros,
                count(case when a.correta is null then 1 end) as em_branco
                --a.correta as resposta
         from prova pr
         inner join questao_p qp on pr.ins_c_cpf = qp.prova_cpf and pr.ins_c_num_conc = qp.prova_num_conc
         left join alternativa_qp aq on qp.questao_codigo = aq.qp_cod_ques and qp.prova_cpf = aq.qp_cpf_prov and qp.prova_num_conc = aq.qp_num_conc_prov and qp.alternativa_marcada = aq.letra
         left join alternativa a on aq.alt_seq = a.sequencial and aq.alt_cod_ques = a.questao_codigo
         group by pr.ins_c_cpf, pr.ins_c_num_conc
         order by pr.ins_c_cpf, pr.ins_c_num_conc--, qp.numero
    ),
    the_terminator as (
	select
	    ic.num_insc,
	    p.nome,
	    --p.data_nascimento,
	    --pr.acertos,
	    --pr.erros,
	    --pr.em_branco,
	    case when (pr.acertos - pr.erros) < 0 then 0 else (pr.acertos - pr.erros) end as nota,
	    --if((pr.acertos - pr.erros) < 0, 0, pr.acertos - pr.erros) as nota,
	    rank() OVER (ORDER BY (pr.acertos-pr.erros) desc, p.data_nascimento asc) AS rnk
	from inscricao_c ic --on co.numero = ic.concurso_numero
	inner join candidato c on ic.candidato_cpf = c.pessoa_cpf
	inner join pessoa p on c.pessoa_cpf = p.cpf
	inner join provas pr on ic.candidato_cpf = pr.ins_c_cpf and 9 = pr.ins_c_num_conc
	inner join concurso co on ic.concurso_numero = co.numero --and co.numero=1
	where ic.presenca=true  and ic.fiscal_cpf_des is null and pr.ins_c_num_conc=9 and co.numero=9-- and p.cpf=27778567248--candidatos nao desclassificados
	order by pr.acertos-pr.erros desc, p.data_nascimento asc
    )
select tt.num_insc, tt.nome, tt.nota
from the_terminator tt
WHERE  rnk <= 20;

--20. Para uma determinada prova (candidato em um concurso), listar todas as questões, alternativas e uma coluna
--indicando a resposta correta e uma outra indicando a resposta marcada (se marcou). A saída esperada seria uma
--relação que mostraria claramente uma reprodução fiel da prova do candidato e suas respostas. A Figura 2 apresenta
--uma saída esperada. Note que na questão número 1, a alternativa correta era a letra C e o candidato marcou letra
--B, errando a questão; na questão 2 a alternativa correta era a letra B e o candidato não marcou nenhuma, deixando
--em branco; na questão 3 a alternativa correta era a letra C e o candidato marcou a letra C, sendo um acerto.

select
    qp.numero as Número,
    q.descricao as Questão,
    a.descricao as Alternativa,
    aq.letra as Letra,
    a.correta as Correta,
    coalesce(qp.alternativa_marcada = aq.letra, false) as Marcada
from prova pr
inner join questao_p qp on pr.ins_c_cpf = qp.prova_cpf and pr.ins_c_num_conc = qp.prova_num_conc
inner join questao q on qp.questao_codigo = q.codigo
inner join alternativa a on q.codigo = a.questao_codigo
inner join alternativa_qp aq on qp.questao_codigo = aq.qp_cod_ques and
                                qp.prova_cpf = aq.qp_cpf_prov and
                                qp.prova_num_conc = aq.qp_num_conc_prov and
                                a.sequencial = aq.alt_seq and
                                a.questao_codigo = aq.alt_cod_ques
where pr.ins_c_num_conc = 9 and pr.ins_c_cpf = 27778567248
order by qp.numero, aq.letra;

--select * from alternativa_qp where qp_cpf_prov = 27778567248 limit 1;

--insert into alternativa_qp values (5,441,441,27778567248,9,'A');

--delete from alternativa_qp where (alt_seq, alt_cod_ques, qp_cod_ques, qp_cpf_prov, qp_num_conc_prov) =
                                 (5,441,441,27778567248,9);
