CREATE TABLE Equipe (
  id INTEGER CONSTRAINT pk_equipe PRIMARY KEY,
  nome VARCHAR(32)
);

CREATE SEQUENCE seq_equipe START WITH 1 INCREMENT BY 1;

INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Palmeiras');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Santos');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'SCCP');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'SPFC');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Flamengo');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Fluminense');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Vasco');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Botafogo');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Gremio');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Internacional');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Athletico PR');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Coritiba');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Atletico MG');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Cruzeiro');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Bahia');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Vitoria');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Sport');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Nautico');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Ponte Preta');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Guarani');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Portuguesa');
INSERT INTO equipe (id, nome) VALUES (seq_equipe.NEXTVAL, 'Chapecoense');


CREATE TABLE campeonato (
  id INTEGER CONSTRAINT pk_campeonato PRIMARY KEY,
  nome VARCHAR(32)
);

CREATE SEQUENCE seq_campeonato START WITH 1 INCREMENT BY 1;

INSERT INTO campeonato (id, nome) VALUES (seq_campeonato.NEXTVAL, 'Campeonato Brasileiro');
INSERT INTO campeonato (id, nome) VALUES (seq_campeonato.NEXTVAL, 'Copa do Brasil');

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
  VALUES (seq_jogador.NEXTVAL, '111.222.333.44', 'Sao Marcos', 'Goleiro', 1, 350000.75);
INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario) 
  VALUES (seq_jogador.NEXTVAL, '098.765.345.12', 'Neymar', 'Atacante', 2, 565000.50);
INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario)  
  VALUES (seq_jogador.NEXTVAL, '045.456.555.12', 'Betao', 'Zagueiro', 3, 18000.00);
INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario) 
  VALUES (seq_jogador.NEXTVAL, '235.457.789-65', 'Alex', 'Meio-Campo', 1, 310000.20);
INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario)  
  VALUES (seq_jogador.NEXTVAL, '777.854.123-68', 'Marinho', 'Atacante', 2, 425000.00);
INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario)  
  VALUES (seq_jogador.NEXTVAL, '159.487.236-00', 'Gilmar Fuba', 'Atacante', 3, 8500.00);
INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario)  
  VALUES (seq_jogador.NEXTVAL, '457.148.230-00', 'Iranildo', 'Meio-Campo', null, 0);
INSERT INTO jogador_brasileiro (id, cpf, nome, posicao, id_equipe, salario)  
  VALUES (seq_jogador.NEXTVAL, '476.555.788-15', 'Odvan', 'Zagueiro', null, 0);

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
  VALUES (seq_jogador.NEXTVAL, '586.324.111.44', 'Arce', 'Lateral', 1, 'Paraguai', 200500.10);
INSERT INTO jogador_estrangeiro (id, passaporte, nome, posicao, id_equipe, pais_origem, salario) 
  VALUES (seq_jogador.NEXTVAL, '348.562.363.14', 'Mancuso', 'Atacante', 3, 'Argentina', 110000.75);
INSERT INTO jogador_estrangeiro (id, passaporte, nome, posicao, id_equipe, pais_origem, salario) 
  VALUES (seq_jogador.NEXTVAL, '456.357.698.47', 'Gioino', 'Atacante', 3, 'Argentina', 15000);

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

INSERT INTO cidade (id, nome) VALUES (seq_cidade.NEXTVAL, 'Sao Paulo');
INSERT INTO cidade (id, nome) VALUES (seq_cidade.NEXTVAL, 'Rio de Janeiro');
INSERT INTO cidade (id, nome) VALUES (seq_cidade.NEXTVAL, 'Belo Horizonte');
INSERT INTO cidade (id, nome) VALUES (seq_cidade.NEXTVAL, 'Porto Alegre');
INSERT INTO cidade (id, nome) VALUES (seq_cidade.NEXTVAL, 'Recife');

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
  VALUES (seq_tecnico.NEXTVAL, '123.654.875-90', 'Osvaldo Brandao', 1, TO_DATE('18-09-1916', 'dd-mm-yyyy'));
INSERT INTO Tecnico (id, cpf, nome, id_equipe, data_nasc) 
  VALUES (seq_tecnico.NEXTVAL, '565.187.765-12', 'Vicente Feola', 2, TO_DATE('01/11/1909', 'dd/mm/yyyy'));
INSERT INTO Tecnico (id, cpf, nome, id_equipe, data_nasc)  
  VALUES (seq_tecnico.NEXTVAL, '098.904.642-65', 'Tite', 3, TO_DATE('25/05/1961', 'dd/mm/yyyy'));
INSERT INTO Tecnico (id, cpf, nome, id_equipe, data_nasc) 
  VALUES (seq_tecnico.NEXTVAL, '187.644.235-20', 'Tele Santana', 4, TO_DATE('26/07/1931', 'dd/mm/yyyy'));
INSERT INTO Tecnico (id, cpf, nome, id_equipe, data_nasc) 
  VALUES (seq_tecnico.NEXTVAL, '145.687.789-14', 'Joel Santana', null, TO_DATE('25/12/1948', 'dd/mm/yyyy'));
INSERT INTO Tecnico (id, cpf, nome, id_equipe, data_nasc)  
  VALUES (seq_tecnico.NEXTVAL, '546.654.456-08', 'Emerson Leao', null, TO_DATE('11/07/1949', 'dd/mm/yyyy'));
    
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
  VALUES (seq_jogo.NEXTVAL, TO_DATE('10/06/1994', 'dd/mm/yyyy'), 3, 1, 0, 2, 1, 'Itaquerao', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (seq_jogo.NEXTVAL, TO_DATE('17/06/1994', 'dd/mm/yyyy'), 2, 4, 2, 2, 1, 'Vila Belmiro', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (seq_jogo.NEXTVAL, TO_DATE('15/06/1994', 'dd/mm/yyyy'), 2, 3, 3, 2, 1, 'Morumbi', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (seq_jogo.NEXTVAL, TO_DATE('10/07/1994', 'dd/mm/yyyy'), 5, 8, 2, 1, 2, 'Maracana', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (seq_jogo.NEXTVAL, TO_DATE('11/06/1994', 'dd/mm/yyyy'), 6, 7, 4, 3, 3, 'Mineirao', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (seq_jogo.NEXTVAL, TO_DATE('25/07/1994', 'dd/mm/yyyy'), 9, 10, 4, 0, 4, 'Beira Rio', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (seq_jogo.NEXTVAL, TO_DATE('20/07/1994', 'dd/mm/yyyy'), 5, 3, 2, 1, 2, 'Maracana', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (seq_jogo.NEXTVAL, TO_DATE('20/07/1994', 'dd/mm/yyyy'), 5, 7, 3, 1, 4, 'Beira Rio', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (seq_jogo.NEXTVAL, TO_DATE('20/07/1994', 'dd/mm/yyyy'), 18, 20, 0, 2, 3, 'Mineirao', 1);
INSERT INTO jogo (id, data_jogo, id_equipe_casa, id_equipe_fora, 
                gols_equipe_casa, gols_equipe_fora, id_cidade, estadio, id_campeonato)
  VALUES (seq_jogo.NEXTVAL, TO_DATE('29/07/1994', 'dd/mm/yyyy'), 6, 12, 2, 1, null, null, 1);