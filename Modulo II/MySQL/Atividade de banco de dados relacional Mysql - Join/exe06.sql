/*Crie um banco de dados para uma plataforma de Cursos Online (EAD). O nome do Banco de dados deverá ter o seguinte nome db_curso_da_minha_vida. O sistema trabalhará com as informações dos produtos comercializados pela empresa. O sistema trabalhará com 2 tabelas tb_cursos e tb_categorias, que deverão estar relacionadas.

Boas Práticas:

Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.
Crie a tabela tb_cursos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_cursos.
Insira 5 registros na tabela tb_categorias.
Insira 8 registros na tabela tb_cursos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
Faça um SELECT que retorne todes os cursos cujo valor seja maior do que R$ 500,00.
Faça um SELECT que retorne todes os cursos cujo valor esteja no intervalo R$ 600,00 e R$ 1000,00.
Faça um SELECT utilizando o operador LIKE, buscando todes os cursos que possuam a letra J no atributo nome.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os cursos que pertencem a categoria Java).
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/

CREATE DATABASE  db_curso_da_minha_vida;

USE  db_curso_da_minha_vida;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
bolsa BOOLEAN NOT NULL,
periodo VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO tb_categorias (bolsa, periodo)
VALUES (true,"Integral");

INSERT INTO tb_categorias (bolsa, periodo)
VALUES (true,"Noturno");

INSERT INTO tb_categorias (bolsa, periodo)
VALUES (true,"Matutino");

INSERT INTO tb_categorias (bolsa, periodo)
VALUES (false,"Noturno");

INSERT INTO tb_categorias (bolsa, periodo)
VALUES (false,"Matutino");

SELECT * FROM tb_categorias;

CREATE TABLE tb_cursos(
id BIGINT AUTO_INCREMENT,
nome varchar(255) NOT NULL,
duracao INT NOT NULL, -- em semestres
areaDoConhecimento varchar(255) NOT NULL,
valor INT NOT NULL, -- por mês


categorias_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categorias_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_cursos (nome, duracao, areaDoConhecimento, valor, categorias_id)
VALUES ("Administração", 8, "Humanas", 650.00 , 2);

INSERT INTO tb_cursos (nome, duracao, areaDoConhecimento, valor, categorias_id)
VALUES ("Biologia", 10, "Biologicas", 850.00 , 1);

INSERT INTO tb_cursos (nome, duracao, areaDoConhecimento, valor, categorias_id)
VALUES ("Matematica", 7, "Exatas", 730.00 , 3);

INSERT INTO tb_cursos (nome, duracao, areaDoConhecimento, valor, categorias_id)
VALUES ("Física", 7, "Exatas", 1200.00 , 4);

INSERT INTO tb_cursos (nome, duracao, areaDoConhecimento, valor, categorias_id)
VALUES ("Letras", 8, "Humanas", 870.00 , 5);

INSERT INTO tb_cursos (nome, duracao, areaDoConhecimento, valor, categorias_id)
VALUES ("Educação Física", 9, "Biologicas", 230.00 , 3);

INSERT INTO tb_cursos (nome, duracao, areaDoConhecimento, valor, categorias_id)
VALUES ("Medicina", 12, "Biologicas", 12000.00 , 5);

INSERT INTO tb_cursos (nome, duracao, areaDoConhecimento, valor, categorias_id)
VALUES ("Engenharias de Produção", 10, "Exatas", 1200.00 , 2);

SELECT * FROM tb_cursos;

SELECT * FROM tb_cursos WHERE valor >500;

SELECT * FROM tb_cursos WHERE valor BETWEEN 600 and 1000;

SELECT * FROM tb_cursos WHERE nome LIKE "%j%";

SELECT * FROM tb_cursos 
	INNER JOIN tb_categorias ON tb_cursos.categorias_id = tb_categorias.id;

SELECT * FROM tb_cursos
	INNER JOIN tb_categorias ON tb_cursos.categorias_id = tb_categorias.id WHERE tb_categorias.bolsa=true;