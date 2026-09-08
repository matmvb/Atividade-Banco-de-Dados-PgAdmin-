-- ============================================================
-- 009__create_table_presencas.sql
-- Controle de presença (aulas presenciais). Uma presença é
-- registrada por matrícula (aluno), matéria e data de aula.
-- ============================================================
CREATE TABLE IF NOT EXISTS presencas (
    id_presenca  SERIAL PRIMARY KEY,
    id_matricula INTEGER NOT NULL REFERENCES matriculas(id_matricula) ON DELETE CASCADE,
    id_materia   INTEGER NOT NULL REFERENCES materias(id_materia),
    data_aula    DATE NOT NULL,
    presente     BOOLEAN NOT NULL DEFAULT TRUE,
    UNIQUE (id_matricula, id_materia, data_aula)
);