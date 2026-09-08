-- ============================================================
-- 003__create_table_pessoas.sql
-- Tabela única para alunos, responsáveis, professores e
-- funcionários. O responsável do aluno é um auto-relacionamento
-- (id_responsavel aponta para outra pessoa desta mesma tabela).
-- Todo aluno DEVE ter exatamente um responsável (1 responsável
-- por aluno, conforme contrato).
-- ============================================================
CREATE TABLE IF NOT EXISTS pessoas (
    id_pessoa       SERIAL PRIMARY KEY,
    nome_completo   VARCHAR(150) NOT NULL,
    cpf             VARCHAR(11)  NOT NULL UNIQUE,
    data_nascimento DATE,
    email           VARCHAR(150) UNIQUE,
    telefone        VARCHAR(20),
    tipo_pessoa     VARCHAR(20) NOT NULL CHECK (tipo_pessoa IN ('ALUNO','RESPONSAVEL','PROFESSOR','FUNCIONARIO')),
    cargo           VARCHAR(60),
    id_unidade      INTEGER NOT NULL REFERENCES unidades(id_unidade),
    id_responsavel  INTEGER REFERENCES pessoas(id_pessoa),
    data_ingresso   DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT chk_aluno_com_responsavel CHECK (tipo_pessoa <> 'ALUNO' OR id_responsavel IS NOT NULL),
    CONSTRAINT chk_cargo_apenas_equipe   CHECK (tipo_pessoa IN ('PROFESSOR','FUNCIONARIO') OR cargo IS NULL)
);