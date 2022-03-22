-- CREATE DATABASE secao03;

-- CREATE TABLE tipos_produto(
-- 	id SERIAL PRIMARY KEY,
-- 	descricao VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE produtos(
-- 	id SERIAL PRIMARY KEY,
-- 	descricao VARCHAR(50) NOT NULL,
-- 	preco MONEY NOT NULL,
-- 	id_tipo_produto INT references tipos_produto(id) NOT NULL
-- );

CREATE TABLE pacientes(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	endereco VARCHAR(50) NOT NULL,
	bairro VARCHAR(50) NOT NULL,
	cidade VARCHAR(40) NOT NULL,
	estado CHAR(2) NOT NULL,
	cep VARCHAR(9) NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE professores(
	id SERIAL PRIMARY KEY,
	telefone INT NOT NULL,
	nome VARCHAR(50) NOT NULL
);

CREATE TABLE turmas(
	id SERIAL PRIMARY KEY,
	capacidade INT NOT NULL,
	id_professor INT REFERENCES professores(id) NOT NULL
);

