create table professor(
	id INTEGER PRIMARY KEY,
	nome VARCHAR(100),
	dt_nasc VARCHAR(20),
	salario numeric
);

SELECT * FROM professor;

-- Criação da Função

CREATE OR REPLACE FUNCTION addPProfessor(id INTEGER, nome varchar, dt_nasc varchar, salario numeric)
RETURNS VOID AS $$
	DECLARE	 
	BEGIN	
         INSERT INTO PROFESSOR VALUES(id, nome, dt_nasc, salario);
	END;
$$ LANGUAGE 'plpgsql';

-- Testando a função

SELECT addPProfessor(13, 'Erinaldo Pereira', '17/10/1985', 3000);

CREATE OR REPLACE FUNCTION mediaSalarial()
RETURNS NUMERIC AS $$
	DECLARE 
		valor NUMERIC;
		quantidadeProf INTEGER;
	BEGIN
		valor := (SELECT SUM(salario) FROM professor);
		quantidadeProf := (SELECT COUNT(*) FROM professor);
		RETURN valor/quantidadeProf;
	END;
$$ LANGUAGE 'plpgsql';

SELECT mediaSalarial();

CREATE OR REPLACE FUNCTION func_prof()



CREATE OR REPLACE FUNCTION min_avg_max(OUT min_ NUMERIC, OUT avg_ NUMERIC, OUT max_ NUMERIC)
RETURNS record AS $$
	BEGIN
		min_ := (SELECT MIN(salario) FROM professor);
		avg_ := (SELECT ROUND(AVG(salario), 2) FROM professor);
		max_ := (SELECT MAX(salario) FROM professor);
	END;
$$ LANGUAGE 'plpgsql';

SELECT * FROM min_avg_max();




insert into professor values (18,'Raul Seixas', '02/02/1978',12150.34);
insert into professor values (2, 'Gil Gomes', '01/04/1962',8642.60);
insert into professor values (3, 'Renata Costa', '02/05/1988',1250.30);
insert into professor values (4,'Renato Gil', '01/01/1997',998.00);
insert into professor values (5,'Pedro Silva', '03/05/2001',3500);
insert into professor values (6,'Raquel Souza', '29/10/1996',2400);
insert into professor values (7, 'Borges Bento', '11/11/1990',6700.34);
insert into professor values (8, 'Harry Potter', '01/04/1998',998);
insert into professor values (9, 'Adélia Moura', '01/12/1986',12150.34);
insert into professor values (10, 'Jimmy Page', '03/05/2001',1200);
insert into professor values (11, 'Marco Aurélio', '03/12/2000',998);
insert into professor values (12, 'Helena Silva', '02/01/1997',998);
insert into professor values (19, 'Fábio Duarte', '29/10/1995',3200);
insert into professor values (14, 'Mata Rocha', '03/12/2001',3570);
insert into professor values (15, 'Maria Carla', '02/01/1997',1998);
insert into professor values (16, 'Renato Feliz', '01/07/2001',6789.34);
insert into professor values (17, 'Lucas Sávio', '29/10/2000',3410);