-- INOVAÇÃO: GAMIFICAÇÃO
-- ranking da unidade: mostra o aluno, o XP acumulado, o nível e quantas
-- conquistas ele desbloqueou. qto mais XP, melhor a posição no ranking.
CREATE OR REPLACE VIEW view_ranking_alunos AS
SELECT
    pa.id_aluno,
    a.nome_completo                    AS nome_aluno,
    t.nome_turma,
    pa.xp_total,
    n.nome_nivel                       AS nivel,
    n.cor                              AS cor_nivel,
    n.icone                            AS icone_nivel,
    COUNT(ac.id_conquista)             AS total_conquistas,
    ROW_NUMBER() OVER (ORDER BY pa.xp_total DESC) AS posicao_ranking
FROM progresso_alunos pa
JOIN pessoas a       ON a.id_pessoa  = pa.id_aluno
JOIN matriculas m    ON m.id_aluno   = a.id_pessoa
JOIN turmas t        ON t.id_turma   = m.id_turma
JOIN niveis n        ON n.id_nivel   = pa.id_nivel
LEFT JOIN aluno_conquistas ac ON ac.id_aluno = pa.id_aluno
WHERE m.status = 'ATIVA'
GROUP BY pa.id_aluno, a.nome_completo, t.nome_turma, pa.xp_total, n.nome_nivel, n.cor, n.icone
ORDER BY pa.xp_total DESC;