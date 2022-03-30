/*Atividade 2

Crie um banco de dados para um e-commerce, onde o sistema trabalhará com as informações dos produtos deste e-commerce. 
Crie uma tabela de produtos e determine 5 atributos relevantes dos produtos para se trabalhar com o serviço deste e-commerce.
Insira nesta tabela no mínimo 8 dados (registros).
Faça um SELECT que retorne todes os produtos com o valor maior do que 500.
Faça um SELECT que retorne todes os produtos com o valor menor do que 500.
Ao término atualize um registro desta tabela através de uma query de atualização.
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/

CREATE DATABASE db_ecommerce;

USE  db_ecommerce;

CREATE TABLE tb_produtos (
	id BIGINT(10) AUTO_INCREMENT,
    nome VARCHAR(255),
    qtd INT,
    preco DECIMAL,
	importado BOOLEAN,
    frete DECIMAL, 
    PRIMARY KEY (id)
);

SELECT * FROM tb_produtos; 
	
INSERT INTO tb_produtos (nome, qtd, preco, importado, frete) values ( "Computador", 53, 10000, true, 78.50);
INSERT INTO tb_produtos (nome, qtd, preco, importado, frete) values ( "Cadeira", 128, 999.99, false, 0);
INSERT INTO tb_produtos (nome, qtd, preco, importado, frete) values ( "Camisa", 5000, 35.89, false, 0);
INSERT INTO tb_produtos (nome, qtd, preco, importado, frete) values ( "Livro", 29, 100, false, 0);
INSERT INTO tb_produtos (nome, qtd, preco, importado, frete) values ( "Moto", 12, 27000, true, 3078.78);
INSERT INTO tb_produtos (nome, qtd, preco, importado, frete) values ( "Carro", 2, 100000, true, 10000);
INSERT INTO tb_produtos (nome, qtd, preco, importado, frete) values ( "Suco de Laranja", 98, 12, false, 0);
INSERT INTO tb_produtos (nome, qtd, preco, importado, frete) values ( "Diamante", 1, 1000000, false, 0);

SELECT * FROM tb_produtos WHERE preco > 500;

SELECT * FROM tb_produtos WHERE preco < 500;