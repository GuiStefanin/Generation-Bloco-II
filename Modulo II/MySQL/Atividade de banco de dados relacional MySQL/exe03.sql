/*Atividade 3

Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as informações dos estudantes deste registro dessa escola. 
Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos relevantes dos estudantes para se trabalhar com o serviço dessa escola.
Insira nesta tabela no mínimo 8 dados (registros).
Faça um SELECT que retorne todes o/a(s) estudantes com a nota maior do que 7.0.
Faça um SELECT que retorne todes o/a(s) estudantes com a nota menor do que 7.0.
Ao término atualize um registro desta tabela através de uma query de atualização.
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/

CREATE DATABASE db_escola;

USE  db_escola;

CREATE TABLE tb_estudantes (
	id BIGINT(10) AUTO_INCREMENT,
    nome VARCHAR(255),
    resgistro INT,
    media DECIMAL,
	aprovado BOOLEAN,
    faltas INT, 
    PRIMARY KEY (id)
);

SELECT * FROM tb_estudantes; 
	
INSERT INTO tb_estudantes (nome, registro, media, aprovado, faltas) values ( "Sylvinho", 4141, 5.0, false, 50);
INSERT INTO tb_estudantes (nome, registro, media, aprovado, faltas) values ( "Lucas Piton", 4638, 7.6, true, 12);
INSERT INTO tb_estudantes (nome, registro, media, aprovado, faltas) values ( "Giuliano", 4653, 10, true, 11);
INSERT INTO tb_estudantes (nome, registro, media, aprovado, faltas) values ( "Willian", 4178, 10, true, 0);
INSERT INTO tb_estudantes (nome, registro, media, aprovado, faltas) values ( "Gil", 4871, 8.4, true, 22);
INSERT INTO tb_estudantes (nome, registro, media, aprovado, faltas) values ( "Fagner", 4178,9.4, false, 1000);
INSERT INTO tb_estudantes (nome, registro, media, aprovado, faltas) values ( "Roger Guedes", 4900, 6.0, true, 123);
INSERT INTO tb_estudantes (nome, registro, media, aprovado, faltas) values ( "Cavani", 4000, 9.2, true, 45);

SELECT * FROM tb_estudantes WHERE media > 7.0;

SELECT * FROM tb_estudantes WHERE media < 7.0;

ALTER TABLE tb_estudantes 
CHANGE resgistro registro int; -- usei pois cometi um erro de grafia 