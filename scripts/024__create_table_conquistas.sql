-- INOVAÇÃO: GAMIFICAÇÃO
-- catálogo de conquistas da escola. cada conquista vale uma quantidade de
-- pontos (XP) que entra na conta do aluno quando ele a desbloqueia.
-- a condicao é só descritiva (pra gente saber como desbloquear); quem marca
-- na prática é a pessoa cadastrando a conquista ou a procedure de XP.
CREATE TABLE IF NOT EXISTS conquistas (
    id_conquista   SERIAL PRIMARY KEY,
    nome_conquista VARCHAR(100) NOT NULL UNIQUE,
    descricao      TEXT,
    pontos         INTEGER NOT NULL CHECK (pontos > 0),
    icone          VARCHAR(60),
    condicao       VARCHAR(200)
);