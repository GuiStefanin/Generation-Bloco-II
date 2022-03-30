/*Crie um banco de dados para um serviço de uma loja de Material de Construção. O nome do Banco de dados deverá ter o seguinte nome db_construindo_vidas. O sistema trabalhará com as informações dos produtos comercializados pela empresa. O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, que deverão estar relacionadas.

Boas Práticas:

Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.
Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
Insira 5 registros na tabela tb_categorias.
Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 100,00.
Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00.
Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria hidráulica).
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/

CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
acabamento BOOLEAN NOT NULL,
material VARCHAR(255),

PRIMARY KEY (id)
);

INSERT INTO tb_categorias (acabamento,material)
VALUES (true,"Madeira");

INSERT INTO tb_categorias (acabamento,material)
VALUES (true,"Cerâmica");

INSERT INTO tb_categorias (acabamento,material)
VALUES (false,"Concreto");

INSERT INTO tb_categorias (acabamento,material)
VALUES (false,"Madeira");

INSERT INTO tb_categorias (acabamento,material)
VALUES (true,"Alumínio");

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
massa VARCHAR(255) NOT NULL,  -- Em kg
frete INT NOT NULL,
valor INT NOT NULL,

categorias_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categorias_id) REFERENCES tb_categorias(id)
);


INSERT INTO tb_produtos (nome, massa, frete, valor, categorias_id)
VALUES ("Bloco",15,16.00 ,40.00 , 3);

INSERT INTO tb_produtos (nome, massa, frete, valor, categorias_id)
VALUES ("Telha",20,0.00 ,40.00 , 2);

INSERT INTO tb_produtos (nome, massa, frete, valor, categorias_id)
VALUES ("Bloco",15,16.00 ,40.00 , 3);

INSERT INTO tb_produtos (nome, massa, frete, valor, categorias_id)
VALUES ("Bloco",25,45.00 ,80.00 , 2);

INSERT INTO tb_produtos (nome, massa, frete, valor, categorias_id)
VALUES ("Porta",2,175.00 ,0.00 , 1);

INSERT INTO tb_produtos (nome, massa, frete, valor, categorias_id)
VALUES ("Janela",3,85.00 ,10.00 , 5);

INSERT INTO tb_produtos (nome, massa, frete, valor, categorias_id)
VALUES ("Calha",8,11.00 ,4.00 , 4);

INSERT INTO tb_produtos (nome, massa, frete, valor, categorias_id)
VALUES ("Piso",7,17.00 ,0.00 , 3);


SELECT * FROM tb_produtos;

SELECT * FROM tb_produto WHERE valor >100;

SELECT * FROM tb_produtos WHERE valor BETWEEN 70 and 150;

SELECT * FROM tb_produtos WHERE nome LIKE "%c%";


SELECT * FROM tb_produtos 
	INNER JOIN tb_categorias ON tb_produtos.categorias_id = tb_categorias.id;

SELECT * FROM tb_produtos 	
	INNER JOIN tb_categorias ON tb_produtos.categorias_id = tb_categorias.id WHERE tb_categorias.acabamento=true;