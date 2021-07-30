create table perfil(
	id_perfil numeric(5) not null,
	nome varchar(50) not null,
	data_nascimento date,
	primary key(id_perfil)
);


create table Post(
	id_post numeric(5) not null,
	texto varchar(250) not null,
	data_hora Timestamp not null,
	fk_perfil numeric(5) not null,
	primary key (id_post)
);

alter table Post
	add constraint fk_perfil foreign key (fk_perfil) references perfil(id_perfil);
	
create table comentario(
	id_comentario numeric(5) not null,
	texto varchar(250) not null,
	data_hora timestamp not null,
	fk_perfil numeric(5) not null,
	fk_post numeric(5) not null,
	primary key (id_comentario)
);

alter table comentario
	add constraint fk_perfil_1 foreign key (fk_perfil) references perfil(id_perfil),
	add constraint fk_poste_1  foreign key (fk_post) references post(id_post);
	
create table seguir(
	fk_seguidor numeric(5) not null,
	fk_seguido numeric(5) not null,
	primary key (fk_seguidor,fk_seguido)
);

alter table seguir
	add constraint fk_seguidor foreign key (fk_seguidor) references perfil(id_perfil),
	add constraint fk_seguido foreign key (fk_seguido) references perfil(id_perfil);
	
create table curtir(
	fk_perfil numeric(5) not null,
	fk_post numeric(5) not null,
	primary key (fk_perfil,fk_post)
);

alter table curtir
	add constraint fk_perfil_2 foreign key (fk_perfil) references perfil(id_perfil),
	add constraint fk_post_1 foreign key (fk_post) references post(id_post);