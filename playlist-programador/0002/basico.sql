CREATE TABLE entradas (
  id INTEGER PRIMARY KEY,
  descricao TEXT NOT NULL,
  valor NUMERIC(10,2) NOT NULL
);

SELECT * FROM entradas;

INSERT INTO entradas (descricao, valor)
VALUES ("Salário", 3000.00);

INSERT INTO entradas (descricao, valor)
VALUES ("Projeto Cliente X", 300.00);

CREATE TABLE saidas (
  id INTEGER PRIMARY KEY,
  descricao TEXT NOT NULL,
  valor NUMERIC(10,2) NOT NULL
);

SELECT * FROM saidas;

INSERT INTO saidas (descricao, valor) VALUES ("Aluguel", 1000);
INSERT INTO saidas (descricao, valor) VALUES ("Condomínio", 200);
INSERT INTO saidas (descricao, valor) VALUES ("Alimentacao", 1000);
INSERT INTO saidas (descricao, valor) VALUES ("Transporte", 400);
INSERT INTO saidas (descricao, valor) VALUES ("Curso de Aprimoramento", 150);
INSERT INTO saidas (descricao, valor) VALUES ("Investimento", 250);
INSERT INTO saidas (descricao, valor) VALUES ("Férias", 100);

SELECT * FROM saidas s;
SELECT * FROM entradas e;

SELECT descricao FROM entradas;
SELECT valor FROM entradas;

SELECT sum(valor) FROM entradas;
SELECT sum(valor) FROM saidas;

SELECT sum(valor) AS total_entradas FROM entradas;
SELECT sum(valor) AS total_saidas FROM saidas;

SELECT total_entradas, total_saidas
FROM
  (SELECT sum(valor) AS total_entradas FROM entradas) AS e
  LEFT JOIN
  (SELECT sum(valor) AS total_saidas FROM saidas) AS s;
 
SELECT total_entradas, total_saidas, (total_entradas - total_saidas) AS saldo
FROM
  (SELECT sum(valor) AS total_entradas FROM entradas) AS e
  LEFT JOIN
  (SELECT sum(valor) AS total_saidas FROM saidas) AS s;
