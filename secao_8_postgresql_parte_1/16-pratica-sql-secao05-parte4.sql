-- Criação de banco de dados Agregação
CREATE DATABASE agregacao;

CREATE TABLE categorias(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL
);

CREATE TABLE produtos(
	id SERIAL PRIMARY KEY, 
	descricao VARCHAR(60) NOT NULL,
	preco_venda DECIMAL(8,2) NOT NULL,
	preco_custo MONEY NOT NULL,
	id_categoria INT REFERENCES categorias(id) NOT NULL
);

INSERT INTO categorias (nome) VALUES ('Material Escolar');
INSERT INTO categorias (nome) VALUES ('Acessório Informática');
INSERT INTO categorias (nome) VALUES ('Material Escritório');
INSERT INTO categorias (nome) VALUES ('Game');

INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Caderno', 5.45, 2.30, 1);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Caneta', 1.20, 0.45, 1);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Pendrive 32GB', 120.54, 32.55, 2);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Mouse', 17.00, 4.30, 2);

-- Max
SELECT MAX(preco_venda) FROM produtos;

-- Min
SELECT MIN(preco_venda) FROM produtos;

-- AVG
-- SELECT AVG(preco_custo) FROM produtos;
SELECT AVG(preco_venda) FROM produtos;

-- Formatando para STRING
SELECT TO_CHAR(AVG(preco_venda), '999999D99') FROM produtos;

-- Formatando para numerico
SELECT ROUND(AVG(preco_venda)::numeric, 2) FROM produtos;

-- Calculado a média do valor Money
SELECT ROUND(AVG(preco_custo::numeric), 2) FROM produtos;

-- ROUND 
SELECT ROUND(AVG(preco_venda), 2) FROM produtos;

-- Count
SELECT COUNT(preco_venda) AS quantidade FROM produtos WHERE id_categoria = 1;

-- Group By
SELECT id_categoria, MAX(preco_venda) FROM produtos GROUP BY id_categoria;

-- Having
SELECT id_categoria, MAX(preco_venda) FROM produtos GROUP BY id_categoria HAVING MAX(preco_venda) > 5.46;


