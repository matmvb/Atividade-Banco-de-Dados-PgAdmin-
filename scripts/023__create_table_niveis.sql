-- INOVAÇÃO: GAMIFICAÇÃO
-- tabela de níveis do jogo. o aluno acumula XP conforme participa (presenças,
-- conquistas) e vai subindo de nível. coloquei faixas de XP pra facilitar o
-- cálculo: aluno com 500 de XP cai no nível "Explorador", etc.
CREATE TABLE IF NOT EXISTS niveis (
    id_nivel    SERIAL PRIMARY KEY,
    nome_nivel  VARCHAR(40) NOT NULL UNIQUE,
    xp_min      INTEGER NOT NULL CHECK (xp_min >= 0),
    xp_max      INTEGER NOT NULL CHECK (xp_max > xp_min),
    titulo      VARCHAR(80),
    cor         VARCHAR(20) DEFAULT '#4caf50',
    icone       VARCHAR(60)
);