-- INOVAÇÃO: GAMIFICAÇÃO
-- procedure que recalcula o XP de todos os alunos com matrícula ativa a
-- partir das presenças (25 XP por presença) somadas aos pontos das
-- conquistas, e já reajusta o nível de cada um pela faixa de XP.
-- dá pra rodar toda semana pra manter o ranking atualizado (CALL).
CREATE OR REPLACE PROCEDURE proc_recalcula_xp_alunos()
LANGUAGE plpgsql
AS $$
BEGIN
    -- zera o xp pra recalcular do zero (evita soma acumulada indevida)
    UPDATE progresso_alunos pa
    SET xp_total = 0;

    -- soma 25 XP por presença confirmada (presente = TRUE)
    UPDATE progresso_alunos pa
    SET xp_total = pa.xp_total + (
        SELECT COUNT(*) * 25
        FROM presencas p
        JOIN matriculas m ON m.id_matricula = p.id_matricula
        WHERE m.id_aluno = pa.id_aluno
          AND m.status = 'ATIVA'
          AND p.presente = TRUE
    );

    -- soma os pontos de cada conquista desbloqueada
    UPDATE progresso_alunos pa
    SET xp_total = pa.xp_total + COALESCE((
        SELECT SUM(c.pontos)
        FROM aluno_conquistas ac
        JOIN conquistas c ON c.id_conquista = ac.id_conquista
        WHERE ac.id_aluno = pa.id_aluno
    ), 0);

    -- define o nível conforme a faixa de XP
    UPDATE progresso_alunos pa
    SET id_nivel = (
        SELECT n.id_nivel
        FROM niveis n
        WHERE pa.xp_total BETWEEN n.xp_min AND n.xp_max
        ORDER BY n.xp_min DESC
        LIMIT 1
    ),
    data_atualizacao = CURRENT_TIMESTAMP;

    RAISE NOTICE 'XP dos alunos recalculado e níveis atualizados.';
END;
$$;

-- Chamada da procedure para validar:
-- CALL proc_recalcula_xp_alunos();