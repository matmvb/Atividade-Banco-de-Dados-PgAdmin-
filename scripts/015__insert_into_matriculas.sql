-- ============================================================
-- 015__insert_into_matriculas.sql
-- Matrículas dos 8 alunos nas 3 turmas (US$350,00 de mensalidade).
-- Turma 1 (manhã): alunos 13, 14 | Turma 2 (tarde): 15, 16, 17
-- Turma 3 (noite): 18, 19, 20
-- ============================================================
INSERT INTO matriculas (id_matricula, id_aluno, id_turma, data_matricula, status, valor_mensalidade)
VALUES
    (1, 13, 1, '2026-02-01', 'ATIVA', 350.00),
    (2, 14, 1, '2026-02-01', 'ATIVA', 350.00),
    (3, 15, 2, '2026-02-01', 'ATIVA', 350.00),
    (4, 16, 2, '2026-03-05', 'ATIVA', 350.00),
    (5, 17, 2, '2026-06-01', 'ATIVA', 350.00),
    (6, 18, 3, '2026-04-10', 'ATIVA', 350.00),
    (7, 19, 3, '2026-04-10', 'ATIVA', 350.00),
    (8, 20, 3, '2026-05-20', 'ATIVA', 350.00)
ON CONFLICT (id_matricula) DO NOTHING;