-- INOVAÇÃO: GAMIFICAÇÃO
-- progresso do aluno: XP acumulado e o nível atual. é 1 pra 1 com o aluno
-- (1 registro por aluno), então o id_aluno tem UNIQUE. o xp_total é
-- recalculado pela procedure de XP (script 032) a partir das presenças e
-- conquistas; também dá pra ajustar na mão quando precisar.
CREATE TABLE IF NOT EXISTS progresso_alunos (
    id_progresso    SERIAL PRIMARY KEY,
    id_aluno        INTEGER NOT NULL UNIQUE REFERENCES pessoas(id_pessoa),
    id_nivel        INTEGER NOT NULL REFERENCES niveis(id_nivel),
    xp_total        INTEGER NOT NULL DEFAULT 0 CHECK (xp_total >= 0),
    data_atualizacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);