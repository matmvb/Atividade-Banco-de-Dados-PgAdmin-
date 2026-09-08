-- presença das aulas. coloquei chave única em (matrícula, matéria, data)
-- pra não deixar o professor lançar a mesma chamada duas vezes no dia
CREATE TABLE IF NOT EXISTS presencas (
    id_presenca  SERIAL PRIMARY KEY,
    id_matricula INTEGER NOT NULL REFERENCES matriculas(id_matricula) ON DELETE CASCADE,
    id_materia   INTEGER NOT NULL REFERENCES materias(id_materia),
    data_aula    DATE NOT NULL,
    presente     BOOLEAN NOT NULL DEFAULT TRUE,
    UNIQUE (id_matricula, id_materia, data_aula)
);