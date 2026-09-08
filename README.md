# Escola Megamente - Banco de Dados (Unidade Porto Velho)

Trabalho da disciplina de banco de dados feito com **PostgreSQL** + **PgAdmin**.

## Identificação do grupo

- **Grupo:** G2-04
- **Banco de dados:** db18
- **Usuário de acesso:** aluno18
- **Host de conexão:** core_pgafya

### Integrantes

- MATHEUS DE VASCONCELLOS BARBOSA
- NICOLAS DE LAIA FERREIRA FONSECA
- JOÃO PEDRO MENDES DE QUEIROZ
- LUCAS FELIPE
- NICOLAS MOURA

---

O tema escolhido foi a **Escola Megamente**, uma escola de programação,
robótica e games para crianças e adolescentes, que trabalha a metodologia
STEAM. Modelei a unidade de **Porto Velho/RO**.

## Apresentação

A escola tem mais de uma unidade espalhada pelo Brasil, então comecei criando
uma tabela de unidades — dá pra cadastrar outras unidades depois sem mexer no
resto.

Na unidade de Porto Velho tem **1 sala de aula só**, **1 professor** e **3
turmas** (manhã, tarde e noite) que se revezam na sala. O curso é único: a
**Formação Megamente**, com **8 matérias**. As turmas passam por todas as
matérias durante o curso. As aulas são presenciais.

### Objetivo

Organizar num banco só as coisas do dia a dia da escola:

- cadastro de alunos, responsáveis, professor e funcionários;
- turmas e as matérias do curso;
- matrículas (com valor e desconto);
- presença das aulas;
- pagamentos das mensalidades (quem paga é o responsável).

Assim a secretaria e o financeiro não dependem mais de planilha.

### Público-alvo

- **Secretaria** — cadastro de alunos, responsáveis, turmas e matrículas;
- **Professor** — lançar a presença das aulas;
- **Financeiro** — ver quem está devendo mensalidade;
- **Direção** — acompanhar quantos alunos tem em cada turma.

## Como eu modelei

- juntei aluno, responsável, professor e funcionário numa tabela **pessoas**
  só, pra não repetir nome/cpf/telefone em quatro tabelas parecidas;
- cada aluno tem **1 responsável** (é quem assina o contrato e paga a
  mensalidade) — apontado pelo campo `id_responsavel`;
- a **turma** pertence a uma unidade e a um curso, e tem o professor;
- a turma liga com as **8 matérias** pela tabela `turma_materias`;
- a **matrícula** guarda o valor e um possível desconto (ex.: desconto de
  irmão);
- a **presença** é registrada por matrícula + matéria + data da aula;
- o **pagamento** é da matrícula e quem paga é o responsável.

### Modelo de dados (diagrama)

```mermaid
erDiagram
    UNIDADES {
        serial id_unidade PK
        varchar nome
        varchar cidade
        varchar estado
        varchar endereco
        varchar telefone
        int qtde_salas
    }

    CURSOS {
        serial id_curso PK
        varchar nome_curso
        text descricao
        varchar modalidade
        int carga_horaria_total
        int duracao_meses
        varchar faixa_etaria
        varchar tipo_curso
        numeric valor_mensalidade
    }

    MATERIAS {
        serial id_materia PK
        int id_curso FK
        varchar nome_materia
        int carga_horaria
        int ordem
    }

    PESSOAS {
        serial id_pessoa PK
        varchar nome_completo
        char cpf UK
        varchar rg
        date data_nascimento
        varchar email
        varchar telefone
        varchar telefone_alternativo
        varchar endereco
        varchar tipo_pessoa
        varchar cargo
        numeric salario
        int id_unidade FK
        int id_responsavel FK
        date data_ingresso
        varchar status
    }

    TURMAS {
        serial id_turma PK
        int id_curso FK
        int id_unidade FK
        int id_professor FK
        varchar nome_turma
        varchar codigo UK
        varchar turno
        time horario_inicio
        time horario_fim
        varchar sala
        int vagas
        date data_inicio
        date data_fim
    }

    TURMA_MATERIAS {
        int id_turma PK,FK
        int id_materia PK,FK
        varchar dia_semana
    }

    MATRICULAS {
        serial id_matricula PK
        int id_aluno FK
        int id_turma FK
        int id_funcionario FK
        date data_matricula
        varchar status
        numeric valor_mensalidade
        numeric desconto
        date data_cancelamento
        text obs
    }

    PRESENCAS {
        serial id_presenca PK
        int id_matricula FK
        int id_materia FK
        date data_aula
        boolean presente
    }

    PAGAMENTOS {
        serial id_pagamento PK
        int id_matricula FK
        int id_responsavel FK
        date data_vencimento
        date data_pagamento
        numeric valor
        varchar status
    }

    UNIDADES ||--o{ PESSOAS : "emprega / atende"
    UNIDADES ||--o{ TURMAS : "abriga"
    CURSOS ||--o{ MATERIAS : "composto por"
    CURSOS ||--o{ TURMAS : "gera turmas"
    MATERIAS ||--o{ TURMA_MATERIAS : "ministrada em"
    TURMAS ||--o{ TURMA_MATERIAS : "percorre"
    PESSOAS ||--o{ PESSOAS : "responsável pelo aluno"
    PESSOAS ||--o{ TURMAS : "professor leciona"
    PESSOAS ||--o{ MATRICULAS : "aluno e funcionário"
    TURMAS ||--o{ MATRICULAS : "recebe matrículas"
    MATRICULAS ||--o{ PRESENCAS : "registra frequência"
    MATERIAS ||--o{ PRESENCAS : "referência"
    MATRICULAS ||--o{ PAGAMENTOS : "gera mensalidades"
    PESSOAS ||--o{ PAGAMENTOS : "responsável paga"
```

## Estrutura dos arquivos

```
├── README.md
└── scripts/
    ├── 001__create_database_escola_megamente.sql   (guia de criação do banco)
    ├── 002__create_table_unidades.sql              (criação das tabelas - DDL)
    ├── 003__create_table_pessoas.sql
    ├── 004__create_table_cursos.sql
    ├── 005__create_table_materias.sql
    ├── 006__create_table_turmas.sql
    ├── 007__create_table_turma_materias.sql
    ├── 008__create_table_matriculas.sql
    ├── 009__create_table_presencas.sql
    ├── 010__create_table_pagamentos.sql
    ├── 011__insert_into_unidades_e_pessoas.sql     (dados de exemplo - DML)
    ├── 012__insert_into_cursos_e_materias.sql
    ├── 013__insert_into_turmas.sql
    ├── 014__insert_into_turma_materias.sql
    ├── 015__insert_into_matriculas.sql
    ├── 016__insert_into_presencas.sql
    ├── 017__insert_into_pagamentos.sql
    ├── 018__update_dados_exemplo.sql               (teste do UPDATE)
    ├── 019__delete_dados_exemplo.sql               (teste do DELETE)
    ├── 020__create_view_alunos_matriculados.sql    (views)
    ├── 021__create_view_pagamentos_pendentes.sql
    └── 022__create_or_replace_procedure_atualiza_status_pagamentos.sql
```

## Execução

Os scripts estão numerados na ordem de execução (001 ao 022). Eles podem ser
rodados mais de uma vez sem erro, porque as tabelas usam `CREATE TABLE IF NOT
EXISTS` e os inserts usam `ON CONFLICT DO NOTHING`.

## Anotações / o que eu aprendi

- o `CREATE DATABASE` do Postgres **não tem** `IF NOT EXISTS`, por isso o
  script `001` é mais um guia do que um script de fato;
- se tentar apagar um responsável que tem aluno apontando pra ele, o banco
  recusa (chave estrangeira) — deixei um exemplo disso comentado no `019`;
- coloquei `salario` na tabela de pessoas, mas ele só é preenchido pra
  professor e funcionários (restrição `CHECK`);
- os CPFs, e-mails e endereços dos dados de exemplo são **fictícios**.
