-- presenças de agosto de 2026. em algumas aulas o professor lançou falta
-- (presente = false), pra dar pra ver o controle funcionando.
INSERT INTO presencas (id_presenca, id_matricula, id_materia, data_aula, presente)
VALUES
    -- Pedro (matrícula 1)
    (1,  1, 1, '2026-08-03', TRUE),
    (2,  1, 2, '2026-08-04', TRUE),
    (3,  1, 3, '2026-08-05', FALSE),
    (4,  1, 4, '2026-08-06', TRUE),
    -- Sofia (matrícula 2)
    (5,  2, 1, '2026-08-03', TRUE),
    (6,  2, 3, '2026-08-05', TRUE),
    -- Arthur (matrícula 3)
    (7,  3, 1, '2026-08-03', FALSE),
    (8,  3, 2, '2026-08-04', TRUE),
    (9,  3, 5, '2026-08-07', TRUE),
    -- Laura (matrícula 4)
    (10, 4, 1, '2026-08-03', TRUE),
    (11, 4, 4, '2026-08-06', TRUE),
    -- Gabriel (matrícula 5)
    (12, 5, 6, '2026-08-08', TRUE),
    (13, 5, 1, '2026-08-03', TRUE),
    -- Manuela (matrícula 6)
    (14, 6, 1, '2026-08-03', TRUE),
    (15, 6, 8, '2026-08-11', FALSE),
    -- Davi (matrícula 7)
    (16, 7, 1, '2026-08-03', TRUE),
    (17, 7, 7, '2026-08-10', TRUE)
ON CONFLICT (id_matricula, id_materia, data_aula) DO NOTHING;