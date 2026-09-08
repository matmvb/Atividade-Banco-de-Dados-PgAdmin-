-- ============================================================
-- 013__insert_into_turmas.sql
-- As 3 turmas da unidade de Porto Velho dividem a única sala:
-- manhã, tarde e noite. Todas têm o mesmo professor (id 9).
-- ============================================================
INSERT INTO turmas (id_turma, id_curso, id_unidade, id_professor, nome_turma, codigo, turno, horario_inicio, horario_fim, sala, vagas, data_inicio, data_fim)
VALUES
    (1, 1, 1, 9, 'TURMA MANHÃ', 'PV-MAN-01', 'MANHA', '08:00:00', '12:00:00', 'Sala 01', 15, '2026-02-02', '2027-01-29'),
    (2, 1, 1, 9, 'TURMA TARDE', 'PV-TAR-01', 'TARDE', '13:30:00', '17:30:00', 'Sala 01', 15, '2026-02-02', '2027-01-29'),
    (3, 1, 1, 9, 'TURMA NOITE', 'PV-NOI-01', 'NOITE', '18:30:00', '21:30:00', 'Sala 01', 15, '2026-02-02', '2027-01-29')
ON CONFLICT (id_turma) DO NOTHING;