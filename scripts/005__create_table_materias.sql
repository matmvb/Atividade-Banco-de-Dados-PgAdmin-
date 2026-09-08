-- ============================================================
-- 005__create_table_materias.sql
-- Matérias que compõem o curso (8 matérias da Formação Megamente).
-- A ordem indica a sequência percorrida pela turma no curso.
-- ============================================================
CREATE TABLE IF NOT EXISTS materias (
    id_materia    SERIAL PRIMARY KEY,
    id_curso      INTEGER NOT NULL REFERENCES cursos(id_curso),
    nome_materia  VARCHAR(120) NOT NULL,
    carga_horaria INTEGER NOT NULL CHECK (carga_horaria > 0),
    ordem         INTEGER NOT NULL CHECK (ordem > 0),
    UNIQUE (id_curso, nome_materia),
    UNIQUE (id_curso, ordem)
);