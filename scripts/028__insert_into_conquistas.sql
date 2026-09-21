-- INOVAÇÃO: GAMIFICAÇÃO
-- catalogo das conquistas. os pontos somam no XP do aluno. usei conquistas
-- que combinam com a rotina da escola (presença, matérias, desempenho).
INSERT INTO conquistas (id_conquista, nome_conquista, descricao, pontos, icone, condicao)
VALUES
    (1, 'Primeira Presença',    'Participou da primeira aula',              50,  '🎯', 'Registrar a 1ª presença'),
    (2, 'Frequência Perfeita',  'Não faltou nenhuma aula no mês',          150,  '📅', 'Presente em todas aulas do mês'),
    (3, 'Mestre em Programação','Completou a matéria Jogos 2D',            200,  '💻', 'Frequência em Jogos 2D em dia'),
    (4, 'Mestre em Robótica',   'Finalizou o módulo de Robótica',          200,  '🤖', 'Frequência em Robótica em dia'),
    (5, 'Super Criador',        'Entregou 3 projetos com nota máxima',     300,  '🏆', 'Projetos aprovados pelo professor'),
    (6, 'Estrela do Curso',     'Top 3 do ranking da unidade',             500,  '⭐', 'Estar no top 3 do ranking'),
    (7, 'Trilha Completa',      'Passou por todas as 8 matérias',          600,  '🌍', 'Presença em todas as matérias do curso')
ON CONFLICT (id_conquista) DO NOTHING;