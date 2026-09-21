-- INOVAÇÃO: GAMIFICAÇÃO
-- os 5 níveis da escola. o xp_max do último é alto de propósito porque o
-- "Mestre Megamente" não tem teto.
INSERT INTO niveis (id_nivel, nome_nivel, xp_min, xp_max, titulo, cor, icone)
VALUES
    (1, 'Iniciante',  0,    199, 'Começando a jornada', '#9e9e9e', '🌱'),
    (2, 'Aprendiz',   200,  499, 'Já sabe o caminho',   '#2196f3', '🚀'),
    (3, 'Explorador', 500,  999, 'Explorando o mundo tech', '#ff9800', '🧭'),
    (4, 'Criador',    1000, 1999, 'Criando projetos incríveis', '#9c27b0', '🛠️'),
    (5, 'Mestre Megamente', 2000, 99999, 'Lenda da escola', '#f44336', '👑')
ON CONFLICT (id_nivel) DO NOTHING;