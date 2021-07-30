
-- Insert Perfil I --

insert into Perfil(id_perfil,nome,data_nascimento)
values 
(1,'Gabriel ','2001-09-14'),
(2,'Joao','2012-07-02'),
(3,'Marcos', null),
(4,'Felipe',null ),
(5,'Maria ',null ),
(6,'Joana','2005-08-13'),
(7,'Marcia','1999-03-28'),
(8,'Alexssander',null),
(9,'Roberta','1997-01-05'),
(10,'Alex','2000-12-23');

-- 7 posts de 2 usuários II --

insert into post(id_post,texto,data_hora,fk_perfil)
values
(1,'bla',current_timestamp,1),
(2,'bolinha',current_timestamp,1),
(3,'bobi',current_timestamp,1),
(4,'roi leticia',current_timestamp,1),
(5,'mascotinho',current_timestamp,1),
(6,'janovski lindo',current_timestamp,1),
(7,'alexssander feio',current_timestamp,1),
(8,'felipe lindo',current_timestamp,5),
(9,'criatorio de peixe',current_timestamp,5),
(10,'espanhol',current_timestamp,5),
(11,'concha',current_timestamp,5),
(12,'sucata',current_timestamp,5),
(13,'sumi da vila',current_timestamp,5),
(14,'bolota',current_timestamp,5);
                                        
-- 5 posts de outros 4 usuários III --

insert into post(id_post,texto,data_hora,fk_perfil)
values
(15,'alahuakba',current_timestamp,3),
(16,'costelinha',current_timestamp,3),
(17,'franquito',current_timestamp,3),
(18,'certamente',current_timestamp,3),
(19,'recairei',current_timestamp,3),
(20,'coronga virus',current_timestamp,9),
(21,'to cansado',current_timestamp,9),
(22,'brastemp',current_timestamp,9),
(23,'tbt cazamiga',current_timestamp,9),
(24,'controle',current_timestamp,9),
(25,'remoto',current_timestamp,2),
(26,'feiticeiro',current_timestamp,2),
(27,'samba',current_timestamp,2),
(28,'zeca pagodinho',current_timestamp,2),
(29,'marquinhos show',current_timestamp,2),
(30,'alerta',current_timestamp,6),
(31,'feiura',current_timestamp,6),
(32,'paozinho',current_timestamp,6),
(33,'pao',current_timestamp,6),
(34,'online',current_timestamp,6);

-- 4 posts de outro 1 usuário IV --

insert into post(id_post,texto,data_hora,fk_perfil)
values
(35,'fominha',current_timestamp,4),
(36,'chazinho da tarde',current_timestamp,4),
(37,'churras com os parça',current_timestamp,4),
(38,'comidinha',current_timestamp,4);

--Insira comentários de 4 usuários em 8 posts VI --

insert into comentario(id_comentario,texto,data_hora,fk_perfil,fk_post)
values
(1,'lindo',current_timestamp,1,3),
(2,'arrasou amiga',current_timestamp,1,4),
(3,'belissimo',current_timestamp,1,5),
(4,'gostei',current_timestamp,1,6),
(5,'gostosa',current_timestamp,1,7),
(6,'passa zap',current_timestamp,1,8),
(7,'blindado',current_timestamp,1,9),
(8,'parabens',current_timestamp,1,10),
(9,'merecido',current_timestamp,7,11),
(10,'feio demais',current_timestamp,7,12),             
(11,'parece o alexssander',current_timestamp,7,13),
(12,'ja fui',current_timestamp,7,14),
(13,'muito caro',current_timestamp,7,15),
(14,'burgues',current_timestamp,7,16),
(15,'aaaaaaaa',current_timestamp,7,17),
(16,'uiuiui',current_timestamp,7,18),
(17,'dadaa',current_timestamp,3,19),
(18,'feminino',current_timestamp,3,20),
(19,'auai',current_timestamp,3,22),
(20,'auau',current_timestamp,3,24),
(21,'oiaoi',current_timestamp,3,26),
(22,'ain',current_timestamp,3,2),
(23,'roi',current_timestamp,3,3),
(24,'passa o zap',current_timestamp,3,12),
(25,'passeio',current_timestamp,4,32),
(26,'passarela linda',current_timestamp,4,30),
(27,'saudades',current_timestamp,4,29),
(28,'titia ama',current_timestamp,4,25),
(29,'n gostei',current_timestamp,4,26),
(30,'vou cancelar',current_timestamp,4,20),
(31,'maxista',current_timestamp,4,12),
(32,'nhau',current_timestamp,4,14);

--Insira comentários de 3 usuários em 4 posts VII--

insert into comentario(id_comentario,texto,data_hora,fk_perfil,fk_post)
values
(33,'lindo da tia',current_timestamp,5,24),
(34,'titia esta com saudade',current_timestamp,5,14),
(35,'boa tarde',current_timestamp,5,12),
(36,'saudade lindinho',current_timestamp,5,25),
(37,'lindinho',current_timestamp,6,26),
(38,'oi',current_timestamp,6,27),
(39,'ola',current_timestamp,6,28),
(40,'vovo ama',current_timestamp,6,29),
(41,'boa tarde',current_timestamp,9,23),
(42,'passa o zap',current_timestamp,9,22),
(43,'roi',current_timestamp,9,21),
(44,'ja fui ai',current_timestamp,9,20);

--Insira curtidas de 7 usuários em 4 posts cada VIII --

insert into curtir(fk_perfil,fk_post)
values
(1,1),
(1,2),
(1,3),
(1,4),
(2,1),
(2,2),
(2,3),
(2,4),
(3,1),
(3,2),
(3,3),
(3,4),
(4,1),
(4,2),
(4,3),
(4,4),
(5,1),
(5,2),
(5,3),
(5,4),
(6,1),
(6,2),
(6,3),
(6,4),
(7,1),
(7,2),
(7,3),
(7,4);

--Faça 2 usuários seguirem todos os demais usuários IX --

insert into seguir (fk_seguidor, fk_seguido)
values
(10,1),
(10,2),
(10,3),
(10,4),
(10,5),
(10,6),
(10,7),
(10,8),
(10,9),
(1,10),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9);

-- Faça 3 usuários seguirem 4 outros usuários X --

insert into seguir (fk_seguidor, fk_seguido)
values
(6,2),
(6,3),
(6,4),
(6,5),
(5,2),
(5,3),
(5,4),
(5,6),
(4,2),
(4,3),
(4,5),
(4,6);

-- Faça 3 usuários seguirem apenas um ao outro (ou seja, dados os usuários A, B e C, A segue B --
-- e C, B segue A e C, C segue A e B) XI --

insert into seguir (fk_seguidor, fk_seguido)
values
(7,8),
(7,9),
(8,7),
(8,9),
(9,7),
(9,8);

