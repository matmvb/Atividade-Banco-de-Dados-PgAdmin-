-- ============================================================
-- 015__insert_into_matriculas.sql
-- Matrículas dos 8 alunos nas 3 turmas (R$ 350,00 de mensalidade).
-- id_funcionario indica quem registrou a matrícula (secretaria
-- id 10 ou coordenador id 11). desconto exemplifica desconto
-- promocional aplicado na matrícula 3 (Arthur).
-- Turma 1 (manhã): alunos 13, 14 | Turma 2 (tarde): 15, 16, 17
-- Turma 3 (noite): 18, 19, 20
-- ============================================================
INSERT INTO matriculas (id_matricula, id_aluno, id_turma, id_funcionario, data_matricula, status, valor_mensalidade, desconto, data_cancelamento, obs)
VALUES
    (1, 13, 1, 10, '2026-02-01', 'ATIVA',     350.00, 0.00, NULL, NULL),
    (2, 14, 1, 10, '2026-02-01', 'ATIVA',     350.00, 0.00, NULL, NULL),
    (3, 15, 2, 10, '2026-02-01', 'ATIVA',     350.00, 50.00, NULL, 'Desconto de irmão na mesma unidade'),
    (4, 16, 2, 11, '2026-03-05', 'ATIVA',     350.00, 0.00, NULL, NULL),
    (5, 17, 2, 11, '2026-06-01', 'ATIVA',     350.00, 0.00, NULL, NULL),
    (6, 18, 3, 10, '2026-04-10', 'ATIVA',     350.00, 0.00, NULL, NULL),
    (7, 19, 3, 10, '2026-04-10', 'ATIVA',     350.00, 0.00, NULL, NULL),
    (8, 20, 3, 10, '2026-05-20', 'ATIVA',     350.00, 0.00, NULL, NULL)
ON CONFLICT (id_matricula) DO NOTHING;