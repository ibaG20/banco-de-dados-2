CREATE OR REPLACE FUNCTION ola_mundo()
RETURNS VOID AS $$
	DECLARE
		--variavel tipo;
		
	BEGIN
		RAISE NOTICE 'ola mundo';
	END;
	
	$$ LANGUAGE 'plpgsql';
	
SELECT ola_mundo();

DROP FUNCTION ola_mundo();

-- --------------

CREATE OR REPLACE FUNCTION func_escopo() RETURNS integer AS $$
DECLARE
	quantidade integer := 30;
BEGIN
	RAISE NOTICE 'Aqui a quantidade é %', quantidade;
	quantidade := 50;
	
		-- inicio de sub-bloco
		DECLARE	
			quantidade integer := 80;
		BEGIN
			RAISE NOTICE 'Aqui a quantidade é %', quantidade;
		END;
		-- fim sub-bloco
		
	RAISE NOTICE 'Aqui a quantidade é %', quantidade;
	RETURN quantidade;
END;
$$ LANGUAGE plpgsql;

SELECT func_escopo();

-- ---------------

CREATE OR REPLACE FUNCTION hi_lo (
	a NUMERIC,
	b NUMERIC,
	c NUMERIC,
		OUT hi NUMERIC,
	OUT lo NUMERIC)
AS $$
BEGIN
	hi := GREATEST(a, b, c);
	lo := LEAST(a, b, c);
END; $$

LANGUAGE plpgsql;

SELECT * FROM hi_lo(2, 5, 1);
		
		
		
		
		