----QUESTAO 1
create table Pessoa(
    cpf numeric(11) not null, 
    nome varchar(200) not null, 
    data_nascimento date,
    primary key(cpf)
);

create table Professor(
    matricula_professor numeric(5) not null, 
    cpf_pes numeric(11) not null,
    primary key (matricula_professor)
    --foreign key (cpf_pes) references Pessoa(cpf)
);

create table Aluno(
    matricula_aluno numeric(12) not null, 
    cpf_pes numeric(11) not null,
    primary key (matricula_aluno)
    --foreign key (cpf_pes) references Pessoa(cpf)
);

create table Matricula(
    matricula_aluno numeric(12), 
    ano_semestre_turma numeric(5), 
    codigo_turma varchar(3), 
    data_inclusao date,
    primary key (matricula_aluno, ano_semestre_turma, codigo_turma)
);

create table Disciplina(
    codigo_disciplina varchar(7) not null, 
    nome_disciplina varchar(100) not null, 
    carga_horaria numeric(3),
    primary key (codigo_disciplina)
);

create table Turma(
    ano_semestre numeric(5) not null, 
    codigo_turma varchar(3) not null, 
    matricula_professor numeric(5), 
    codigo_disciplina varchar(7) not null,
    primary key (ano_semestre, codigo_turma)
    --foreign key (matricula_professor, codigo_disciplina) references Professor(matricula_professor), Disciplina(codigo_disciplina) 
);

alter table Professor
    add constraint fk_Prof_Pes foreign key (cpf_pes) references Pessoa (cpf);

alter table Aluno
    add constraint fk_Alu_Pes foreign key (cpf_pes) references Pessoa (cpf);

alter table Turma
    add constraint fk_Tur_Prof foreign key (matricula_professor) references Professor (matricula_professor),
    add constraint fk_Tur_Disc foreign key (codigo_disciplina) references Disciplina (codigo_disciplina);

alter table Matricula
    add constraint fk_Matri_Alu foreign key (matricula_aluno) references Aluno (matricula_aluno),
    add constraint fk_Matri_Tur foreign key (ano_semestre_turma, codigo_turma) references Turma (ano_semestre, codigo_turma);

--INSERTIONS

insert into Pessoa(cpf, nome, data_nascimento)
values
(111, 'Felipe', '2001-07-15'),
(222, 'Maria', '2001-07-15'),
(333, 'Carol', '2001-07-15'),
(444, 'Jonas', '2001-07-15'),
(555, 'Eliseu', '2001-07-15'),
(666, 'Marcos', '2001-07-15'),
(777, 'Valdir', '2001-07-15'),
(888, 'Ana', '2001-07-15'),
(999, 'Kris', '2001-07-15'),
(000, 'Leo', '2001-07-15'),
(010, 'Max', '2001-07-15');

insert into Professor(matricula_professor, cpf_pes)
values
(001, 000),
(012, 010),
(023, 999);

insert into Aluno (matricula_aluno, cpf_pes)
values
(110, 111),
(221, 222),
(332, 333),
(443, 444),
(554, 555),
(665, 666),
(776, 777),
(887, 888);

insert into Disciplina (codigo_disciplina, nome_disciplina, carga_horaria)
values
('CMP1117', 'Banco de Dados', 120),
('CMP1048', 'Tecnicas de Programacao 1', 90),
('CMP1049', 'Fundamentos de Computacao 2', 90);

insert into Turma (ano_semestre, codigo_turma, matricula_professor, codigo_disciplina)
values
(20201, 'C01', 001, 'CMP1117'),
(20201, 'C02', 001, 'CMP1117'),
(20202, 'C01', 001, 'CMP1048'),
(20202, 'C02', 001, 'CMP1048'),
(20201, 'C03', 012, 'CMP1049'),
(20202, 'C03', 012, 'CMP1049');

insert into Matricula (matricula_aluno, ano_semestre_turma, codigo_turma, data_inclusao)
values
(554, 20201, 'C01', '2020-10-29'),
(665, 20201, 'C01', '2020-10-29'),
(776, 20201, 'C02', '2020-10-29'),
(887, 20201, 'C02', '2020-10-29'),

(554, 20202, 'C01', '2020-10-29'),
(665, 20202, 'C01', '2020-10-29'),
(776, 20202, 'C02', '2020-10-29'),
(887, 20202, 'C02', '2020-10-29'),

(554, 20201, 'C03', '2020-10-29'),
(665, 20201, 'C03', '2020-10-29'),
(776, 20202, 'C03', '2020-10-29'),
(887, 20202, 'C03', '2020-10-29'),

--TODAS TURMAS
(110, 20201, 'C01', '2020-10-29'),
(110, 20201, 'C02', '2020-10-29'),
(110, 20202, 'C01', '2020-10-29'),
(110, 20202, 'C02', '2020-10-29'),
(110, 20201, 'C03', '2020-10-29'),
(110, 20202, 'C03', '2020-10-29'),

(221, 20201, 'C01', '2020-10-29'),
(221, 20201, 'C02', '2020-10-29'),
(221, 20202, 'C01', '2020-10-29'),
(221, 20202, 'C02', '2020-10-29'),
(221, 20201, 'C03', '2020-10-29'),
(221, 20202, 'C03', '2020-10-29'),

(332, 20201, 'C01', '2020-10-29'),
(332, 20201, 'C02', '2020-10-29'),
(332, 20202, 'C01', '2020-10-29'),
(332, 20202, 'C02', '2020-10-29'),
(332, 20201, 'C03', '2020-10-29'),
(332, 20202, 'C03', '2020-10-29'),

(443, 20201, 'C01', '2020-10-29'),
(443, 20201, 'C02', '2020-10-29'),
(443, 20202, 'C01', '2020-10-29'),
(443, 20202, 'C02', '2020-10-29'),
(443, 20201, 'C03', '2020-10-29'),
(443, 20202, 'C03', '2020-10-29');