-- tabela de unidades da escola. coloquei qtde_salas porque no futuro
-- alguma unidade pode ter mais de uma sala, mas em Porto Velho é só 1
-- (as 3 turmas dividem ela)
CREATE TABLE IF NOT EXISTS unidades (
    id_unidade  SERIAL PRIMARY KEY,
    nome        VARCHAR(100) NOT NULL UNIQUE,
    cidade      VARCHAR(100) NOT NULL,
    estado      VARCHAR(2)   NOT NULL,
    endereco    VARCHAR(255),
    telefone    VARCHAR(20),
    qtde_salas  INTEGER NOT NULL DEFAULT 1 CHECK (qtde_salas >= 1)
);