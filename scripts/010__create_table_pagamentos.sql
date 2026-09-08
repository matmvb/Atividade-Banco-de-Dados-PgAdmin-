-- ============================================================
-- 010__create_table_pagamentos.sql
-- Mensalidades pagas pelos responsáveis. Cada pagamento está
-- vinculado a uma matrícula e ao responsável financeiro do aluno
-- (1 responsável por aluno). O status pode ser PENDENTE, PAGO
-- ou ATRASADO (mantido pela procedure do script 022).
-- ============================================================
CREATE TABLE IF NOT EXISTS pagamentos (
    id_pagamento    SERIAL PRIMARY KEY,
    id_matricula    INTEGER NOT NULL REFERENCES matriculas(id_matricula),
    id_responsavel  INTEGER NOT NULL REFERENCES pessoas(id_pessoa),
    data_vencimento DATE NOT NULL,
    data_pagamento  DATE,
    valor           NUMERIC(10,2) NOT NULL CHECK (valor > 0),
    status          VARCHAR(20) NOT NULL DEFAULT 'PENDENTE' CHECK (status IN ('PENDENTE','PAGO','ATRASADO'))
);