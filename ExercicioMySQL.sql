create database redes_sociais;

use redes_sociais;

create table usuarios (
	id int not null auto_increment primary key,
    nome varchar(100) not null,
    email varchar(45) not null unique,
    data_criacao date
);

create table postagens (
	id int not null auto_increment primary key,
    texto varchar(255),
    data_publicacao date not null,
    imagem varchar(255),
    usuarios_id int not null,
    foreign key (usuarios_id) references usuarios (id)
);

create table comentarios (
	id int not null auto_increment primary key,
    texto varchar(255) not null,
    data_criacao date not null,
    postagens_id int not null,
    usuarios_id int not null,
    foreign key (postagens_id) references postagens (id),
    foreign key (usuarios_id) references usuarios (id)
);

create table curtidas (
	postagens_id int not null,
    usuarios_id int not null,
    primary key (postagens_id, usuarios_id),
    foreign key (postagens_id) references postagens (id),
    foreign key (usuarios_id) references usuarios (id)
);

insert into usuarios (nome, email, data_criacao)
values ('guilherme', 'guilherme.lacerda@senai.br',  '2024-09-04');
insert into usuarios (nome, email, data_criacao)
values ('maria luiza', 'maria.luiza@senai.br', '2024-09-03');
insert into usuarios (nome, email, data_criacao)
values ('gabriela', 'gabriela.saraiva@senai.br', '2024-09-02');
insert into usuarios (nome, email, data_criacao)
values ('rahiany', 'rahiany.victoria@senai.br' , '2024-09-01');
insert into usuarios (nome, email, data_criacao)
values ('luiz', 'luiz.trajano@senai.br', '2024-08-31');

select * from usuarios;

insert into postagens (texto, data_publicacao, imagem, usuarios_id)
values ('', 2024-0



drop table postagens;
drop table usuarios;
drop table comentarios;
drop table curtidas;