/*Crie um banco de dados para um serviço de uma Farmácia. O nome do Banco de dados deverá ter o seguinte nome db_farmacia_bem_estar. O sistema trabalhará com as informações dos produtos comercializados pela empresa. O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, que deverão estar relacionadas.

Boas Práticas:

Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.
Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
Insira 5 registros na tabela tb_categorias.
Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.
Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria cosméticos).
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/

CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
manipulado BOOLEAN NOT NULL,
tarja varchar(255),
PRIMARY KEY (id)
);

INSERT INTO tb_categorias (manipulado,tarja)
VALUES (false, "Preta");

INSERT INTO tb_categorias (manipulado,tarja)
VALUES (false, "Vermelha");

INSERT INTO tb_categorias (manipulado,tarja)
VALUES (true, "Amarela");

INSERT INTO tb_categorias (manipulado,tarja)
VALUES (false, "Amaralea");

INSERT INTO tb_categorias (manipulado,tarja)
VALUES (false, "Vermelha");

SELECT * FROM tb_categorias;


CREATE TABLE tb_produtos(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
massa INT, -- em mg
valor INT NOT NULL,

categorias_id BIGINT, 
PRIMARY KEY (id),
FOREIGN KEY (categorias_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_produtos (nome, massa, valor, categorias_id)
VALUES ("Omeprazol", 500, 12.99, 4);

INSERT INTO tb_produtos (nome, massa, valor, categorias_id)
VALUES ("Gardenal", 250, 40.99, 3);

INSERT INTO tb_produtos (nome, massa, valor, categorias_id)
VALUES ("Dorflex", 124, 19.99, 2);

INSERT INTO tb_produtos (nome, massa, valor, categorias_id)
VALUES ("Estomazil", 200, 7.99, 1);

INSERT INTO tb_produtos (nome, massa, valor, categorias_id)
VALUES ("Neusodina", 100, 9.99, 5);

INSERT INTO tb_produtos (nome, massa, valor, categorias_id)
VALUES ("Doril", 300, 14.99, 1);

INSERT INTO tb_produtos (nome, massa, valor, categorias_id)
VALUES ("Eno", 600, 49.99, 4);

INSERT INTO tb_produtos (nome, massa, valor, categorias_id)
VALUES ("Tempo", 500, 99.99, 4);

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE valor > 50;

SELECT * FROM tb_produtos WHERE valor BETWEEN 5 AND 60;

SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT * FROM tb_produtos 
	INNER JOIN tb_categorias ON tb_produtos.categorias_id = tb_categorias.id;
    
SELECT * FROM tb_produtos
	INNER JOIN tb_categorias ON tb_produtos.categorias_id = tb_categorias.id WHERE tb_categorias.manipulado = true; -- Apenas produtos manipulados.



