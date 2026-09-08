-- ============================================================
-- 011__insert_into_unidades_e_pessoas.sql
-- Cadastra a unidade de Porto Velho e as pessoas: responsáveis
-- (1 a 8), professor (9), funcionários (10 a 12) e alunos
-- (13 a 20). Cada aluno possui exatamente 1 responsável.
-- ============================================================

-- Unidade
INSERT INTO unidades (id_unidade, nome, cidade, estado, endereco, telefone, qtde_salas)
VALUES (1, 'Megamente Porto Velho', 'Porto Velho', 'RO',
        'Porto Velho Shopping, Rua Prefeito Chiquilito Erse, nº 3288',
        '(69) 3221-0000', 1)
ON CONFLICT (id_unidade) DO NOTHING;

-- Responsáveis (id 1 a 8)
INSERT INTO pessoas (id_pessoa, nome_completo, cpf, data_nascimento, email, telefone, tipo_pessoa, id_unidade, data_ingresso)
VALUES
    ( 1, 'Maria Fátima Alves',     '11144477701', '1980-03-12', 'maria.alves@email.com',   '(69) 98411-0001', 'RESPONSAVEL', 1, '2026-01-15'),
    ( 2, 'João Pedro Castro',      '22255588802', '1978-07-25', 'joao.castro@email.com',   '(69) 98411-0002', 'RESPONSAVEL', 1, '2026-01-15'),
    ( 3, 'Ricardo Mendes',         '33366699903', '1982-01-09', 'ricardo.mendes@email.com','(69) 98411-0003', 'RESPONSAVEL', 1, '2026-02-01'),
    ( 4, 'Ana Lúcia Ferreira',     '44411122204', '1985-11-30', 'ana.ferreira@email.com',  '(69) 98411-0004', 'RESPONSAVEL', 1, '2026-02-01'),
    ( 5, 'Paulo Teixeira',         '55522233305', '1979-04-18', 'paulo.teixeira@email.com','(69) 98411-0005', 'RESPONSAVEL', 1, '2026-03-05'),
    ( 6, 'Carla Cardoso',          '66633344406', '1983-09-22', 'carla.cardoso@email.com', '(69) 98411-0006', 'RESPONSAVEL', 1, '2026-03-05'),
    ( 7, 'Roberto Sousa',          '77744455507', '1981-12-01', 'roberto.sousa@email.com', '(69) 98411-0007', 'RESPONSAVEL', 1, '2026-04-10'),
    ( 8, 'Patrícia Azevedo',       '88855566608', '1986-06-14', 'patricia.azevedo@email.com','(69) 98411-0008','RESPONSAVEL', 1, '2026-04-10')
ON CONFLICT (id_pessoa) DO NOTHING;

-- Professor (id 9)
INSERT INTO pessoas (id_pessoa, nome_completo, cpf, data_nascimento, email, telefone, tipo_pessoa, cargo, id_unidade, data_ingresso)
VALUES (9, 'Carlos Eduardo Menezes', '99966677709', '1990-05-20',
        'professor.carlos@megamente.com.br', '(69) 98411-0009',
        'PROFESSOR', 'Professor Geral', 1, '2024-03-01')
ON CONFLICT (id_pessoa) DO NOTHING;

-- Funcionários (id 10 a 12)
INSERT INTO pessoas (id_pessoa, nome_completo, cpf, data_nascimento, email, telefone, tipo_pessoa, cargo, id_unidade, data_ingresso)
VALUES
    (10, 'Renata Oliveira',        '12345678910', '1992-02-08', 'renata.oliveira@megamente.com.br', '(69) 98411-0010', 'FUNCIONARIO', 'Secretária',            1, '2023-08-01'),
    (11, 'Marcos Vinícius Santos', '98765432111', '1988-10-11', 'marcos.santos@megamente.com.br', '(69) 98411-0011', 'FUNCIONARIO', 'Coordenador Pedagógico', 1, '2023-08-01'),
    (12, 'Fernanda Costa',         '11223344512', '1984-07-28', 'fernanda.costa@megamente.com.br','(69) 98411-0012','FUNCIONARIO', 'Diretora',              1, '2022-01-10')
ON CONFLICT (id_pessoa) DO NOTHING;

-- Alunos (id 13 a 20), cada um com seu responsável
INSERT INTO pessoas (id_pessoa, nome_completo, cpf, data_nascimento, email, telefone, tipo_pessoa, id_unidade, id_responsavel, data_ingresso)
VALUES
    (13, 'Pedro Henrique Alves',   '20253040513', '2015-03-10', NULL,                   '(69) 99811-0013', 'ALUNO', 1,  1, '2026-02-01'),
    (14, 'Sofia Lima Castro',      '30354050614', '2016-08-22', NULL,                   '(69) 99811-0014', 'ALUNO', 1,  2, '2026-02-01'),
    (15, 'Arthur Mendes Rocha',    '40465060715', '2014-11-05', NULL,                   '(69) 99811-0015', 'ALUNO', 1,  3, '2026-02-01'),
    (16, 'Laura Ferreira Dias',    '50576070816', '2017-01-18', NULL,                   '(69) 99811-0016', 'ALUNO', 1,  4, '2026-03-05'),
    (17, 'Gabriel Teixeira Nunes', '60687080917', '2013-06-30', NULL,                   '(69) 99811-0017', 'ALUNO', 1,  5, '2026-03-05'),
    (18, 'Manuela Cardoso Reis',   '70798091018', '2015-09-14', NULL,                   '(69) 99811-0018', 'ALUNO', 1,  6, '2026-04-10'),
    (19, 'Davi Sousa Pinto',       '80809101119', '2016-04-21', NULL,                   '(69) 99811-0019', 'ALUNO', 1,  7, '2026-04-10'),
    (20, 'Valentina Azevedo Gomes','90910211220', '2018-02-08', NULL,                   '(69) 99811-0020', 'ALUNO', 1,  8, '2026-05-20')
ON CONFLICT (id_pessoa) DO NOTHING;