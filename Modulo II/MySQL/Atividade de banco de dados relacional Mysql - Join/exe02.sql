/*Crie um banco de dados para um serviço de uma Pizzaria. O nome do Banco de dados deverá ter o seguinte nome db_pizzaria_legal. O sistema trabalhará com as informações dos produtos comercializados pela empresa. O sistema trabalhará com 2 tabelas tb_pizzas e tb_categorias, que deverão estar relacionadas.

Boas Práticas:

Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar as pizzas.
Crie a tabela tb_pizzas e determine 4 atributos, além da Chave Primária, relevantes aos produtos da pizzaria.
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_pizzas.
Insira 5 registros na tabela tb_categorias.
Insira 8 registros na tabela tb_pizzas, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.
Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.
Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica (Exemplo: Todas as pizzas que são doce).
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.

*/

CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
doce BOOLEAN NOT NULL,
inteira BOOLEAN NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO tb_categorias (doce,inteira)
VALUES (true,false);

INSERT INTO tb_categorias (doce,inteira)
VALUES (false,false);

INSERT INTO tb_categorias (doce,inteira)
VALUES (true,true);

INSERT INTO tb_categorias (doce,inteira)
VALUES (false, false);

INSERT INTO tb_categorias (doce,inteira)
VALUES (false, true);

SELECT * FROM tb_categorias;


CREATE TABLE tb_pizzas(
id bigint AUTO_INCREMENT,
sabor VARCHAR (255) NOT NULL,
borda VARCHAR(255) NOT NULL,
frete INT NOT NULL,
valor DECIMAL NOT NULL, -- sem frete

categorias_id BIGINT, 
PRIMARY KEY (id),
FOREIGN KEY (categorias_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_pizzas (sabor, borda, frete, valor, categorias_id)
VALUES ("Frango com mussarela e bacon", "catupiry", 7.00, 41.00, 2);

INSERT INTO tb_pizzas (sabor, borda, frete, valor, categorias_id)
VALUES ("Mussarela ", "Cheddar", 0.00, 35.00, 2);

INSERT INTO tb_pizzas (sabor, borda, frete, valor, categorias_id)
VALUES ("Romeu e Julieta", "Sem borda", 7.00, 45.00, 1);

INSERT INTO tb_pizzas (sabor, borda, frete, valor, categorias_id)
VALUES ("Brigadeiro", "Nutella", 21.00, 61.00, 1);

INSERT INTO tb_pizzas (sabor, borda, frete, valor, categorias_id)
VALUES ("Portuguesa", "catupiry", 0.00, 45.00, 2);

INSERT INTO tb_pizzas (sabor, borda, frete, valor, categorias_id)
VALUES ("Atum", "Sem borda", 0.00, 45.00, 2);

INSERT INTO tb_pizzas (sabor, borda, frete, valor, categorias_id)
VALUES ("M&M's", "Sem borda", 0.00, 49.00, 1);

INSERT INTO tb_pizzas (sabor, borda, frete, valor, categorias_id)
VALUES ("4 Queijos", "Mussarela", 14.00, 45.00, 2);

SELECT * FROM tb_pizzas;


SELECT * FROM tb_pizzas WHERE valor > 45;

SELECT * FROM tb_pizzas WHERE valor BETWEEN 50 and 100;

SELECT * FROM tb_pizzas WHERE sabor LIKE "%m%";


SELECT * FROM tb_pizzas 
	INNER JOIN tb_categorias ON tb_pizzas.categorias_id = tb_categorias.id;


SELECT * FROM tb_pizzas
	INNER JOIN tb_categorias ON tb_pizzas.categorias_id = tb_categorias.id WHERE tb_categorias.doce = true;

