drop database if exists pizzaria;

create database if not exists pizzaria;

use pizzaria;

CREATE TABLE Clientes (
	id INt not null AUTO_INCREMENT primary key,
	telefone VARCHAR(14),
	nome VARCHAR(30),
	logradouro VARCHAR(30),
	numero DECIMAL(5,0),
	complemento VARCHAR(30),
	bairro VARCHAR(30),
	referencia VARCHAR(30)
 );

 CREATE TABLE pizzas (
    id INTEGER not null AUTO_INCREMENT primary key,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(15 , 2 )
 );
 
 CREATE TABLE pedidos (
    id INTEGER AUTO_INCREMENT primary key,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(15 , 2 )
 );
 
 alter table pedidos add FOREIGN KEY (cliente_id) REFERENCES Clientes (id);
 
 
 CREATE TABLE itens_pedido (
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade int,
    valor DECIMAL(15 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES Pizzas (id),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedidos (id)
 );
 


INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c 

INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15),
('Provolone', 17),
('4 Queijos', 20),
('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');


alter table pizzas modify valor decimal(15,2) default 99;

INSERT INTO pizzas (nome) VALUES ('Moda da Casa');

INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);



INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);

select * from pizzas;

-- adicionar algo na tabela.
alter table pizzas add column custo decimal(15,2);

update pizzas set custo = valor * 0.60;

-- Selecionar todas as pizzas com valor superior a R$ 17.00
select * from pizzas where valor > 17;

-- selecionar todas as pizzas com valor igual ou superior a R$ 17.00
select * from pizzas where valor >= 17;

-- selecionar todas as pizzas com valor inferior a R$ 17.00
select * from pizzas where valor < 17;

-- selecionar todas as pizzas com valor igual ou inferior a R$ 17.00
select * from pizzas where valor <= 17;

-- selecionar todas as pizzas com valor igual a R$ 17
select * from pizzas where valor = 17; 

-- selecionar todas as pizzas com valor diferente de R$ 17
select * from pizzas where valor != 17;

-- selecionar todas as pizzas com a coluna valor nula;
select * from pizzas where valor <=> null;
select * from pizzas where valor is null;

-- para criar uma expressao logica, utilizam se os operadores logicos
-- E (AND ou &&), OU (OR ou ||) e NAO (NOT ou !)
-- selecionar todas as pizzas com valores entre 15,00 e 20,00;
select * from pizzas where valor > 15 and valor < 20;
select * from pizzas where valor between 16 and 19;

-- selecionar todas as pizzas com valores menores ou maiores do que 17.00;
select * from pizzas where valor < 17 or valor > 17;

-- selecionar todas as pizzas com valores nao menores ou maiores do que 17.00;
select * from pizzas where not valor < 17 or valor > 17;

-- selecionar todas as pizzas com valores na faixa entre 17,00 e 20,00;
select * from pizzas where valor between 17 and 20;

-- selecionar todas as pizzas com valores fora da faixa de 17 e 20;
select * from pizzas where valor not between  17 and 20;
select * from pizzas where not (valor >=17 and valor <=20);

-- selecionar todas as pizzas com valores iguais a 15 e 20;
select * from pizzas where valor = 15 or valor = 20;
select * from pizzas where valor in (15,20);

-- selecionar todas as pizz com valores diferentes de 15 e 20;
select * from pizzas where valor != 15 and valor != 20;
select * from pizzas where valor not in (15, 20);

--  selecionar todas as pizzas com valores nao nulos
select * from pizzas where valor is not null;

-- selecionar todas as pizzas que comecem com a letra E
select * from pizzas where nome like 'e%';

-- selecionar todas as pizzas que terminam com a letra A
select * from pizzas where nome like '%a';

-- selecionar todas as pizzas com nomes que tenham as letras "esa"
select * from pizzas where nome like '%esa%';

-- Clausula ORDER BY
-- order by <coluna 1> [asc/desc], <coluna n> [asc/desc];
-- listar todas as colunas da tabela PIZZA em ordem alfabetica;

select * from pizzas order by nome asc;

-- listar todas as colunas da tabela PIZZA em ordem decrescente;
select * from pizzas order by nome desc;

-- listar o nome e o valor da pizza em ordem decrescente de valor e crescente de nome;
select * from pizzas order by valor desc, nome asc;

-- restringir o numero de linhas retornadas pelo comando select * from
select * from pizzas order by valor desc limit 2;

select nome, valor from pizzas order by 1;


select distinct valor from pizzas order by valor;

   /* Funçoes de agregacao
	* Conhecidas como funcoes estatisticas, as funcoes de agregacao obtem
    * informacoes sobre conjuntos de linhas especificados
    * AVG(coluna) media dos valores da coluna
    * COUNT numero de linhas
    * MAX(coluna) Maior valor da coluna
    * MIN(coluna) Menor valor da coluna
    * SUM(coluna) soma dos vaalores da coluna
    */

select * from pizzas;
-- contar quantas pizzas estao cadastradas
select count(*) from pizzas;
select count(nome) from pizzas;
select count(valor) from pizzas;

-- Qual é a media dos precos das pizzas

select avg(valor) as media from pizzas;
select avg(valor) as media from pizzas where nome like '%esa';

-- qual é ao valor da pizza mais cara do cardapio da pizzaria?
select max(valor) as maior from pizzas;

-- qual é o valor da pizza mais barata do cardapio da pizzaria?
select min(valor) as menor from pizzas;

-- qual é o valor total do pedido número 7?
select * from itens_pedido;
select sum(valor) as soma from itens_pedido where pedido_id = 7;

-- qual é o valor de cada pedido?
select pedido_id as pedido, sum(valor) as 'valor pedido' from itens_pedido group by pedido_id;

-- qual a quantidade de pizza e o valor medio 
select pedido_id as pedido, sum(valor) as 'valor pedido', 
sum(quantidade) 'qnt pizzas', 
avg(valor) as media, 
sum(valor) / sum(quantidade) as 'valor medio'
from itens_pedido 
group by pedido_id;

-- inner join: retorna registros quando ha pelo menos uma correspondencia em ambas as tabelas.
select * from clientes as c
inner join pedidos as p on p.cliente_id = c.id;

select clientes.id, nome, telefone, pedidos.id from clientes
inner join pedidos on pedidos.cliente_id = clientes.id;

select c.id, c.nome, p.id as pedido from clientes as c
inner join pedidos as p on p.cliente_id = c.id;

select * from clientes;
select * from pedidos;


insert into pedidos(id, data, valor) values (9, '2024-10-02',0);

-- left join (ou left outer join); retorne todos os registros da tabela da esquerda (primeira tabela mencionada) e os registros correspondentes da tabela da direita (segunda tabela mencionada)
select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes
left join pedidos on pedidos.cliente_id = clientes.id;

-- right join (ou right outer join); retorne todos os registros da tabela da direita (segunda tabela mencionada) e os registros correspondentes da tabela da direita (primeira tabela mencionada)
select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes
right join pedidos on pedidos.cliente_id = clientes.id;


-- quantidade de pedidos realizados por cliente, exbir nome do cliente e quantidade de pediddos realizados
select nome, count(*) from clientes
inner join pedidos on clientes.id = pedidos.cliente_id
group by nome;

select nome, count(pedidos.id) from clientes
left join pedidos on clientes.id = pedidos.cliente_id
group by nome;

select * from pedidos;
select * from clientes;

-- quantos pedidos foram feitos no total?

select count(cliente_id) from pedidos;

-- quantos pedidos foram feitos pelo cliente alexandre

select nome, count(pedidos.id) from clientes left join pedidos on clientes.id = pedidos.cliente_id where nome = 'Alexandre Santos'
group by nome ;

-- Qual e o valor total de todos os pedidos feitos até agora?

select sum(valor) from pedidos;