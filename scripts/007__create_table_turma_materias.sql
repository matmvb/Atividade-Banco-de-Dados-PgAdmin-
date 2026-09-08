-- tabela que liga turma e matéria (cada turma faz as 8 matérias do curso).
-- o dia_semana é só pra dizer em qual dia da semana aquela matéria rola
CREATE TABLE IF NOT EXISTS turma_materias (
    id_turma   INTEGER NOT NULL REFERENCES turmas(id_turma)   ON DELETE CASCADE,
    id_materia INTEGER NOT NULL REFERENCES materias(id_materia) ON DELETE CASCADE,
    dia_semana VARCHAR(20) NOT NULL CHECK (dia_semana IN ('SEGUNDA','TERCA','QUARTA','QUINTA','SEXTA','SABADO')),
    PRIMARY KEY (id_turma, id_materia)
);