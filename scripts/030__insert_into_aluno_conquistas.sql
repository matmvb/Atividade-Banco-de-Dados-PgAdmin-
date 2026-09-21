-- INOVAÇÃO: GAMIFICAÇÃO
-- conquistas desbloqueadas por cada aluno. os pontos delas somam no xp_total
-- do aluno (junto com as presenças). cada linha tem a data que a conquista
-- foi desbloqueada.
INSERT INTO aluno_conquistas (id_aluno, id_conquista, data_conquista)
VALUES
    -- Pedro (13): 25 (presença) + 550 (conquistas 1, 3 e 5) = 575
    (13, 1, '2026-03-01'),
    (13, 3, '2026-07-20'),
    (13, 5, '2026-08-25'),
    -- Sofia (14): 50 + 200 (conquistas 1 e 2) = 250
    (14, 1, '2026-03-01'),
    (14, 2, '2026-08-29'),
    -- Arthur (15): 50 + 1300 (conquistas 1, 2, 4, 5 e 7) = 1350
    (15, 1, '2026-03-01'),
    (15, 2, '2026-08-29'),
    (15, 4, '2026-09-10'),
    (15, 5, '2026-08-25'),
    (15, 7, '2026-09-15'),
    -- Laura (16): 50 + 250 (conquistas 1 e 3) = 300
    (16, 1, '2026-03-15'),
    (16, 3, '2026-08-30'),
    -- Gabriel (17): 50 + 450 (conquistas 2 e 5) = 500
    (17, 2, '2026-08-29'),
    (17, 5, '2026-08-25'),
    -- Manuela (18): 25 + 50 (conquista 1) = 75
    (18, 1, '2026-04-20'),
    -- Davi (19): 50 + 50 (conquista 1) = 100
    (19, 1, '2026-04-20')
ON CONFLICT (id_aluno, id_conquista) DO NOTHING;