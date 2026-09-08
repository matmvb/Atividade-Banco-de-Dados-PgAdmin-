-- matrícula do aluno na turma. guardo também quem registrou (id_funcionario,
-- é a secretaria ou o coordenador) e o desconto caso tenha. o valor que o
-- responsável paga é o valor_mensalidade menos o desconto.
CREATE TABLE IF NOT EXISTS matriculas (
    id_matricula      SERIAL PRIMARY KEY,
    id_aluno          INTEGER NOT NULL REFERENCES pessoas(id_pessoa),
    id_turma          INTEGER NOT NULL REFERENCES turmas(id_turma),
    id_funcionario    INTEGER NOT NULL REFERENCES pessoas(id_pessoa),
    data_matricula    DATE NOT NULL DEFAULT CURRENT_DATE,
    status            VARCHAR(20) NOT NULL DEFAULT 'ATIVA' CHECK (status IN ('ATIVA','CANCELADA','CONCLUIDA')),
    valor_mensalidade NUMERIC(10,2) NOT NULL CHECK (valor_mensalidade > 0),
    desconto          NUMERIC(10,2) NOT NULL DEFAULT 0.00 CHECK (desconto >= 0),
    data_cancelamento DATE,
    obs               TEXT,
    UNIQUE (id_aluno, id_turma)
);