-- o curso da escola (Formação Megamente). guardei aqui também o valor da
-- mensalidade e a faixa etária, que são coisas do curso
CREATE TABLE IF NOT EXISTS cursos (
    id_curso            SERIAL PRIMARY KEY,
    nome_curso          VARCHAR(120) NOT NULL UNIQUE,
    descricao           TEXT,
    modalidade          VARCHAR(60) NOT NULL DEFAULT 'Presencial',
    carga_horaria_total INTEGER NOT NULL CHECK (carga_horaria_total > 0),
    duracao_meses       INTEGER NOT NULL CHECK (duracao_meses > 0),
    faixa_etaria        VARCHAR(30),
    tipo_curso          VARCHAR(60),
    valor_mensalidade   NUMERIC(10,2) NOT NULL DEFAULT 350.00 CHECK (valor_mensalidade > 0)
);