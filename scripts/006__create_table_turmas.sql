-- ============================================================
-- 006__create_table_turmas.sql
-- Turmas da unidade. Em Porto Velho existem 3 turmas
-- (manhã, tarde e noite) dividindo a única sala da unidade.
-- Todas as turmas possuem o mesmo professor (1 professor
-- para o curso completo).
-- ============================================================
CREATE TABLE IF NOT EXISTS turmas (
    id_turma       SERIAL PRIMARY KEY,
    id_curso       INTEGER NOT NULL REFERENCES cursos(id_curso),
    id_unidade     INTEGER NOT NULL REFERENCES unidades(id_unidade),
    id_professor   INTEGER NOT NULL REFERENCES pessoas(id_pessoa),
    nome_turma     VARCHAR(80) NOT NULL,
    turno          VARCHAR(20) NOT NULL CHECK (turno IN ('MANHA','TARDE','NOITE')),
    horario_inicio TIME NOT NULL,
    horario_fim    TIME NOT NULL,
    UNIQUE (id_unidade, nome_turma)
);