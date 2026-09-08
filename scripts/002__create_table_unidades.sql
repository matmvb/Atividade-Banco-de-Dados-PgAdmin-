-- ============================================================
-- 002__create_table_unidades.sql
-- Unidades da escola espalhadas pelo Brasil.
-- A unidade de Porto Velho possui apenas 1 sala (qtde_salas = 1).
-- ============================================================
CREATE TABLE IF NOT EXISTS unidades (
    id_unidade  SERIAL PRIMARY KEY,
    nome        VARCHAR(100) NOT NULL UNIQUE,
    cidade      VARCHAR(100) NOT NULL,
    estado      VARCHAR(2)   NOT NULL,
    endereco    VARCHAR(255),
    telefone    VARCHAR(20),
    qtde_salas  INTEGER NOT NULL DEFAULT 1 CHECK (qtde_salas >= 1)
);