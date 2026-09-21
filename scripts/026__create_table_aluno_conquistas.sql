-- INOVAÇÃO: GAMIFICAÇÃO
-- liga aluno e conquista (N:N). um aluno pode ter várias conquistas e cada
-- conquista vale pra vários alunos. guardo a data que ele conquistou.
CREATE TABLE IF NOT EXISTS aluno_conquistas (
    id_aluno       INTEGER NOT NULL REFERENCES pessoas(id_pessoa) ON DELETE CASCADE,
    id_conquista   INTEGER NOT NULL REFERENCES conquistas(id_conquista) ON DELETE CASCADE,
    data_conquista DATE NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY (id_aluno, id_conquista)
);