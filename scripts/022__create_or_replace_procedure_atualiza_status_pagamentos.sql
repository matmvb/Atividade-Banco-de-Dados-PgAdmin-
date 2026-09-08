-- ============================================================
-- 022__create_or_replace_procedure_atualiza_status_pagamentos.sql
-- Procedure que atualiza automaticamente o status dos pagamentos:
-- mensalidades com vencimento anterior a hoje e ainda PENDENTES
-- passam para ATRASADO.
-- Executada múltiplas vezes sem erro (CREATE OR REPLACE).
-- ============================================================
CREATE OR REPLACE PROCEDURE proc_atualiza_status_pagamentos()
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE pagamentos
    SET status = 'ATRASADO'
    WHERE status = 'PENDENTE'
      AND data_vencimento < CURRENT_DATE
      AND data_pagamento IS NULL;

    RAISE NOTICE 'Status das mensalidades vencidas atualizado para ATRASADO.';
END;
$$;

-- Chamada da procedure para validar:
-- CALL proc_atualiza_status_pagamentos();