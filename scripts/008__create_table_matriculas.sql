-- ============================================================
-- 008__create_table_matriculas.sql
-- Matrícula do aluno em uma turma. Cada aluno pode estar
-- matriculado uma única vez em cada turma (UNIQUE id_aluno,
-- id_turma). O valor mensal da matrícula alimenta os
-- pagamentos de mensalidade.
-- ============================================================
CREATE TABLE IF NOT EXISTS matriculas (
    id_matricula      SERIAL PRIMARY KEY,
    id_aluno          INTEGER NOT NULL REFERENCES pessoas(id_pessoa),
    id_turma          INTEGER NOT NULL REFERENCES turmas(id_turma),
    data_matricula    DATE NOT NULL DEFAULT CURRENT_DATE,
    status            VARCHAR(20) NOT NULL DEFAULT 'ATIVA' CHECK (status IN ('ATIVA','CANCELADA','CONCLUIDA')),
    valor_mensalidade NUMERIC(10,2) NOT NULL CHECK (valor_mensalidade > 0),
    UNIQUE (id_aluno, id_turma)
);