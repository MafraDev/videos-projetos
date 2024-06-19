CREATE TABLE IF NOT EXISTS m_categorias_de_entradas (
	id INTEGER PRIMARY KEY,
	descricao TEXT NOT NULL
);

INSERT INTO m_categorias_de_entradas (descricao) VALUES ('Principal');
INSERT INTO m_categorias_de_entradas (descricao) VALUES ('Extra');

SELECT * FROM m_categorias_de_entradas;

CREATE TABLE IF NOT EXISTS m_entradas (
	id INTEGER PRIMARY KEY,
	descricao TEXT NOT NULL,
	valor NUMERIC(10,2) NOT NULL,
	categoria_id INTEGER,
	FOREIGN KEY (categoria_id)
		REFERENCES m_categorias_de_entradas(id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

SELECT * FROM m_entradas;
SELECT * FROM m_categorias_de_entradas;
INSERT INTO m_entradas (descricao, valor, categoria_id) VALUES ('Salário', 1000.00, 1);

UPDATE m_entradas
SET valor = 3000.00
WHERE id = 1;
SELECT * FROM m_entradas;

SELECT *
FROM m_entradas e
LEFT JOIN m_categorias_de_entradas c ON e.categoria_id = c.id;

SELECT e.descricao, e.valor, c.descricao AS categoria
FROM m_entradas e
LEFT JOIN m_categorias_de_entradas c ON e.categoria_id = c.id;

INSERT INTO m_entradas (descricao, valor, categoria_id) VALUES ('Projeto cliente X', 300.00, 2);

SELECT e.descricao, c.descricao AS categoria, e.valor
FROM m_entradas e
LEFT JOIN m_categorias_de_entradas c ON e.categoria_id = c.id;


CREATE TABLE IF NOT EXISTS m_categorias_de_saidas (
  id INTEGER PRIMARY KEY,
  descricao TEXT NOT NULL
);

INSERT INTO m_categorias_de_saidas (descricao) VALUES ('Essencial');
INSERT INTO m_categorias_de_saidas (descricao) VALUES ('Educacao');
INSERT INTO m_categorias_de_saidas (descricao) VALUES ('Futuro');
INSERT INTO m_categorias_de_saidas (descricao) VALUES ('Lazer');

SELECT * FROM m_categorias_de_saidas;



CREATE TABLE IF NOT EXISTS m_saidas (
  id INTEGER PRIMARY KEY,
  descricao TEXT NOT NULL,
  valor NUMERIC(10, 2) NOT NULL,
  categoria_id INTEGER NOT NULL,
  FOREIGN KEY (categoria_id)
    REFERENCES m_categorias_de_saidas(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


INSERT INTO m_saidas (descricao, valor, categoria_id) VALUES ('Aluguel', 1000.00, 1);
INSERT INTO m_saidas (descricao, valor, categoria_id) VALUES ('Condomínio', 200.00, 1);
INSERT INTO m_saidas (descricao, valor, categoria_id) VALUES ('Alimentação', 1000.00, 1);
INSERT INTO m_saidas (descricao, valor, categoria_id) VALUES ('Transporte', 400.00, 1);
INSERT INTO m_saidas (descricao, valor, categoria_id) VALUES ('Curso de Aprimoramento', 150.00, 2);
INSERT INTO m_saidas (descricao, valor, categoria_id) VALUES ('Investimento', 250.00, 3);
INSERT INTO m_saidas (descricao, valor, categoria_id) VALUES ('Férias', 100.00, 4);

SELECT * FROM m_saidas;


SELECT s.descricao, c.descricao AS categoria, s.valor 
FROM m_saidas s
LEFT JOIN m_categorias_de_saidas c ON s.categoria_id = c.id;

SELECT sum(s.valor) AS total
FROM m_saidas s
LEFT JOIN m_categorias_de_saidas c ON s.categoria_id = c.id;







SELECT c.descricao AS categoria, sum(s.valor) AS total
FROM m_saidas s
LEFT JOIN m_categorias_de_saidas c ON s.categoria_id = c.id
GROUP BY c.descricao;

SELECT total_entradas, total_saidas, (total_entradas - total_saidas) AS saldo
FROM
  (SELECT sum(valor) AS total_entradas FROM m_entradas) AS e
  LEFT JOIN
  (SELECT sum(valor) AS total_saidas FROM m_saidas) AS s;


