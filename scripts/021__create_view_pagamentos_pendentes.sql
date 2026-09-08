-- ============================================================
-- 021__create_view_pagamentos_pendentes.sql
-- View que lista as mensalidades ainda não pagas (PENDENTE ou
-- ATRASADO), mostrando aluno, responsável e valor em aberto.
-- ============================================================
CREATE OR REPLACE VIEW view_pagamentos_pendentes AS
SELECT
    pg.id_pagamento,
    a.nome_completo            AS nome_aluno,
    r.nome_completo            AS nome_responsavel,
    t.nome_turma,
    pg.data_vencimento,
    pg.valor,
    pg.status                  AS status_pagamento,
    CASE
        WHEN pg.data_vencimento < CURRENT_DATE THEN 'VENCIDO'
        ELSE 'A VENCER'
    END                        AS situacao
FROM pagamentos pg
JOIN matriculas m ON m.id_matricula   = pg.id_matricula
JOIN pessoas a    ON a.id_pessoa      = m.id_aluno
JOIN pessoas r    ON r.id_pessoa      = pg.id_responsavel
JOIN turmas t     ON t.id_turma       = m.id_turma
WHERE pg.status IN ('PENDENTE', 'ATRASADO');