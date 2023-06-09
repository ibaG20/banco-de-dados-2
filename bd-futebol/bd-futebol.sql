CREATE TABLE Equipe (
  id INTEGER CONSTRAINT pk_equipe PRIMARY KEY,
  nome VARCHAR(32)
);

CREATE SEQUENCE seq_equipe START WITH 1 INCREMENT BY 1;

INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Palmeiras');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Santos');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'SCCP');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'SPFC');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Flamengo');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Fluminense');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Vasco');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Botafogo');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Gremio');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Internacional');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Athletico PR');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Coritiba');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Atletico MG');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Cruzeiro');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Bahia');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Vitoria');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Sport');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Nautico');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Ponte Preta');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Guarani');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Portuguesa');
INSERT INTO equipe (id, nome) VALUES (NEXTVAL('seq_equipe'), 'Chapecoense');


CREATE TABLE campeonato (
  id INTEGER CONSTRAINT pk_campeonato PRIMARY KEY,
  nome VARCHAR(32)
);

CREATE SEQUENCE seq_campeonato START WITH 1 INCREMENT BY 1;

INSERT INTO campeonato (id, nome) VALUES (NEXTVAL('seq_campeonato'), 'Campeonato Brasileiro');
INSERT INTO campeonato (id, nome) VALUES (NEXTVAL('seq_campeonato'), 'Copa do Brasil');

CREATE TABLE jogador_brasileiro (
  id INTEGER,
  cpf VARCHAR(16),
  nome VARCHAR(32),
  posicao VARCHAR(16),
  id_equipe INTEGER,
  salario NUMERIC(9,2),
  CONSTRAINT pk_jogador_brasileiro PRIMARY KEY (id),
  CONSTRAINT un_jogador_brasileiro_cpf UNIQUE (cpf),
  CONSTRAINT fk_jogador_brasileiro_id_eq FOREIGN KEY(id_equipe)
    REFERENCES equipe(id),
  CONSTRAINT ck_jogador_brasileiro_posicao 
    CHECK (posicao IN ('Goleiro', 'Lateral', 'Zagueiro', 'Meio-Campo', 'Atacante'))
);


CREATE SEQUENCE seq_jogador START WITH 1 INCREMENT BY 1;

INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario) 
  VALUES (NEXTVAL('seq_jogador'), '111.222.333.44', 'Sao Marcos', 'Goleiro', 1, 350000.75);
INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario) 
  VALUES (NEXTVAL('seq_jogador'), '098.765.345.12', 'Neymar', 'Atacante', 2, 565000.50);
INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario)  
  VALUES (NEXTVAL('seq_jogador'), '045.456.555.12', 'Betao', 'Zagueiro', 3, 18000.00);
INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario) 
  VALUES (NEXTVAL('seq_jogador'), '235.457.789-65', 'Alex', 'Meio-Campo', 1, 310000.20);
INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario)  
  VALUES (NEXTVAL('seq_jogador'), '777.854.123-68', 'Marinho', 'Atacante', 2, 425000.00);
INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario)  
  VALUES (NEXTVAL('seq_jogador'), '159.487.236-00', 'Gilmar Fuba', 'Atacante', 3, 8500.00);
INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario)  
  VALUES (NEXTVAL('seq_jogador'), '457.148.230-00', 'Iranildo', 'Meio-Campo', null, 0);
INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario)  
  VALUES (NEXTVAL('seq_jogador'), '476.555.788-15', 'Odvan', 'Zagueiro', null, 0);

CREATE TABLE jogador_estrangeiro (
  id INTEGER,
  passaporte VARCHAR(16),
  nome VARCHAR(32),
  posicao VARCHAR(16),
  id_equipe INTEGER,
  pais_origem VARCHAR(16),
  salario NUMERIC(9,2),
  CONSTRAINT pk_jogador_estrangeiro PRIMARY KEY (id),
  CONSTRAINT ck_jogador_estrangeiro_passap UNIQUE (passaporte),
  CONSTRAINT fk_jogador_estrangeiro_id_eq FOREIGN KEY(id_equipe)
    REFERENCES Equipe(id)
);

INSERT INTO jogador_estrangeiro (id, passaporte, nome, posicao, id_equipe, pais_origem, salario) 
  VALUES (NEXTVAL('seq_jogador'), '586.324.111.44', 'Arce', 'Lateral', 1, 'Paraguai', 200500.10);
INSERT INTO jogador_estrangeiro (id, passaporte, nome, posicao, id_equipe, pais_origem, salario) 
  VALUES (NEXTVAL('seq_jogador'), '348.562.363.14', 'Mancuso', 'Atacante', 3, 'Argentina', 110000.75);
INSERT INTO jogador_estrangeiro (id, passaporte, nome, posicao, id_equipe, pais_origem, salario) 
  VALUES (NEXTVAL('seq_jogador'), '456.357.698.47', 'Gioino', 'Atacante', 3, 'Argentina', 15000);

CREATE TABLE equipe_campeonato (
  id_equipe INTEGER,
  id_campeonato INTEGER,
  posicao NUMERIC,
  CONSTRAINT pk_equipe_campeonato PRIMARY KEY (id_equipe, id_campeonato),
  CONSTRAINT fk_equipe_campeonato_id_equipe FOREIGN KEY (id_equipe)
    REFERENCES equipe(id),
  CONSTRAINT fk_equipe_campeonato_idCamp FOREIGN KEY (id_campeonato)
    REFERENCES campeonato(id),
  CONSTRAINT ck_equipe_campeonato_posicao CHECK (posicao > 0)
);

INSERT INTO equipe_campeonato (id_equipe, id_campeonato, posicao)
  VALUES (1, 1, 1);
INSERT INTO equipe_campeonato (id_equipe, id_campeonato, posicao)
  VALUES (2, 1, 16);
INSERT INTO equipe_campeonato (id_equipe, id_campeonato, posicao)
  VALUES (3, 1, 3);
INSERT INTO equipe_campeonato (id_equipe, id_campeonato, posicao)
  VALUES (4, 1, 8);

CREATE TABLE cidade (
  id INTEGER,
  nome VARCHAR(32),
  CONSTRAINT pk_cidade PRIMARY KEY (id),
  CONSTRAINT un_cidade_nome UNIQUE (nome)
);

CREATE SEQUENCE seq_cidade START WITH 1 INCREMENT BY 1;

INSERT INTO cidade (id, nome) VALUES (NEXTVAL('seq_cidade'), 'Sao Paulo');
INSERT INTO cidade (id, nome) VALUES (NEXTVAL('seq_cidade'), 'Rio de Janeiro');
INSERT INTO cidade (id, nome) VALUES (NEXTVAL('seq_cidade'), 'Belo Horizonte');
INSERT INTO cidade (id, nome) VALUES (NEXTVAL('seq_cidade'), 'Porto Alegre');
INSERT INTO cidade (id, nome) VALUES (NEXTVAL('seq_cidade'), 'Recife');

CREATE TABLE tecnico (
  id INTEGER,
  cpf VARCHAR(16),
  nome VARCHAR(32),
  id_equipe INTEGER,
  data_nasc DATE,
  CONSTRAINT pk_tecnico PRIMARY KEY (id),
  CONSTRAINT fk_tecnico_id_equipe FOREIGN KEY (id_equipe) 
    REFERENCES Equipe (id)
);


CREATE SEQUENCE seq_tecnico START WITH 1 INCREMENT BY 1;

INSERT INTO Tecnico (id, cpf, nome, id_equipe, data_nasc) 
  VALUES (NEXTVAL('seq_tecnico'), '123.654.875-90', 'Osvaldo Brandao', 1, TO_DATE('18-09-1916', 'dd-mm-yyyy'));
INSERT INTO Tecnico (id, cpf, nome, id_equipe, data_nasc) 
  VALUES (NEXTVAL('seq_tecnico'), '565.187.765-12', 'Vicente Feola', 2, TO_DATE('01/11/1909', 'dd/mm/yyyy'));
INSERT INTO Tecnico (id, cpf, nome, id_equipe, data_nasc)  
  VALUES (NEXTVAL('seq_tecnico'), '098.904.642-65', 'Tite', 3, TO_DATE('25/05/1961', 'dd/mm/yyyy'));
INSERT INTO Tecnico (id, cpf, nome, id_equipe, data_nasc) 
  VALUES (NEXTVAL('seq_tecnico'), '187.644.235-20', 'Tele Santana', 4, TO_DATE('26/07/1931', 'dd/mm/yyyy'));
INSERT INTO Tecnico (id, cpf, nome, id_equipe, data_nasc) 
  VALUES (NEXTVAL('seq_tecnico'), '145.687.789-14', 'Joel Santana', null, TO_DATE('25/12/1948', 'dd/mm/yyyy'));
INSERT INTO Tecnico (id, cpf, nome, id_equipe, data_nasc)  
  VALUES (NEXTVAL('seq_tecnico'), '546.654.456-08', 'Emerson Leao', null, TO_DATE('11/07/1949', 'dd/mm/yyyy'));
    
CREATE TABLE paises_tecnicos (
  id_tecnico INTEGER,
  pais VARCHAR(32),
  CONSTRAINT pk_paises_tecnicos PRIMARY KEY (id_tecnico, pais),
  CONSTRAINT fk_paises_tecnicos_id_tecnico FOREIGN KEY (id_tecnico)
    REFERENCES Tecnico(id)
);


INSERT INTO paises_tecnicos (id_tecnico, pais) VALUES (1, 'Brasil');
INSERT INTO paises_tecnicos (id_tecnico, pais) VALUES (1, 'Argentina');
INSERT INTO paises_tecnicos (id_tecnico, pais) VALUES (1, 'Uruguai');
INSERT INTO paises_tecnicos (id_tecnico, pais) VALUES (2, 'Brasil');
INSERT INTO paises_tecnicos (id_tecnico, pais) VALUES (3, 'Brasil');
INSERT INTO paises_tecnicos (id_tecnico, pais) VALUES (3, 'Emirados Arabes');
INSERT INTO paises_tecnicos (id_tecnico, pais) VALUES (4, 'Arabia Saudita');
INSERT INTO paises_tecnicos (id_tecnico, pais) VALUES (4, 'Brasil');
INSERT INTO paises_tecnicos (id_tecnico, pais) VALUES (5, 'Emirados Arabes');
INSERT INTO paises_tecnicos (id_tecnico, pais) VALUES (5, 'Japao');
INSERT INTO paises_tecnicos (id_tecnico, pais) VALUES (5, 'Africa do Sul');


CREATE TABLE jogo (
  id INTEGER,
  data_jogo DATE,
  id_equipe_casa INTEGER,
  id_equipe_fora INTEGER,
  gols_equipe_casa INTEGER,
  gols_equipe_fora INTEGER,
  id_cidade INTEGER,
  estadio VARCHAR(32),
  id_campeonato INTEGER,
  CONSTRAINT pk_jogo PRIMARY KEY (id),
  CONSTRAINT fk_jogo_equipe_casa FOREIGN KEY (id_equipe_casa)
    REFERENCES equipe (id),
  CONSTRAINT fk_jogo_equipe_fora FOREIGN KEY (id_equipe_fora)
    REFERENCES equipe (id),
  CONSTRAINT fk_jogo_cidade FOREIGN KEY (id_cidade)
    REFERENCES cidade (id),
  CONSTRAINT fk_jogo_campeonato FOREIGN KEY (id_campeonato)
    REFERENCES campeonato (id)
);

CREATE SEQUENCE seq_jogo START WITH 1 INCREMENT BY 1;

INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (NEXTVAL('seq_jogo'), TO_DATE('10/06/1994', 'dd/mm/yyyy'), 3, 1, 0, 2, 1, 'Itaquerao', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (NEXTVAL('seq_jogo'), TO_DATE('17/06/1994', 'dd/mm/yyyy'), 2, 4, 2, 2, 1, 'Vila Belmiro', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (NEXTVAL('seq_jogo'), TO_DATE('15/06/1994', 'dd/mm/yyyy'), 2, 3, 3, 2, 1, 'Morumbi', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (NEXTVAL('seq_jogo'), TO_DATE('10/07/1994', 'dd/mm/yyyy'), 5, 8, 2, 1, 2, 'Maracana', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (NEXTVAL('seq_jogo'), TO_DATE('11/06/1994', 'dd/mm/yyyy'), 6, 7, 4, 3, 3, 'Mineirao', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (NEXTVAL('seq_jogo'), TO_DATE('25/07/1994', 'dd/mm/yyyy'), 9, 10, 4, 0, 4, 'Beira Rio', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (NEXTVAL('seq_jogo'), TO_DATE('20/07/1994', 'dd/mm/yyyy'), 5, 3, 2, 1, 2, 'Maracana', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (NEXTVAL('seq_jogo'), TO_DATE('20/07/1994', 'dd/mm/yyyy'), 5, 7, 3, 1, 4, 'Beira Rio', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (NEXTVAL('seq_jogo'), TO_DATE('20/07/1994', 'dd/mm/yyyy'), 18, 20, 0, 2, 3, 'Mineirao', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (NEXTVAL('seq_jogo'), TO_DATE('29/07/1994', 'dd/mm/yyyy'), 6, 12, 2, 1, null, null, 1);
  
  

CREATE OR REPLACE VIEW ListaAtacantesBrasileiros AS
	SELECT * FROM jogador_brasileiro
		WHERE posicao like 'Atacante';
		
SELECT * FROM ListaAtacantesBrasileiros;

SELECT nome, cpf FROM ListaAtacantesBrasileiros
	WHERE salario > 200000;
	
	
CREATE OR REPLACE VIEW Jogadores AS
	SELECT nome, posicao, id_equipe, pais_origem, salario
		FROM jogador_estrangeiro
	UNION
	SELECT nome, posicao, id_equipe, 'Brasil', salario
		FROM jogador_brasileiro;
		
SELECT * FROM Jogadores;

INSERT INTO listaatacantesbrasileiros (id, cpf, nome, posicao, id_equipe, salario)
	VALUES (NEXTVAL('seq_jogador'), '987.654.345-89', 'Pato', 'Atacante', 4, 400000);
	
INSERT INTO listaatacantesbrasileiros (id, cpf, nome, posicao, id_equipe, salario)
	VALUES (NEXTVAL('seq_jogador'), '123.456.786-89', 'Breno', 'Zagueiro', 4, 17000);
	
CREATE OR REPLACE VIEW ListaAtacantesBrasileiros AS
	SELECT * FROM jogador_brasileiro
		WHERE posicao like 'Atacante'
		WITH LOCAL CHECK OPTION;
		
INSERT INTO listaatacantesbrasileiros (id, cpf, nome, posicao, id_equipe, salario) 
VALUES (NEXTVAL('seq_jogador'), '321.456.786-89', 'Breno', 'Atacante', 4, 17000);
	
ALTER VIEW listaatacantesbrasileiros RENAME TO listaatacantesbrasileirosstop;
DROP VIEW listaatacantesbrasileirosstop;
	


/*CREATE OR REPLACE VIEW MediaPorPosicao (posicao, mediaSalario) AS
	SELECT j.posicao, AVG(j.salario) 
		FROM jogadores*/
		
  CREATE TABLE funcionarios
  (
    codigo integer NOT NULL,
    nome_func character varying(100) NOT NULL,
    data_entrada date,
    profissao character varying(100) NOT NULL,
    salario real,
    CONSTRAINT funcionarios_pkey PRIMARY KEY (codigo)
  );


  INSERT INTO funcionarios(codigo, nome_func, data_entrada, profissao, salario) VALUES (1, 'Edson Dionisio', '2015-09-01', 'Desenvolvedor Web', 2000.00);
  INSERT INTO funcionarios(codigo, nome_func, data_entrada, profissao, salario) VALUES (2, 'Marília Késsia', '2013-02-01', 'Coordenadora', 5000.00);
  INSERT INTO funcionarios(codigo, nome_func, data_entrada, profissao, salario) VALUES (3, 'Caroline França', '2015-06-15', 'Estéticista', 2500.00);

  CREATE MATERIALIZED VIEW view_materializada_funcionario AS SELECT * FROM funcionarios WITH NO DATA;

  INSERT INTO funcionarios (codigo, nome_func, data_entrada, profissao) VALUES (5, 'Gustavo França', '2014-10-11', 'Estagiário');
  INSERT INTO funcionarios (codigo, nome_func, data_entrada, profissao) VALUES (6, 'Mayara Silva', '2015-06-10', 'Analista de testes');
  INSERT INTO funcionarios (codigo, nome_func, data_entrada, profissao) VALUES (7, 'João dos testes', '2011-01-01', 'Gerente de negócios');
  INSERT INTO funcionarios (codigo, nome_func, data_entrada, profissao) VALUES (8, 'Marina França', '2012-03-07', 'Analista de negócios');
  INSERT INTO funcionarios (codigo, nome_func, data_entrada, profissao) VALUES (9, 'Paulo Dionisio', '2013-07-07', 'DBA Sênior');  
   
  -- SELECT * FROM view_materializada_funcionario;

  REFRESH MATERIALIZED VIEW view_materializada_funcionario;

  SELECT * FROM view_materializada_funcionario;
  
  DROP MATERIALIZED VIEW view_materializada_funcionario;
  
  ----------------------------
  
  EXPLAIN ANALYSE SELECT nome, cpf FROM ListaAtacantesBrasileiros
	WHERE salario > 200000;
		
  CREATE INDEX ON jogador_brasileiro(salario);
  
  CREATE OR REPLACE FUNCTION mediaIndex()
  RETURNS NUMERIC AS $$
  	BEGIN
		
	END;
  $$ LANGUAGE 'plpgsql';
  
  
  
CREATE TEMPORARY TABLE temp_resultados (exec_time numeric);
  
INSERT INTO temp_resultados
SELECT (EXPLAIN ANALYZE SELECT * FROM minha_tabela).total_time
FROM generate_series(1, 10);

CREATE OR REPLACE FUNCTION media_execution_time() RETURNS numeric AS $$
DECLARE
    total numeric;
BEGIN
    SELECT AVG(exec_time) INTO total FROM temp_resultados;
    RETURN total;
END;
$$ LANGUAGE plpgsql;
  
  CREATE OR REPLACE FUNCTION media_execution_time(sql_command text) RETURNS numeric AS $$
DECLARE
    total numeric;
BEGIN
    CREATE TEMPORARY TABLE temp_resultados (exec_time numeric);
    FOR i IN 1..10 LOOP
        INSERT INTO temp_resultados SELECT (EXPLAIN ANALYZE EXECUTE sql_command).total_time;
    END LOOP;
    SELECT AVG(exec_time) INTO total FROM temp_resultados;
    DROP TABLE temp_resultados;
    RETURN total;
END;
$$ LANGUAGE plpgsql;

  
		
		
		