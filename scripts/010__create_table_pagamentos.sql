-- pagamentos da mensalidade. quem paga é o responsável do aluno (1 por aluno).
-- o status começa como PENDENTE e a procedure do script 022 marca como
-- ATRASADO quando passa da data de vencimento sem pagar.
CREATE TABLE IF NOT EXISTS pagamentos (
    id_pagamento    SERIAL PRIMARY KEY,
    id_matricula    INTEGER NOT NULL REFERENCES matriculas(id_matricula),
    id_responsavel  INTEGER NOT NULL REFERENCES pessoas(id_pessoa),
    data_vencimento DATE NOT NULL,
    data_pagamento  DATE,
    valor           NUMERIC(10,2) NOT NULL CHECK (valor > 0),
    status          VARCHAR(20) NOT NULL DEFAULT 'PENDENTE' CHECK (status IN ('PENDENTE','PAGO','ATRASADO'))
);