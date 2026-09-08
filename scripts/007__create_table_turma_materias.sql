-- ============================================================
-- 007__create_table_turma_materias.sql
-- Tabela associativa: cada turma percorre integralmente
-- as 8 matérias do curso (Formação Megamente).
-- O dia_semana indica quando a matéria é ministrada.
-- ============================================================
CREATE TABLE IF NOT EXISTS turma_materias (
    id_turma   INTEGER NOT NULL REFERENCES turmas(id_turma)   ON DELETE CASCADE,
    id_materia INTEGER NOT NULL REFERENCES materias(id_materia) ON DELETE CASCADE,
    dia_semana VARCHAR(20) NOT NULL CHECK (dia_semana IN ('SEGUNDA','TERCA','QUARTA','QUINTA','SEXTA','SABADO')),
    PRIMARY KEY (id_turma, id_materia)
);