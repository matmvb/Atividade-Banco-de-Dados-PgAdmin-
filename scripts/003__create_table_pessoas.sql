-- tabela de pessoas. juntei aluno, responsável, professor e funcionário tudo
-- aqui, porque no começo eu tinha feito uma tabela pra cada e ficava repetindo
-- nome, cpf, telefone... aí o professor sugeriu juntar e usar o tipo_pessoa.
-- o responsável do aluno é outra pessoa dessa mesma tabela (id_responsavel).
-- cada aluno tem só 1 responsável, porque é quem assina o contrato e paga.
CREATE TABLE IF NOT EXISTS pessoas (
    id_pessoa            SERIAL PRIMARY KEY,
    nome_completo        VARCHAR(150) NOT NULL,
    cpf                  VARCHAR(11)  NOT NULL UNIQUE,
    rg                   VARCHAR(15),
    data_nascimento      DATE,
    email                VARCHAR(150) UNIQUE,
    telefone             VARCHAR(20),
    telefone_alternativo VARCHAR(20),
    endereco             VARCHAR(255),
    tipo_pessoa          VARCHAR(20) NOT NULL CHECK (tipo_pessoa IN ('ALUNO','RESPONSAVEL','PROFESSOR','FUNCIONARIO')),
    cargo                VARCHAR(60),
    salario              NUMERIC(10,2),
    id_unidade           INTEGER NOT NULL REFERENCES unidades(id_unidade),
    id_responsavel       INTEGER REFERENCES pessoas(id_pessoa),
    data_ingresso        DATE NOT NULL DEFAULT CURRENT_DATE,
    status               VARCHAR(20) NOT NULL DEFAULT 'ATIVO' CHECK (status IN ('ATIVO','INATIVO')),
    CONSTRAINT chk_aluno_com_responsavel CHECK (tipo_pessoa <> 'ALUNO' OR id_responsavel IS NOT NULL),
    CONSTRAINT chk_cargo_apenas_equipe   CHECK (tipo_pessoa IN ('PROFESSOR','FUNCIONARIO') OR cargo IS NULL),
    CONSTRAINT chk_salario_apenas_equipe CHECK (tipo_pessoa IN ('PROFESSOR','FUNCIONARIO') OR salario IS NULL)
);