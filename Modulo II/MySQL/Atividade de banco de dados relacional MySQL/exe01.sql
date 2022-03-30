/* ATIVIDADE 01

Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema trabalhará com as informações dos colaboradores desta empresa. 
Crie uma tabela de colaboradores e determine 5 atributos relevantes dos colaboradores para se trabalhar com o serviço deste RH.
Insira nesta tabela no mínimo 5 dados (registros).
Faça um SELECT que retorne todes os colaboradores com o salário maior do que 2000.
Faça um SELECT que retorne todes os colaboradores com o salário menor do que 2000.
Ao término atualize um registro desta tabela através de uma query de atualização.
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/

CREATE DATABASE db_rh;

USE  db_rh;

CREATE TABLE tb_colaboradores (
	id BIGINT(10) AUTO_INCREMENT,
    nome VARCHAR(255),
    registro INT,
    salario DECIMAL,
	primeiroEmprego BOOLEAN,
    tempoDeServico INT, -- EM MESES
    PRIMARY KEY (id)
);

SELECT * FROM tb_colaboradores; 
	
INSERT INTO tb_colaboradores (nome, registro, salario, primeiroEmprego, tempoDeServico) values ( "Renato Augusto", 8, 2000, false, 8);
INSERT INTO tb_colaboradores (nome, registro, salario, primeiroEmprego, tempoDeServico) values ( "Luan", 7, 700000, false, 27);
INSERT INTO tb_colaboradores (nome, registro, salario, primeiroEmprego, tempoDeServico) values("João Vitor", 33, 1500, true, 15);
INSERT INTO tb_colaboradores (nome, registro, salario, primeiroEmprego, tempoDeServico) values("Cassio",12,10000,false,250);
INSERT INTO tb_colaboradores (nome, registro, salario, primeiroEmprego, tempoDeServico) values("Du Queiroz", 37, 500, true, 10);

SELECT * FROM tb_colaboradores WHERE salario > 2000;

SELECT * FROM tb_colaboradores WHERE salario < 2000;


