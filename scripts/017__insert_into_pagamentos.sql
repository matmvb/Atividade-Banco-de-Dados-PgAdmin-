-- boletos de mensalidade. coloquei alguns já pagos, outros pendentes e dois
-- atrasados pra testar a procedure do 022. o do arthur sai por 300 reais
-- por causa do desconto de irmão na matrícula dele.
INSERT INTO pagamentos (id_pagamento, id_matricula, id_responsavel, data_vencimento, data_pagamento, valor, status)
VALUES
    -- Matrícula 1 (Pedro / resp 1)
    (1,  1,  1, '2026-07-05', '2026-07-03', 350.00, 'PAGO'),
    (2,  1,  1, '2026-08-05', '2026-08-04', 350.00, 'PAGO'),
    (3,  1,  1, '2026-09-05', NULL,         350.00, 'PENDENTE'),
    -- Matrícula 2 (Sofia / resp 2)
    (4,  2,  2, '2026-07-05', '2026-07-06', 350.00, 'PAGO'),
    (5,  2,  2, '2026-08-05', '2026-08-05', 350.00, 'PAGO'),
    -- Matrícula 3 (Arthur / resp 3) - com desconto de irmão (R$ 50,00)
    (6,  3,  3, '2026-07-05', '2026-07-02', 300.00, 'PAGO'),
    (7,  3,  3, '2026-08-05', NULL,         300.00, 'PENDENTE'),
    -- Matrícula 4 (Laura / resp 4) - atrasada
    (8,  4,  4, '2026-08-05', NULL,         350.00, 'ATRASADO'),
    -- Matrícula 5 (Gabriel / resp 5)
    (9,  5,  5, '2026-07-05', '2026-07-10', 350.00, 'PAGO'),
    (10, 5,  5, '2026-08-05', '2026-08-02', 350.00, 'PAGO'),
    -- Matrícula 6 (Manuela / resp 6)
    (11, 6,  6, '2026-07-05', NULL,         350.00, 'ATRASADO'),
    (12, 6,  6, '2026-08-05', '2026-08-06', 350.00, 'PAGO'),
    -- Matrícula 7 (Davi / resp 7) - pendente com vencimento vencido
    (13, 7,  7, '2026-08-05', NULL,         350.00, 'PENDENTE')
    -- Matrícula 8 (Valentina / resp 8) - sem pagamento ainda
ON CONFLICT (id_pagamento) DO NOTHING;