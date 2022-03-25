-- Criar um usuario
CREATE USER estagiario WITH PASSWORD '123456';

CREATE DATABASE secao04;

CREATE TABLE empresas(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	funcionarios INT NOT NULL,
	cidade VARCHAR(50) NOT NULL
);

-- Insert de Dados (Estagiario)
INSERT INTO empresas (nome, funcionarios, cidade) VALUES ('Apple', 4500, 'Cupertino');
INSERT INTO empresas (nome, funcionarios, cidade) VALUES ('Microsoft', 23500, 'Palo Alto');
INSERT INTO empresas (nome, funcionarios, cidade) VALUES ('Amazon', 9000, 'Santos');

SELECT * FROM empresas;

UPDATE empresas SET funcionarios = 1500 WHERE id = 3;

DELETE FROM empresas WHERE id = 2;


-- Conceder privilegios para o usuario estagiario
GRANT ALL ON empresas TO estagiario;

SELECT * FROM empresas;

GRANT USAGE, SELECT ON SEQUENCE empresas_id_seq TO estagiario;

REVOKE ALL ON empresas FROM estagiario;

GRANT SELECT ON empresas TO estagiario;

REVOKE USAGE, SELECT ON SEQUENCE empresas_id_seq FROM estagiario;

DROP USER estagiario;
