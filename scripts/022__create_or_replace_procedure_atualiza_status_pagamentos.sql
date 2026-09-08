-- procedure que marca como ATRASADO o boleto que já venceu e ninguém pagou.
-- eu chamo ela tipo uma vez por semana na secretaria (CALL).
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