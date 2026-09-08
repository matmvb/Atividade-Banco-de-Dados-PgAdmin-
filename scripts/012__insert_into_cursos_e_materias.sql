-- ============================================================
-- 012__insert_into_cursos_e_materias.sql
-- Cadastra o curso único "Formação Megamente" e as 8 matérias
-- que compõem a formação.
-- ============================================================

INSERT INTO cursos (id_curso, nome_curso, descricao, duracao_meses, carga_horaria_total)
VALUES (1, 'Formação Megamente',
        'Formação completa em tecnologia e robótica (STEAM): programação, '
        'desenvolvimento de games, robótica e criação de apps.',
        12, 310)
ON CONFLICT (id_curso) DO NOTHING;

INSERT INTO materias (id_materia, id_curso, nome_materia, carga_horaria, ordem)
VALUES
    (1, 1, 'Raciocínio Lógico / Empreendedorismo',     40, 1),
    (2, 1, 'Youtuber / Edição de Vídeo e Imagem',      40, 2),
    (3, 1, 'Ilustração Digital',                       30, 3),
    (4, 1, 'Jogos 2D',                                 40, 4),
    (5, 1, 'Jogos 3D',                                 40, 5),
    (6, 1, 'Programação com Minecraft',                40, 6),
    (7, 1, 'Desenvolvimento de Apps',                  40, 7),
    (8, 1, 'Robótica',                                 40, 8)
ON CONFLICT (id_materia) DO NOTHING;