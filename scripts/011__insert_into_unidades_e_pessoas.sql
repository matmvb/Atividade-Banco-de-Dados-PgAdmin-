-- cadastro da unidade de porto velho e das pessoas.
-- ids 1 a 8 = responsáveis; 9 = professor; 10 a 12 = funcionários;
-- 13 a 20 = alunos (cada um com o seu responsável).
-- os cpfs e endereços são todos fictícios.

-- Unidade
INSERT INTO unidades (id_unidade, nome, cidade, estado, endereco, telefone, qtde_salas)
VALUES (1, 'Megamente Porto Velho', 'Porto Velho', 'RO',
        'Porto Velho Shopping, Rua Prefeito Chiquilito Erse, nº 3288',
        '(69) 3221-0000', 1)
ON CONFLICT (id_unidade) DO NOTHING;

-- Responsáveis (id 1 a 8)
INSERT INTO pessoas (id_pessoa, nome_completo, cpf, rg, data_nascimento, email, telefone, telefone_alternativo, endereco, tipo_pessoa, id_unidade, data_ingresso, status)
VALUES
    ( 1, 'Maria Fátima Alves',      '11144477701', '1203456', '1980-03-12', 'maria.alves@email.com',     '(69) 98411-0001', '(69) 3221-1010', 'Rua A, 100 - Centro',      'RESPONSAVEL', 1, '2026-01-15', 'ATIVO'),
    ( 2, 'João Pedro Castro',       '22255588802', '1304567', '1978-07-25', 'joao.castro@email.com',     '(69) 98411-0002', NULL,             'Rua B, 200 - Centro',      'RESPONSAVEL', 1, '2026-01-15', 'ATIVO'),
    ( 3, 'Ricardo Mendes',          '33366699903', '1405678', '1982-01-09', 'ricardo.mendes@email.com',  '(69) 98411-0003', '(69) 3221-2020', 'Av. C, 300 - Zona Sul',    'RESPONSAVEL', 1, '2026-02-01', 'ATIVO'),
    ( 4, 'Ana Lúcia Ferreira',      '44411122204', '1506789', '1985-11-30', 'ana.ferreira@email.com',    '(69) 98411-0004', NULL,             'Rua D, 400 - Zona Leste',  'RESPONSAVEL', 1, '2026-02-01', 'ATIVO'),
    ( 5, 'Paulo Teixeira',          '55522233305', '1607891', '1979-04-18', 'paulo.teixeira@email.com',  '(69) 98411-0005', '(69) 3221-3030', 'Rua E, 500 - Zona Norte',  'RESPONSAVEL', 1, '2026-03-05', 'ATIVO'),
    ( 6, 'Carla Cardoso',           '66633344406', '1708912', '1983-09-22', 'carla.cardoso@email.com',   '(69) 98411-0006', NULL,             'Av. F, 600 - Zona Sul',    'RESPONSAVEL', 1, '2026-03-05', 'ATIVO'),
    ( 7, 'Roberto Sousa',           '77744455507', '1809123', '1981-12-01', 'roberto.sousa@email.com',   '(69) 98411-0007', '(69) 3221-4040', 'Rua G, 700 - Centro',      'RESPONSAVEL', 1, '2026-04-10', 'ATIVO'),
    ( 8, 'Patrícia Azevedo',        '88855566608', '1910234', '1986-06-14', 'patricia.azevedo@email.com','(69) 98411-0008', NULL,             'Av. H, 800 - Zona Leste',  'RESPONSAVEL', 1, '2026-04-10', 'ATIVO')
ON CONFLICT (id_pessoa) DO NOTHING;

-- Professor (id 9)
INSERT INTO pessoas (id_pessoa, nome_completo, cpf, rg, data_nascimento, email, telefone, endereco, tipo_pessoa, cargo, salario, id_unidade, data_ingresso, status)
VALUES (9, 'Carlos Eduardo Menezes', '99966677709', '2011345', '1990-05-20',
        'professor.carlos@megamente.com.br', '(69) 98411-0009',
        'Rua I, 900 - Zona Norte',
        'PROFESSOR', 'Professor Geral', 4500.00, 1, '2024-03-01', 'ATIVO')
ON CONFLICT (id_pessoa) DO NOTHING;

-- Funcionários (id 10 a 12)
INSERT INTO pessoas (id_pessoa, nome_completo, cpf, rg, data_nascimento, email, telefone, endereco, tipo_pessoa, cargo, salario, id_unidade, data_ingresso, status)
VALUES
    (10, 'Renata Oliveira',         '12345678910', '2123456', '1992-02-08', 'renata.oliveira@megamente.com.br', '(69) 98411-0010', 'Rua J, 1000 - Centro',      'FUNCIONARIO', 'Secretária',             2600.00, 1, '2023-08-01', 'ATIVO'),
    (11, 'Marcos Vinícius Santos',  '98765432111', '2234567', '1988-10-11', 'marcos.santos@megamente.com.br',  '(69) 98411-0011', 'Rua K, 1100 - Zona Sul',     'FUNCIONARIO', 'Coordenador Pedagógico',  3800.00, 1, '2023-08-01', 'ATIVO'),
    (12, 'Fernanda Costa',          '11223344512', '2345678', '1984-07-28', 'fernanda.costa@megamente.com.br','(69) 98411-0012', 'Rua L, 1200 - Zona Leste',   'FUNCIONARIO', 'Diretora',                5200.00, 1, '2022-01-10', 'ATIVO')
ON CONFLICT (id_pessoa) DO NOTHING;

-- Alunos (id 13 a 20), cada um com seu responsável
INSERT INTO pessoas (id_pessoa, nome_completo, cpf, rg, data_nascimento, email, telefone, endereco, tipo_pessoa, id_unidade, id_responsavel, data_ingresso, status)
VALUES
    (13, 'Pedro Henrique Alves',    '20253040513', '3456789', '2015-03-10', NULL,                  '(69) 99811-0013', 'Rua A, 100 - Centro',   'ALUNO', 1,  1, '2026-02-01', 'ATIVO'),
    (14, 'Sofia Lima Castro',       '30354050614', '3567891', '2016-08-22', NULL,                  '(69) 99811-0014', 'Rua B, 200 - Centro',   'ALUNO', 1,  2, '2026-02-01', 'ATIVO'),
    (15, 'Arthur Mendes Rocha',     '40465060715', '3678912', '2014-11-05', NULL,                  '(69) 99811-0015', 'Av. C, 300 - Zona Sul', 'ALUNO', 1,  3, '2026-02-01', 'ATIVO'),
    (16, 'Laura Ferreira Dias',     '50576070816', '3789123', '2017-01-18', NULL,                  '(69) 99811-0016', 'Rua D, 400 - Zona Leste','ALUNO', 1, 4, '2026-03-05', 'ATIVO'),
    (17, 'Gabriel Teixeira Nunes',  '60687080917', '3891234', '2013-06-30', NULL,                  '(69) 99811-0017', 'Rua E, 500 - Zona Norte','ALUNO', 1, 5, '2026-03-05', 'ATIVO'),
    (18, 'Manuela Cardoso Reis',    '70798091018', '3912345', '2015-09-14', NULL,                  '(69) 99811-0018', 'Av. F, 600 - Zona Sul', 'ALUNO', 1,  6, '2026-04-10', 'ATIVO'),
    (19, 'Davi Sousa Pinto',        '80809101119', '4123456', '2016-04-21', NULL,                  '(69) 99811-0019', 'Rua G, 700 - Centro',   'ALUNO', 1,  7, '2026-04-10', 'ATIVO'),
    (20, 'Valentina Azevedo Gomes', '90910211220', '4234567', '2018-02-08', NULL,                  '(69) 99811-0020', 'Av. H, 800 - Zona Leste','ALUNO', 1, 8, '2026-05-20', 'ATIVO')
ON CONFLICT (id_pessoa) DO NOTHING;