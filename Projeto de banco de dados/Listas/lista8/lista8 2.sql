
----QUESTAO 2
create table Conta_Corrente(
    numero_conta numeric(5) not null, 
    agencia numeric(3),
    primary key (numero_conta)
);

create table Pessoa(
    cpf numeric(11) not null, 
    nome varchar(100) not null, 
    end_lougradouro varchar(100), 
    end_bairro varchar(30), 
    end_cep varchar(8),
    primary key (cpf)
);

create table Correntista(
    numero_conta numeric(5) not null, 
    cpf numeric(11) not null,
    primary key (numero_conta, cpf)
);

create table Cartao_de_Credito(
    numero numeric(16) not null, 
    numero_conta_correntista numeric(5) not null, 
    cpf_correntista numeric(11) not null,
    primary key (numero)
);

create table Lancamento(
    codigo numeric(6) not null, 
    descricao varchar(100) not null, 
    valor numeric(30) not null, 
    tipo varchar(10) not null, 
    data_hora varchar(30) not null, 
    numero_cartao numeric(16) not null,
    primary key (codigo)
);

alter table Correntista
    add constraint fk_Cor_ContC foreign key (numero_conta) references Conta_Corrente (numero_conta),
    add constraint fk_Cor_Pes foreign key (cpf) references Pessoa (cpf);

alter table Cartao_de_Credito
    add constraint fk_CdC_Corr foreign key (numero_conta_correntista ,cpf_correntista) references Correntista (numero_conta ,cpf);

alter table Lancamento
    add constraint fk_Lanc_CdC foreign key (numero_cartao) references Cartao_de_Credito (numero);
	
---INSERTIONS
insert into Pessoa (cpf,nome)
values
(111, 'Felipe'),--a
(222, 'Max'),--b
(333, 'Samuel'),--c
(444, 'Fernanda'),--d
(555, 'Maicom');--e

insert into conta_corrente(numero_conta, agencia)
values
(44310, 100),--W
(44311, 101),--X
(44312, 102),--Y
(44313, 103);--Z

insert into correntista(numero_conta, cpf)
values
(44310, 111),--W-A
(44310, 222),--W-B
(44311, 111),--xa
(44311, 333),--xc
(44311, 444),--xd
(44312, 222),--yb
(44313, 555);--ze

insert into cartao_de_credito(numero, numero_conta_correntista, cpf_correntista)
values
(5555444433332221,44310,111),
(5555444433332222,44310,222),
(5555444433332223,44311,333),
(5555444433332224,44311,333),
(5555444433332225,44312,222);

insert into lancamento(codigo, descricao, valor, tipo, data_hora, numero_cartao)
values
(100000, 'comida' ,10.05, 'credito', '2020-10-31 23:59:59', 5555444433332221 ),
(200000, 'compras',20.55, 'debito', '2020-10-31 13:59:59', 5555444433332221 ),
(300000, 'comida',10.05, 'credito', '2020-10-31 23:59:59', 5555444433332222 ),
(400000, 'compras',30, 'debito', '2020-10-31 13:59:59', 5555444433332222 ),
(500000, 'loja',67, 'credito', '2020-10-31 23:59:59', 5555444433332223 ),
(600000, 'comida',50, 'debito', '2020-10-31 13:59:59', 5555444433332223 ),
(700000, 'gasolina',22, 'credito', '2020-10-31 23:59:59', 5555444433332224 ),
(800000, 'compras',15.5, 'debito', '2020-10-31 13:59:59', 5555444433332224 ),
(900000, 'comida',6.8, 'credito', '2020-10-31 23:59:59', 5555444433332225 ),
(100001, 'shopping',120, 'debito', '2020-10-31 13:59:59', 5555444433332225 );
