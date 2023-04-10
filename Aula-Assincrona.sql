-- QUESTÃO 21 -------------------------------------------

CREATE TABLE Peça (
  CodPeça INT NOT NULL,
  NomePeça VARCHAR(50),
  CorPeça VARCHAR(20),
  PesoPeça FLOAT,
  PRIMARY KEY (CodPeça)
);

CREATE TABLE Fornecedor (
  CodFornecedor INT NOT NULL,
  NomeFornecedor VARCHAR(50),
  StatusFornecedor VARCHAR(20),
  PRIMARY KEY (CodFornecedor)
);

CREATE TABLE Embarque (
  CodPeça INT NOT NULL,
  CodFornecedor INT NOT NULL,
  QuantidadeEmbarque INT,
  FOREIGN KEY (CodPeça) REFERENCES Peça(CodPeça),
  FOREIGN KEY (CodFornecedor) REFERENCES Fornecedor(CodFornecedor)
);

SELECT * FROM Peça;
SELECT * FROM Fornecedor;
SELECT * FROM Embarque;


INSERT INTO Peça (CodPeça, NomePeça, CorPeça, PesoPeça)
VALUES (1, 'Peça 1', 'Azul', 2.5),
       (2, 'Peça 2', 'Vermelho', 1.8),
       (3, 'Peça 3', 'Verde', 3.2),
       (4, 'Peça 4', 'Amarelo', 1.5),
       (5, 'Peça 5', 'Preto', 4.0),
	   (6, 'Peça 6', 'Branco', 2.1),
       (7, 'Peça 7', 'Vermelho', 3.5),
       (8, 'Peça 8', 'Preto', 4.2),
       (9, 'Peça 9', 'Verde', 1.9),
       (10, 'Peça 10', 'Azul', 3.7),
       (11, 'Peça 11', 'Amarelo', 2.8),
       (12, 'Peça 12', 'Cinza', 2.2),
       (13, 'Peça 13', 'Vermelho', 1.5),
       (14, 'Peça 14', 'Azul', 3.1),
       (15, 'Peça 15', 'Preto', 2.5),
       (16, 'Peça 16', 'Verde', 1.8),
       (17, 'Peça 17', 'Amarelo', 3.9),
       (18, 'Peça 18', 'Branco', 2.3),
       (19, 'Peça 19', 'Cinza', 2.8),
       (20, 'Peça 20', 'Vermelho', 3.2),
       (21, 'Peça 21', 'Azul', 2.6),
       (22, 'Peça 22', 'Preto', 1.9),
       (23, 'Peça 23', 'Verde', 4.0),
       (24, 'Peça 24', 'Branco', 2.9),
       (25, 'Peça 25', 'Cinza', 3.4);


INSERT INTO Fornecedor (CodFornecedor, NomeFornecedor, StatusFornecedor)
VALUES (1, 'Fornecedor 1', 'Ativo'),
       (2, 'Fornecedor 2', 'Inativo'),
       (3, 'Fornecedor 3', 'Ativo'),
       (4, 'Fornecedor 4', 'Inativo'),
	   (5, 'Fornecedor 5', 'Ativo'),
       (6, 'Fornecedor 6', 'Inativo'),
       (7, 'Fornecedor 7', 'Ativo'),
       (8, 'Fornecedor 8', 'Inativo'),
       (9, 'Fornecedor 9', 'Ativo'),
       (10, 'Fornecedor 10', 'Inativo'),
       (11, 'Fornecedor 11', 'Ativo'),
       (12, 'Fornecedor 12', 'Inativo'),
       (13, 'Fornecedor 13', 'Ativo'),
       (14, 'Fornecedor 14', 'Inativo'),
       (15, 'Fornecedor 15', 'Ativo'),
       (16, 'Fornecedor 16', 'Inativo'),
       (17, 'Fornecedor 17', 'Ativo'),
       (18, 'Fornecedor 18', 'Inativo'),
       (19, 'Fornecedor 19', 'Ativo'),
       (20, 'Fornecedor 20', 'Inativo'),
       (21, 'Fornecedor 21', 'Ativo'),
       (22, 'Fornecedor 22', 'Inativo'),
       (23, 'Fornecedor 23', 'Ativo'),
       (24, 'Fornecedor 24', 'Inativo');


INSERT INTO Embarque (CodPeça, CodFornecedor, QuantidadeEmbarque)
VALUES (1, 1, 100),
       (2, 2, 50),
       (3, 1, 80),
       (4, 3, 120),
       (5, 4, 90),
	   (6, 5, 10),
       (7, 6, 12),
       (8, 7, 15),
       (9, 8, 7),
       (10, 9, 8),
       (11, 10, 11),
       (12, 11, 5),
       (13, 12, 13),
       (14, 13, 6),
       (15, 14, 9),
       (16, 15, 4),
       (17, 16, 11),
       (18, 17, 8),
       (19, 18, 3),
       (20, 19, 6),
       (21, 20, 9),
       (22, 21, 11),
       (23, 22, 2),
       (24, 23, 7),
       (25, 24, 10);
	   
 -- respostas:
SELECT P.CodPeça, P.NomePeça
FROM Peça P JOIN Embarque E ON P.CodPeça = E.CodPeça AND 
E.QuantidadeEmbarque > 100;

   -- view: pra ver o id, nome e quantidade de embarques de uma peça com mais de 100 embarques
CREATE VIEW Peças_Emb_Quantidade AS
SELECT P.CodPeça, P.NomePeça, E.QuantidadeEmbarque
FROM Peça P JOIN Embarque E ON P.CodPeça = E.CodPeça AND 
E.QuantidadeEmbarque > 100;

SELECT * FROM Peças_Emb_Quantidade;

   -- procedure:
CREATE OR REPLACE PROCEDURE Consulta_Pecas_Emb_Quantidade ()
LANGUAGE SQL
AS $$
SELECT P.CodPeça, P.NomePeça, E.QuantidadeEmbarque
FROM Peça P
JOIN Embarque E ON P.CodPeça = E.CodPeça
WHERE E.QuantidadeEmbarque > 100;
$$;
CALL Consulta_Pecas_Emb_Quantidade();

    -- index:
	DISCARD ALL
EXPLAIN ANALYSE SELECT * FROM embarque
WHERE Embarque.QuantidadeEmbarque > 100;
  --antes de criar o index:
--Execution Time: 0.022 ms
--Planning Time: 0.859 ms

CREATE INDEX IDX_Embarque ON Embarque(CodPeça, QuantidadeEmbarque);
  --depois de criar o index:
--Execution Time: 0.020 ms
--Planning Time: 0.067 ms

-- QUESTÃO 17 -------------------------------------------

CREATE TABLE CATEGORIA_CLIENTE (
    COD_CATEGORIA_CLIENTE INTEGER PRIMARY KEY,
    NOM_CATEGORIA_CLIENTE VARCHAR(100)
);

CREATE TABLE CLIENTE (
    COD_CLIENTE INTEGER PRIMARY KEY,
    NOM_CLIENTE VARCHAR(100),
    NUM_CPF_CNPJ VARCHAR(20),
    NUM_CELULAR VARCHAR(20),
    DES_ENDERECO VARCHAR(300),
    COD_CATEGORIA_CLIENTE INTEGER,
    FOREIGN KEY (COD_CATEGORIA_CLIENTE) REFERENCES CATEGORIA_CLIENTE(COD_CATEGORIA_CLIENTE)
);

CREATE TABLE AGENCIA (
    NUM_AGENCIA INTEGER PRIMARY KEY,
    NOM_AGENCIA VARCHAR(100)
);

SELECT * FROM AGENCIA;

CREATE TABLE TIPO_CONTA (
    COD_TIPO_CONTA INTEGER PRIMARY KEY,
    DES_TIPO_CONTA VARCHAR(100)
);

CREATE TABLE CONTA (
    NUM_CONTA INTEGER PRIMARY KEY,
    VAL_SALDO MONEY,
    COD_TIPO_CONTA INTEGER,
    COD_CLIENTE INTEGER,
    NUM_AGENCIA INTEGER,
    FOREIGN KEY (COD_TIPO_CONTA) REFERENCES TIPO_CONTA(COD_TIPO_CONTA),
    FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTE(COD_CLIENTE),
    FOREIGN KEY (NUM_AGENCIA) REFERENCES AGENCIA(NUM_AGENCIA)
);

CREATE TABLE TIPO_MOVIMENTACAO (
    COD_TIPO_MOVIMENTACAO INTEGER PRIMARY KEY,
    DES_TIPO_MOVIMENTACAO VARCHAR(200),
    VAL_TAXA NUMERIC,
    IND_DEBITO_CREDITO CHAR(1)
);

CREATE TABLE HISTORICO_MOVIMENTACAO (
    COD_HISTORICO_MOVIMENTACAO INTEGER PRIMARY KEY,
    NUM_CONTA INTEGER,
    COD_TIPO_MOVIMENTACAO INTEGER,
    VAL_MOVIMENTACAO NUMERIC,
    DTA_MOVIMENTACAO DATE,
    FOREIGN KEY (NUM_CONTA) REFERENCES CONTA(NUM_CONTA),
    FOREIGN KEY (COD_TIPO_MOVIMENTACAO) REFERENCES TIPO_MOVIMENTACAO(COD_TIPO_MOVIMENTACAO)
);

SELECT * FROM CATEGORIA_CLIENTE;
SELECT * FROM CLIENTE;
SELECT * FROM AGENCIA;
SELECT * FROM CONTA;
SELECT * FROM HISTORICO_MOVIMENTACAO;
SELECT * FROM TIPO_MOVIMENTACAO;
SELECT * FROM TIPO_CONTA;

INSERT INTO CATEGORIA_CLIENTE (COD_CATEGORIA_CLIENTE, NOM_CATEGORIA_CLIENTE)
VALUES (1, 'Premium'),
       (2, 'Gold'),
       (3, 'Silver'),
       (4, 'Bronze'),
       (5, 'Basic'),
       (6, 'Platinum'),
       (7, 'Diamond'),
       (8, 'Elite'),
       (9, 'Exclusive'),
       (10, 'Preferred'),
       (11, 'Standard'),
       (12, 'Special'),
       (13, 'Ultra'),
       (14, 'Ultimate'),
       (15, 'Supreme'),
       (16, 'Pro'),
       (17, 'Advanced'),
       (18, 'Prime'),
       (19, 'Classic'),
       (20, 'Executive'),
       (21, 'Business'),
       (22, 'Personal'),
       (23, 'Family'),
       (24, 'Friends');

INSERT INTO CLIENTE (COD_CLIENTE, NOM_CLIENTE, NUM_CPF_CNPJ, NUM_CELULAR, DES_ENDERECO, COD_CATEGORIA_CLIENTE)
VALUES (1, 'João Silva', '123.456.789-00', '(11) 99999-9999', 'Rua A, 123', 1),
       (2, 'Maria Souza', '987.654.321-00', '(11) 88888-8888', 'Rua B, 456', 2),
       (3, 'Pedro Santos', '456.789.123-00', '(11) 77777-7777', 'Rua C, 789', 3),
       (4, 'Juliana Fernandes', '111.222.333-44', '(11) 66666-6666', 'Rua D, 987', 4),
       (5, 'Rodrigo Oliveira', '555.444.333-22', '(11) 55555-5555', 'Rua E, 345', 5),
       (6, 'Luciana Oliveira', '999.888.777-66', '(11) 44444-4444', 'Rua F, 456', 6),
       (7, 'Fernanda Almeida', '777.888.999-11', '(11) 33333-3333', 'Rua G, 789', 7),
       (8, 'Gabriel Martins', '555.666.777-88', '(11) 22222-2222', 'Rua H, 234', 8),
       (9, 'Carla Santos', '111.222.333-44', '(11) 11111-1111', 'Rua I, 123', 9),
       (10, 'Paula Souza', '555.444.333-22', '(11) 99999-9999', 'Rua J, 456', 10),
       (11, 'Ricardo Oliveira', '999.888.777-66', '(11) 88888-8888', 'Rua K, 789', 11),
       (12, 'Thiago Santos', '777.888.999-11', '(11) 77777-7777', 'Rua L, 234', 12),
       (13, 'Larissa Silva', '555.666.777-88', '(11) 66666-6666', 'Rua M, 50', 13),
       (14, 'Fernanda Oliveira', '111.111.111-11', '(11) 1111-1111', 'Rua das Flores, 123', 14),
       (15, 'Roberto Silva', '222.222.222-22', '(11) 2222-2222', 'Avenida Paulista, 456', 15),
       (16, 'Aline Souza', '333.333.333-33', '(11) 3333-3333', 'Rua do Comércio, 789', 16),
       (17, 'Ricardo Alves', '444.444.444-44', '(11) 4444-4444', 'Rua da Praia, 10', 17),
       (18, 'Isabela Costa', '555.555.555-55', '(11) 5555-5555', 'Rua das Árvores, 20', 18),
       (19, 'Júlio César', '666.666.666-66', '(11) 6666-6666', 'Rua dos Esportes, 30', 19),
       (20, 'Fábio Santos', '777.777.777-77', '(11) 7777-7777', 'Avenida das Flores, 40', 20),
	   (42, 'Maria Silva', '876.888.888-88', '(11) 8888-8888', 'Avenida das Árvores, 150', 21),
       (22, 'Paula Souza', '888.888.888-88', '(11) 8888-8888', 'Rua dos Pássaros, 50', 22),
       (23, 'Pedro Lima', '999.999.999-99', '(11) 9999-9999', 'Avenida dos Anjos, 60', 23),
       (24, 'Sandra Gonçalves', '000.000.000-00', '(11) 0000-0000', 'Rua do Sol, 70', 24);
      
INSERT INTO AGENCIA (NUM_AGENCIA, NOM_AGENCIA)
VALUES (1, 'Agência Central'),
       (2, 'Agência Norte'),
       (3, 'Agência Sul'),
       (4, 'Agência Leste'),
       (5, 'Agência Oeste'),
       (6, 'Agência Centro-Sul'),
       (7, 'Agência Centro-Norte'),
       (8, 'Agência Centro-Oeste'),
       (9, 'Agência Centro-Leste'),
       (10, 'Agência Cidade Jardim'),
       (11, 'Agência Paulista'),
       (12, 'Agência Pinheiros'),
       (13, 'Agência Itaim'),
       (14, 'Agência Vila Olímpia'),
       (15, 'Agência Faria Lima'),
       (16, 'Agência Vila Mariana'),
       (17, 'Agência Santo Amaro'),
       (18, 'Agência Morumbi'),
       (19, 'Agência Jardim América'),
       (20, 'Agência Perdizes'),
       (21, 'Agência Lapa'),
       (22, 'Agência Moema'),
       (23, 'Agência Vila Madalena'),
       (24, 'Agência Brooklin');
	   
INSERT INTO TIPO_CONTA (COD_TIPO_CONTA, DES_TIPO_CONTA) VALUES
       (1, 'Conta Corrente'),
       (2, 'Conta Poupança'),
       (3, 'Conta Investimento'),
       (4, 'Conta Salário'),
       (5, 'Conta Universitária'),
       (6, 'Conta Digital'),
       (7, 'Conta Conjunta'),
       (8, 'Conta Empresarial'),
       (9, 'Conta MEI'),
       (10, 'Conta Jurídica'),
       (11, 'Conta Internacional'),
       (12, 'Conta de Crédito'),
       (13, 'Conta de Débito'),
       (14, 'Conta de Pagamento'),
       (15, 'Conta de Recebimento'),
       (16, 'Conta de Empréstimo'),
       (17, 'Conta de Financiamento'),
       (18, 'Conta de Consórcio'),
       (19, 'Conta de Investimento em Ações'),
       (20, 'Conta de Investimento em Fundos'),
       (21, 'Conta de Investimento em Tesouro Direto'),
       (22, 'Conta de Investimento em Renda Fixa'),
       (23, 'Conta de Investimento em Previdência'),
       (24, 'Conta de Investimento em CDB/LCI/LCA');


INSERT INTO CONTA (NUM_CONTA, VAL_SALDO, COD_TIPO_CONTA, COD_CLIENTE, NUM_AGENCIA)
VALUES (1, 5000.00, 1, 1, 1),
       (2, 10000.00, 2, 2, 2),
       (3, 15000.00, 3, 3, 3),
       (4, 20000.00, 4, 4, 4),
       (5, 25000.00, 5, 5, 5),
       (6, 30000.00, 6, 6, 6),
       (7, 35000.00, 7, 7, 7),
       (8, 40000.00, 8, 8, 8),
       (9, 45000.00, 9, 9, 9),
       (10, 50000.00, 10, 10, 10),
       (11, 55000.00, 1, 11, 11),
       (12, 60000.00, 2, 12, 12),
       (13, 65000.00, 3, 13, 13),
       (14, 70000.00, 4, 14, 14),
       (15, 75000.00, 5, 15, 15),
       (16, 80000.00, 6, 16, 16),
       (17, 85000.00, 7, 17, 17),
       (18, 90000.00, 8, 18, 18),
       (19, 95000.00, 9, 19, 19),
       (20, 100000.00, 10, 20, 20),
       (21, 105000.00, 1, 1, 21),
       (22, 110000.00, 2, 2, 22),
       (23, 115000.00, 8, 15, 23),
	   (24, 200000.00, 5, 20, 24);
	   
INSERT INTO TIPO_MOVIMENTACAO (COD_TIPO_MOVIMENTACAO, DES_TIPO_MOVIMENTACAO, VAL_TAXA, IND_DEBITO_CREDITO) VALUES
       (1, 'Depósito', 0.0, 'C'),
       (2, 'Saque', 2.5, 'D'),
       (3, 'Transferência', 1.5, 'D'),
       (4, 'Pagamento', 0.5, 'D'),
       (5, 'Recebimento', 0.0, 'C'),
       (6, 'Investimento em Ações', 3.0, 'D'),
       (7, 'Resgate de Investimento em Ações', 1.5, 'D'),
       (8, 'Investimento em Fundos', 2.5, 'D'),
       (9, 'Resgate de Investimento em Fundos', 1.0, 'D'),
       (10, 'Investimento em Tesouro Direto', 2.0, 'D'),
       (11, 'Resgate de Investimento em Tesouro Direto', 1.0, 'D'),
       (12, 'Investimento em Renda Fixa', 1.5, 'D'),
       (13, 'Resgate de Investimento em Renda Fixa', 0.5, 'D'),
       (14, 'Investimento em Previdência', 2.5, 'D'),
       (15, 'Resgate de Investimento em Previdência', 1.0, 'D'),
       (16, 'Transferência Internacional', 5.0, 'D'),
       (17, 'Pagamento Internacional', 3.0, 'D'),
       (18, 'Recebimento Internacional', 0.0, 'C'),
       (19, 'Empréstimo', 4.0, 'C'),
       (20, 'Pagamento de Empréstimo', 0.0, 'D'),
       (21, 'Financiamento', 3.5, 'C'),
       (22, 'Recebimento de Financiamento', 0.0, 'C'),
       (23, 'Consórcio', 2.0, 'C'),
       (24, 'Pagamento de Consórcio', 0.5, 'D');

	   
INSERT INTO HISTORICO_MOVIMENTACAO (COD_HISTORICO_MOVIMENTACAO, NUM_CONTA, COD_TIPO_MOVIMENTACAO, VAL_MOVIMENTACAO, DTA_MOVIMENTACAO)
VALUES (1, 1, 1, 1000.00, '2023-04-01 10:30:00'),
       (2, 2, 2, 2000.00, '2023-04-02 11:45:00'),
       (3, 3, 3, 3000.00, '2023-04-03 12:00:00'),
       (4, 4, 4, 4000.00, '2023-04-04 13:15:00'),
       (5, 5, 5, 5000.00, '2023-04-05 14:30:00'),
       (6, 6, 1, 6000.00, '2023-04-06 15:45:00'),
       (7, 7, 2, 7000.00, '2023-04-07 16:00:00'),
       (8, 8, 3, 8000.00, '2023-04-08 17:15:00'),
       (9, 9, 4, 9000.00, '2023-04-09 18:30:00'),
       (10, 10, 5, 10000.00, '2023-04-10 19:45:00'),
       (11, 11, 1, 11000.00, '2023-04-11 20:00:00'),
       (12, 12, 2, 12000.00, '2023-04-12 21:15:00'),
       (13, 13, 3, 13000.00, '2023-04-13 22:30:00'),
       (14, 14, 4, 14000.00, '2023-04-14 23:45:00'),
       (15, 15, 5, 15000.00, '2023-04-15 10:30:00'),
       (16, 16, 1, 16000.00, '2023-04-16 11:45:00'),
       (17, 17, 2, 17000.00, '2023-04-17 12:00:00'),
       (18, 18, 3, 18000.00, '2023-04-18 13:15:00'),
       (19, 19, 4, 19000.00, '2023-04-19 14:30:00'),
       (20, 20, 5, 20000.00, '2023-04-20 15:45:00'),
       (21, 21, 1, 21000.00, '2023-04-21 16:00:00'),
       (22, 22, 2, 22000.00, '2023-04-22 17:15:00'),
       (23, 23, 3, 23000.00, '2023-04-23 18:30:00'),
       (24, 24, 4, 24000.00, '2023-04-23 19:45:00');

--resposta:
SELECT CL.NOM_CLIENTE, AVG(HM.VAL_MOVIMENTACAO)
FROM CLIENTE CL INNER JOIN CONTA CO ON CL.COD_CLIENTE = CO.COD_CLIENTE 
INNER JOIN HISTORICO_MOVIMENTACAO HM ON CO.NUM_CONTA = HM.NUM_CONTA 
GROUP BY CL.COD_CLIENTE, CL.NOM_CLIENTE 
ORDER BY AVG(HM.VAL_MOVIMENTACAO) DESC;
		
	--view:retorna a média de movimentação financeira de cada cliente, agrupados pelo nome e código do cliente
CREATE VIEW view_media_movimentacao AS
SELECT CL.NOM_CLIENTE, AVG(HM.VAL_MOVIMENTACAO) AS MEDIA_MOVIMENTACAO
FROM CLIENTE CL INNER JOIN CONTA CO ON CL.COD_CLIENTE = CO.COD_CLIENTE 
INNER JOIN HISTORICO_MOVIMENTACAO HM ON CO.NUM_CONTA = HM.NUM_CONTA 
GROUP BY CL.COD_CLIENTE, CL.NOM_CLIENTE;

SELECT * FROM view_media_movimentacao

	--procedure:
CREATE OR REPLACE PROCEDURE sp_media_movimentacao(p_nome_cliente VARCHAR(50))
AS 
$$
DECLARE
  v_media_movimentacao NUMERIC;
BEGIN
  SELECT AVG(HM.VAL_MOVIMENTACAO)
  INTO v_media_movimentacao
  FROM CLIENTE CL 
  INNER JOIN CONTA CO ON CL.COD_CLIENTE = CO.COD_CLIENTE 
  INNER JOIN HISTORICO_MOVIMENTACAO HM ON CO.NUM_CONTA = HM.NUM_CONTA 
  WHERE CL.NOM_CLIENTE = p_nome_cliente;
  
  IF v_media_movimentacao IS NULL THEN
    RAISE EXCEPTION 'Cliente não encontrado';
  ELSE
    RAISE NOTICE 'Média de movimentação financeira do cliente % é: %', p_nome_cliente, v_media_movimentacao;
  END IF;
END;
$$
LANGUAGE plpgsql;

CALL sp_media_movimentacao('Gabriella Marreto');

    -- index:
	DISCARD ALL
EXPLAIN ANALYSE SELECT CL.NOM_CLIENTE, AVG(HM.VAL_MOVIMENTACAO)
FROM CLIENTE CL INNER JOIN CONTA CO ON CL.COD_CLIENTE = CO.COD_CLIENTE 
INNER JOIN HISTORICO_MOVIMENTACAO HM ON CO.NUM_CONTA = HM.NUM_CONTA 
GROUP BY CL.COD_CLIENTE, CL.NOM_CLIENTE 
ORDER BY AVG(HM.VAL_MOVIMENTACAO) DESC;
  --antes de criar o index:
--Execution Time: 0.299 ms
--Planning Time: 4.949 ms

CREATE INDEX IDX_Embarque ON Embarque(CodPeça, QuantidadeEmbarque);
  --depois de criar o index:
--Execution Time: 0.140 ms
--Planning Time: 0.182 ms


-- QUESTÃO 23 -------------------------------------------

CREATE TABLE Motorista (
  idMoto INT PRIMARY KEY,
  nome VARCHAR(50),
  telefone VARCHAR(20),
  idade INT
); 

CREATE TABLE Carro (
  idCarro INT PRIMARY KEY,
  nomeCarro VARCHAR(50),
  cor VARCHAR(20)
);

CREATE TABLE Reservas (
  idMoto INT,
  idCarro INT,
  dia DATE,
  FOREIGN KEY (idMoto) REFERENCES Motorista(idMoto),
  FOREIGN KEY (idCarro) REFERENCES Carro(idCarro)
);

SELECT * FROM Motorista;
SELECT * FROM Carro;
SELECT * FROM Reservas;


INSERT INTO Motorista (idMoto, nome, telefone, idade) VALUES
  (1, 'Pedro', '(11) 1111-1111', 28),
  (2, 'Ana', '(11) 2222-2222', 34),
  (3, 'Lucas', '(11) 3333-3333', 22),
  (4, 'Paulo', '(11) 4444-4444', 27),
  (5, 'Gabriela', '(11) 5555-5555', 31),
  (6, 'Felipe', '(11) 6666-6666', 29),
  (7, 'Mariana', '(11) 7777-7777', 25),
  (8, 'Fernanda', '(11) 8888-8888', 30),
  (9, 'Rafael', '(11) 9999-9999', 33),
  (10, 'Bruna', '(11) 1010-1010', 26),
  (11, 'Gustavo', '(11) 1111-2222', 28),
  (12, 'Carla', '(11) 2222-3333', 34),
  (13, 'Diego', '(11) 3333-4444', 22),
  (14, 'Camila', '(11) 4444-5555', 27),
  (15, 'Leticia', '(11) 5555-6666', 31),
  (16, 'Thiago', '(11) 6666-7777', 29),
  (17, 'Isabela', '(11) 7777-8888', 25),
  (18, 'Marcos', '(11) 8888-9999', 30),
  (19, 'Renata', '(11) 9999-1010', 33),
  (20, 'Luciana', '(11) 1010-1111', 26),
  (21, 'Vinicius', '(11) 1111-3333', 28),
  (22, 'Aline', '(11) 2222-4444', 34),
  (23, 'Eduardo', '(11) 3333-5555', 22),
  (24, 'Patricia', '(11) 4444-6666', 27);
  
 INSERT INTO Carro (idCarro, nomeCarro, cor) VALUES
  (1, 'Fiesta', 'Vermelho'),
  (2, 'Civic', 'Preto'),
  (3, 'Fox', 'Prata'),
  (4, 'Golf', 'Branco'),
  (5, 'Siena', 'Azul'),
  (6, 'Cruze', 'Cinza'),
  (7, 'Onix', 'Branco'),
  (8, 'HB20', 'Vermelho'),
  (9, 'Palio', 'Verde'),
  (10, 'EcoSport', 'Preto'),
  (11, 'Tracker', 'Azul'),
  (12, 'Uno', 'Branco'),
  (13, 'Punto', 'Cinza'),
  (14, 'Sandero', 'Preto'),
  (15, 'Logan', 'Vermelho'),
  (16, 'Tucson', 'Branco'),
  (17, 'Corolla', 'Preto'),
  (18, 'Jetta', 'Cinza'),
  (19, 'Sentra', 'Azul'),
  (20, 'Fusion', 'Prata'),
  (21, 'Etios', 'Branco'),
  (22, 'Renegade', 'Vermelho'),
  (23, 'Creta', 'Azul'),
  (24, 'HR-V', 'Preto');
   
 INSERT INTO Reservas (idMoto, idCarro, dia) VALUES
  (1, 3, '2023-04-12'),
  (2, 5, '2023-04-10'),
  (3, 1, '2023-04-13'),
  (4, 2, '2023-04-14'),
  (5, 4, '2023-04-16'),
  (6, 6, '2023-04-12'),
  (7, 8, '2023-04-18'),
  (8, 10, '2023-04-20'),
  (9, 12, '2023-04-22'),
  (10, 14, '2023-04-24'),
  (11, 16, '2023-04-26'),
  (12, 18, '2023-04-28'),
  (13, 20, '2023-04-30'),
  (14, 22, '2023-05-02'),
  (15, 24, '2023-05-04'),
  (16, 1, '2023-05-06'),
  (17, 3, '2023-05-08'),
  (18, 5, '2023-05-10'),
  (19, 7, '2023-05-12'),
  (20, 9, '2023-05-14'),
  (21, 11, '2023-05-16'),
  (22, 13, '2023-05-18'),
  (23, 15, '2023-05-20'),
  (24, 17, '2023-05-22');
  
  --resposta:
SELECT M.NOME
FROM MOTORISTA M
WHERE M.IDMOTO IN
 (SELECT R.IDMOTO
 FROM RESERVAS R
 WHERE R.IDCARRO IN
 (SELECT C.IDCARRO
 FROM CARRO C
 WHERE C.COR = 'Vermelho'));
 
 	--view: retorna os motoristas com carro vermelho
CREATE VIEW motorista_vermelho AS
SELECT M.NOME
FROM MOTORISTA M
WHERE M.IDMOTO IN
 (SELECT R.IDMOTO
 FROM RESERVAS R
 WHERE R.IDCARRO IN
 (SELECT C.IDCARRO
 FROM CARRO C
 WHERE C.COR = 'Vermelho'));
 
 SELECT * FROM motorista_vermelho;

	--procedimento:
CREATE OR REPLACE PROCEDURE obter_motoristas_vermelhos()
LANGUAGE plpgsql
AS $$
DECLARE
  motoristas_vermelhos CURSOR FOR
    SELECT M.NOME
    FROM MOTORISTA M
    WHERE M.IDMOTO IN
      (SELECT R.IDMOTO
       FROM RESERVAS R
       WHERE R.IDCARRO IN
         (SELECT C.IDCARRO
          FROM CARRO C
          WHERE C.COR = 'Vermelho'));
  motorista RECORD;
BEGIN
  OPEN motoristas_vermelhos;
  LOOP
    FETCH motoristas_vermelhos INTO motorista;
    EXIT WHEN NOT FOUND;
    RAISE NOTICE 'Motorista vermelho: %', motorista.nome;
  END LOOP;
  CLOSE motoristas_vermelhos;
END;
$$;
CALL obter_motoristas_vermelhos();

    -- index:
	DISCARD ALL
EXPLAIN ANALYSE SELECT M.NOME
FROM MOTORISTA M
WHERE M.IDMOTO IN
 (SELECT R.IDMOTO
 FROM RESERVAS R
 WHERE R.IDCARRO IN
 (SELECT C.IDCARRO
 FROM CARRO C
 WHERE C.COR = 'Vermelho'));
  --antes de criar o index:
--Execution Time: 0.064 ms
--Planning Time: 3.410 ms

CREATE INDEX motorista_vermelho_idx ON motorista (NOME);
  --depois de criar o index:
--Execution Time: 0.60 ms
--Planning Time: 0.144 ms






