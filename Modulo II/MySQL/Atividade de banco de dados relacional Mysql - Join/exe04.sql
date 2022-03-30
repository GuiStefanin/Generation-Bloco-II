/*Crie um banco de dados para um serviço de um Açougue ou de um Hortifruti. O nome do Banco de dados deverá ter o seguinte nome db_cidade_das_carnes ou cidade_dos_vegetais. O sistema trabalhará com as informações dos produtos comercializados pela empresa. O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, que deverão estar relacionadas.

Boas Práticas:

Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.
Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
Insira 5 registros na tabela tb_categorias.
Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00.
Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria aves ou frutas).
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/

CREATE DATABASE db_cidade_dos_vegetais;

USE db_cidade_dos_vegetais;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
agrotoxico BOOLEAN NOT NULL,
cultivo VARCHAR(255),
PRIMARY KEY (id)
);

INSERT INTO tb_categorias (agrotoxico,cultivo)
VALUES (false,"Organico");

INSERT INTO tb_categorias (agrotoxico,cultivo)
VALUES (false,"Hidroponico");

INSERT INTO tb_categorias (agrotoxico,cultivo)
VALUES (false,"Convencional");

INSERT INTO tb_categorias (agrotoxico,cultivo)
VALUES (true,"Hidroponico");

INSERT INTO tb_categorias (agrotoxico,cultivo)
VALUES (true,"Convencional");

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
massa INT NOT NULL,  -- Em kg
tipo VARCHAR(255) NOT NULL,
valor INT NOT NULL,


categoriaS_id BIGINT, 
PRIMARY KEY (id),
FOREIGN KEY (categorias_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_produtos (nome, massa, tipo, valor, categorias_id)
VALUES ("Alface", 0.2, "Verdura",2.99 , 1);

INSERT INTO tb_produtos (nome, massa, tipo, valor, categorias_id)
VALUES ("Laranja", 2, "Fruta", 9.99 , 3);

INSERT INTO tb_produtos (nome, massa, tipo, valor, categorias_id)
VALUES ("Mandioquinha",1.2,"Legume", 12.99 , 2);

INSERT INTO tb_produtos (nome, massa, tipo, valor, categorias_id)
VALUES ("Maracujá", 1.8, "Fruta", 9.99 , 3);

INSERT INTO tb_produtos (nome, massa, tipo, valor, categorias_id)
VALUES ("Abóbora", 4, "Legume", 12.35 , 4);

INSERT INTO tb_produtos (nome, massa, tipo, valor, categorias_id)
VALUES ("Abóbora", 4, "Legume", 12.35 , 4);

INSERT INTO tb_produtos (nome, massa, tipo, valor, categorias_id)
VALUES ("Cenoura", 7, "Legume", 16.50 , 5);

INSERT INTO tb_produtos (nome, massa, tipo, valor, categorias_id)
VALUES ("Brócolis", 2.5, "Verdura", 7.00 , 3);

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE valor >50;

SELECT * FROM tb_produtos WHERE valor BETWEEN 50 and 150;

SELECT * FROM tb_produtos WHERE nome LIKE "%c%";


SELECT * FROM tb_produtos 
	INNER JOIN tb_categorias ON tb_produtos.categorias_id = tb_categorias.id;

SELECT * FROM tb_produtos 
	INNER JOIN tb_categorias ON tb_produtos.categorias_id = tb_categorias.id WHERE tb_categorias.agrotoxico= false; -- Produtos sem Agrtoxico