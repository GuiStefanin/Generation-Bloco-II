
/*Crie um banco de dados para um serviço de um Games Online. O nome do Banco de dados deverá ter o seguinte nome db_generation_game_online. O sistema trabalhará com as informações dos personagens do jogo. O sistema trabalhará com 2 tabelas tb_personagens e tb_classes, que deverão estar relacionadas.

Boas Práticas:

Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os personagens do Game Online.
Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária, relevantes aos personagens do Game Online.
Não esqueça de criar a Foreign Key da tabela tb_classes na tabela tb_personagens.
Insira 5 registros na tabela tb_classes.
Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_classes.
Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.
Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/

CREATE DATABASE db_generation_game_online;

USE  db_generation_game_online;

CREATE TABLE tb_classes (
	id BIGINT(10) AUTO_INCREMENT,
    nome VARCHAR(255),
    habilidade VARCHAR(255),
    PRIMARY KEY (id)
);

SELECT * FROM tb_classes; 

CREATE TABLE tb_personagens (
	id  BIGINT(10) AUTO_INCREMENT,
    hp INT,
    nome VARCHAR(255),
    ataque INT,
    defesa INT,
    raca VARCHAR(255),
    classes_id BIGINT(10) NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (classes_id) REFERENCES tb_classes(id)
    );

SELECT * FROM tb_personagens;

INSERT INTO tb_classes (nome, habilidade) VALUES ("Mago","MaNA");
INSERT INTO tb_classes (nome, habilidade) VALUES ("Guerreiro","Combate");
INSERT INTO tb_classes (nome, habilidade) VALUES ("Arqueiro","Precisâo");
INSERT INTO tb_classes (nome, habilidade) VALUES ("Ladino","Furtividade");
INSERT INTO tb_classes (nome, habilidade) VALUES ("Barbaro","Furia");

INSERT INTO tb_personagens (hp, nome, ataque, defesa, raca, classes_id) VALUES (3000,"Paula Fernades",5000,3000,"anão",1);
INSERT INTO tb_personagens (hp, nome, ataque, defesa, raca, classes_id) VALUES (8000,"Gustavo Lima",800,1880,"humano",2);
INSERT INTO tb_personagens (hp, nome, ataque, defesa, raca, classes_id) VALUES (3000,"Roberto Carlos",600,800,"elfo",3);
INSERT INTO tb_personagens (hp, nome, ataque, defesa, raca, classes_id) VALUES (2500,"Ana Maria Braga",450,1760,"zumbi",4);
INSERT INTO tb_personagens (hp, nome, ataque, defesa, raca, classes_id) VALUES (7500,"Cersar Trali",760,1450,"troll",1);
INSERT INTO tb_personagens (hp, nome, ataque, defesa, raca, classes_id) VALUES (6000,"Willian Bonner",450,1300,"humano",5);
INSERT INTO tb_personagens (hp, nome, ataque, defesa, raca, classes_id) VALUES (6500,"Rebecca Andrade",500,1250,"humano",5);
INSERT INTO tb_personagens (hp, nome, ataque, defesa, raca, classes_id) VALUES (6800,"Claudia Leite",550,300,"humano",5);

SELECT * FROM tb_personagens WHERE ataque > 2000;
SELECT * FROM tb_personagens WHERE defesa > 1000 and defesa < 2000;
SELECT * FROM tb_personagens WHERE nome LIKE "%C%";

SELECT * FROM tb_personagens 
	INNER JOIN tb_classes on tb_classes.id = tb_personagens.id;
    
SELECT * FROM tb_classes
	INNER JOIN tb_personagens on tb_personagens.classes_id = tb_classes.id
	WHERE classes_id = 3;