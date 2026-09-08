-- ============================================================
-- 018__update_dados_exemplo.sql
-- Validando o comando UPDATE no banco de dados.
-- ============================================================

-- 1) Atualiza telefone e e-mail de um responsável (cadastro)
UPDATE pessoas
SET telefone = '(69) 98422-0001', email = 'maria.alves.nova@email.com'
WHERE id_pessoa = 1;

-- 2) Atualiza o e-mail de um funcionário (correção de cadastro)
UPDATE pessoas
SET email = 'renata.oliveira2026@megamente.com.br'
WHERE id_pessoa = 10;

-- 3) Atualiza o horário da turma da noite (ajuste da grade)
UPDATE turmas
SET horario_inicio = '18:00:00', horario_fim = '21:00:00'
WHERE nome_turma = 'TURMA NOITE';

-- 4) Baixa do pagamento atrasado da Laura (matrícula 4) como PAGO
--    (o responsável efetuou o pagamento hoje)
UPDATE pagamentos
SET status = 'PAGO', data_pagamento = CURRENT_DATE
WHERE id_pagamento = 8;

-- 5) Cancela a matrícula da Valentina (matrícula 8)
--    (utilizada no script 019__ para demonstrar o DELETE)
UPDATE matriculas
SET status = 'CANCELADA', data_cancelamento = CURRENT_DATE
WHERE id_matricula = 8;

-- 6) Altera a mensalidade padrão das matrículas ativas da turma da manhã
UPDATE matriculas
SET valor_mensalidade = 370.00
WHERE id_turma = 1 AND status = 'ATIVA';