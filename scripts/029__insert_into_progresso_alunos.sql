-- INOVAÇÃO: GAMIFICAÇÃO
-- situação inicial do progresso dos 8 alunos. os valores de xp_total aqui
-- já vêm calculados do mesmo jeito que a procedure do script 032 faz
-- (presenças a 25 XP cada + pontos das conquistas), então o cenário é
-- consistente. o aluno id = id_pessoa na tabela pessoas.
INSERT INTO progresso_alunos (id_progresso, id_aluno, id_nivel, xp_total, data_atualizacao)
VALUES
    (1,  13, 3, 575,  '2026-09-01 08:00:00'),  -- Pedro      - Explorador
    (2,  14, 2, 250,  '2026-09-01 08:00:00'),  -- Sofia      - Aprendiz
    (3,  15, 4, 1350, '2026-09-01 08:00:00'),  -- Arthur     - Criador
    (4,  16, 2, 300,  '2026-09-01 08:00:00'),  -- Laura      - Aprendiz
    (5,  17, 3, 500,  '2026-09-01 08:00:00'),  -- Gabriel    - Explorador
    (6,  18, 1, 75,   '2026-09-01 08:00:00'),  -- Manuela    - Iniciante
    (7,  19, 1, 100,  '2026-09-01 08:00:00'),  -- Davi       - Iniciante
    (8,  20, 1, 0,    '2026-09-01 08:00:00')   -- Valentina  - Iniciante
ON CONFLICT (id_aluno) DO NOTHING;