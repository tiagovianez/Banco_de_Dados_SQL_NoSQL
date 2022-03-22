CREATE DATABASE secao04;

USE secao04;

CREATE TABLE tipos_produto(
	codigo INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(30) NOT NULL,
    PRIMARY KEY (codigo)
    );

CREATE TABLE produtos(
	codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(30) NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    codigo_tipo INT NOT NULL,
    FOREIGN KEY (codigo_tipo) REFERENCES tipos_produto(codigo)
    );
    
    
    
INSERT INTO tipos_produto (descricao) VALUES ('Computadores');
INSERT INTO tipos_produto (descricao) VALUES ('Impressora');
INSERT INTO tipos_produto (descricao) VALUES ('Laptop');

INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Desktop', '1200', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Laptop', '1800', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Jato de Tinta', '300', 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Laser', '500', 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Notebook', '1200', 1);

# DQL

SELECT * FROM tipos_produto;

SELECT descricao FROM tipos_produto;

SELECT * FROM produtos;

SELECT codigo, descricao, preco, codigo_tipo FROM produtos;

# ALIAS
SELECT p.codigo AS cod, p.descricao AS descri, p.preco AS pre, p.codigo_tipo AS ctp FROM produtos AS p;
SELECT p.codigo AS 'Código', p.descricao AS 'Descrição', p.preco AS 'Preço', p.codigo_tipo AS 'Tipo Produto' FROM produtos AS p;
 
# DML - DATA MANIPULATION LANGUAGE
-- insert --
INSERT INTO produtos VALUES ('Ipad Pro', '2200', 3);



# FAZENDO UMA QUERY
SELECT * FROM produtos;
SELECT * FROM tipos_produto;

-- Update
UPDATE produtos set descricao = 'Desktop', preco = '1200' WHERE codigo = 1;
UPDATE produtos set descricao = 'Laptop', preco = '1800' WHERE codigo = 2;
UPDATE produtos set descricao = 'Impr. Jato de Tinta', preco = '500' WHERE codigo = 3;
UPDATE produtos set descricao = 'Impr. Laser', preco = '700' WHERE codigo = 5;
UPDATE produtos set descricao = 'Notebook', preco = '1750' WHERE codigo = 6;
UPDATE produtos set descricao = 'Macbook Pro', preco = '5200' WHERE codigo = 7;
UPDATE produtos set descricao = 'Macbook Air', preco ='7800' WHERE codigo = 8; 

-- Atualizando outros campos
UPDATE produtos set descricao = 'Impr. Laser', preco = '700' WHERE codigo = 4; 

# NUNCA ESQUECA DE FILTRAR O REGISTRO COM O "WHERE"!
UPDATE produtos set preco = '150';

UPDATE produtos set preco = '250' WHERE codigo < 4;

-- DELETE

DELETE FROM produtos WHERE codigo = 4;

# NUNCA ESQUECA DE FILTRAR O REGISTRO COM O "WHERE"!
DELETE FROM produtos;













