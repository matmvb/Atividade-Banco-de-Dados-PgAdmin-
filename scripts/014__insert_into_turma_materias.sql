-- ============================================================
-- 014__insert_into_turma_materias.sql
-- Cada turma percorre integralmente as 8 matérias do curso.
-- 3 turmas x 8 matérias = 24 registros.
-- ============================================================
INSERT INTO turma_materias (id_turma, id_materia, dia_semana)
VALUES
    -- Turma 1 (manhã)
    (1, 1, 'SEGUNDA'),
    (1, 2, 'TERCA'),
    (1, 3, 'QUARTA'),
    (1, 4, 'QUINTA'),
    (1, 5, 'SEXTA'),
    (1, 6, 'SABADO'),
    (1, 7, 'SEGUNDA'),
    (1, 8, 'TERCA'),
    -- Turma 2 (tarde)
    (2, 1, 'SEGUNDA'),
    (2, 2, 'TERCA'),
    (2, 3, 'QUARTA'),
    (2, 4, 'QUINTA'),
    (2, 5, 'SEXTA'),
    (2, 6, 'SABADO'),
    (2, 7, 'SEGUNDA'),
    (2, 8, 'TERCA'),
    -- Turma 3 (noite)
    (3, 1, 'SEGUNDA'),
    (3, 2, 'TERCA'),
    (3, 3, 'QUARTA'),
    (3, 4, 'QUINTA'),
    (3, 5, 'SEXTA'),
    (3, 6, 'SABADO'),
    (3, 7, 'SEGUNDA'),
    (3, 8, 'TERCA')
ON CONFLICT (id_turma, id_materia) DO NOTHING;