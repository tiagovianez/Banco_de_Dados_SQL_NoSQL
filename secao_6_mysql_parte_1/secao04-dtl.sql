USE  secao04;

SELECT * FROM tipos_produto;

#DTL
-- Transaction: Fazendo e desfazendo transações de acordo com a necessidade

START TRANSACTION;
	INSERT INTO tipos_produto (codigo, descricao) VALUES (77, 'Eletrônicos');
    INSERT INTO tipos_produto (descricao) VALUES ('Escritório');

-- Commit
COMMIT;

-- Rollback;
ROLLBACK;

UPDATE tipos_produto set codigo = 10 WHERE codigo = 77;