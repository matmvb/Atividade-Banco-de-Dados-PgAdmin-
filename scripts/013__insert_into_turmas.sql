-- ============================================================
-- 013__insert_into_turmas.sql
-- As 3 turmas da unidade de Porto Velho dividem a única sala:
-- manhã, tarde e noite. Todas têm o mesmo professor (id 9).
-- ============================================================
INSERT INTO turmas (id_turma, id_curso, id_unidade, id_professor, nome_turma, turno, horario_inicio, horario_fim)
VALUES
    (1, 1, 1, 9, 'TURMA MANHÃ', 'MANHA', '08:00:00', '12:00:00'),
    (2, 1, 1, 9, 'TURMA TARDE', 'TARDE', '13:30:00', '17:30:00'),
    (3, 1, 1, 9, 'TURMA NOITE', 'NOITE', '18:30:00', '21:30:00')
ON CONFLICT (id_turma) DO NOTHING;