-- ============================================================
-- 004__create_table_cursos.sql
-- A escola possui um curso único: "Formação Megamente",
-- composto por 8 matérias percorridas pelas turmas.
-- ============================================================
CREATE TABLE IF NOT EXISTS cursos (
    id_curso            SERIAL PRIMARY KEY,
    nome_curso          VARCHAR(120) NOT NULL UNIQUE,
    descricao           TEXT,
    duracao_meses       INTEGER NOT NULL CHECK (duracao_meses > 0),
    carga_horaria_total INTEGER NOT NULL CHECK (carga_horaria_total > 0)
);