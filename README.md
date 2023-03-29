# Resumo BD1

### CREATE / DROP 

- CREATE DATABASE  
- DROP DATABASE  
  #
- CREATE TABLE  
- DROP TABLE  
  #
> obs: 
>   - not null: n deixa ir nulo
>  - unique  : aquele valor n pode ser cad mais de 1 vez
>  - check   : o valor deve satisfazer uma expressao
>  - references: é uma FK


### INSERT

- INSERT INTO <nome-tabela> <(campos)> values <(valores)>

### ALTER TABLE

add campo:  
 ALTER TABLE <nome-tabela> ADD COLUMN <campo e tipo>
 #

mudar nome de campo:  
ALTER TABLE <nome-tabela> RENAME COLUMN <nome-antigo> TO <nome-novo>
 #

mudar tipo de campo:  
ALTER TABLE <nome-tabela> ALTER COLUMN <campo> TYPE <tipo>
 #

excluir campo:  
ALTER TABLE <nome-tabela> DROP COLUMN <campo>
 #

mudar nome da tabela:  
ALTER TABLE <nome-tabela> RENAME TO <nome-novo>
 #

add restrição de not null:  
ALTER TABLE <nome-tabela> ALTER COLUMN <campo> SET NOT NULL
 #

tirar restrição de not null:  
ALTER TABLE <nome-tabela> ALTER COLUMN <campo> DROP NOT NULL
 #

mudar valor padrão:  
ALTER TABLE <nome-tabela> ALTER COLUMN <campo> SET DEFAULT <valor>
 #

excluir valor padrão:  
ALTER TABLE <nome-tabela> ALTER COLUMN <campo> DROP DEFAULT
 #

add constraint check:  
ALTER TABLE <nome-tabela> ADD CONSTRAINT <nome-contraint> CHECK <campo-condição>
 #

add constraint unique:  
ALTER TABLE <nome-tabela> ADD CONSTRAINT <nome-contraint> UNIQUE <campo>
 #

add chave primária:  
ALTER TABLE <nome-tabela> ADD PRIMARY KEY <campo>
 #

add chave primária:  
ALTER TABLE <nome-tabela> ADD FOREIGN KEY <campo> REFERENCES <tabela-estrangeira>
 #

excluir constraint:  
ALTER TABLE <nome-tabela> DROP CONSTRAINT <nome-constraint>

