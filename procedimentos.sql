CREATE TABLE Produto
(
 cod_prod INT PRIMARY KEY,
 descricao VARCHAR(50) UNIQUE,
 qtde_disponivel INT NOT NULL DEFAULT 0
);

SELECT * FROM Produto;

----------------------------------------------------------------------------

INSERT INTO Produto VALUES (1, 'Feijão', 10);
INSERT INTO Produto VALUES (2, 'Arroz', 5);
INSERT INTO Produto VALUES (3, 'Macarrão', 15);
INSERT INTO Produto VALUES (4, 'Farinha', 25);
INSERT INTO Produto VALUES (5, 'Fubá', 7);
INSERT INTO Produto VALUES (6, 'Achocolatado', 10);
INSERT INTO Produto VALUES (7, 'Sal', 15);
INSERT INTO Produto VALUES (8, 'Açúcar', 10);
INSERT INTO Produto VALUES (9, 'Óleo', 30);


----------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE insereProduto(desc_prod varchar, qtde int) AS 
$$
	DECLARE	
		maximo int;
	BEGIN		
		SELECT MAX(cod_prod) FROM Produto INTO maximo;
		INSERT INTO Produto VALUES (maximo + 1, desc_prod, qtde);
	END;        
$$ LANGUAGE 'plpgsql';
CALL insereproduto('Batata', 30);

-- SELECT insereproduto('Batata', 30);

--- Sobrecarga de Função -  Mesmo nome porém assinaturas diferentes like POO


CREATE OR REPLACE FUNCTION insereProduto(qtde int, desc_prod varchar) 
RETURNS VOID AS 
$$
	DECLARE	
		maximo int;
	BEGIN		
		SELECT MAX(cod_prod) FROM Produto INTO maximo;
		INSERT INTO Produto VALUES (maximo + 1, desc_prod, qtde);
	END;        
$$ LANGUAGE 'plpgsql';

SELECT insereProduto(25,'Milho');

--- calcular fatorial de um número:
CREATE OR REPLACE FUNCTION fatorial(num int)
RETURNS int AS $$
	DECLARE 
		fat int;
	BEGIN
		IF num = 0 THEN
			fat = 1;
			RETURN fat;
		END IF;
		WHILE num > 1 LOOP
			fat = COALESCE(fat, 1) * num; ---> fat = num * (num - 1)
			num = num - 1;
		END LOOP;
		RETURN fat;
	END;
$$ LANGUAGE 'plpgsql';

SELECT * FROM fatorial(10);

CREATE OR REPLACE FUNCTION fatorial(num int)
RETURNS int AS $$
	DECLARE	
		fat int = 1;
	BEGIN
		IF num = 0 THEN	
			fat = 1;
			RETURN fat;
		END IF;
		FOR i IN 2..num LOOP
			fat := fat * i;
		END LOOP;
		RETURN fat;
	END;
$$ LANGUAGE 'plpgsql';
	
	
	
	