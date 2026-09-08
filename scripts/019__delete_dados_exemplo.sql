-- ============================================================
-- 019__delete_dados_exemplo.sql
-- Validando o comando DELETE e as restrições de integridade
-- referencial (chaves estrangeiras).
-- ============================================================

-- 1) DELETE válido: remove uma presença com lançamento incorreto
--    (Pedro não esteve em Raciocínio Lógico em 2026-08-03 - registrada por engano)
DELETE FROM presencas
WHERE id_presenca = 2;

-- 2) DELETE com restrição (demonstração):
--    Não é possível excluir a Valentina enquanto existir matrícula vinculada.
--    Descomente para ver o erro de violação de chave estrangeira:
-- DELETE FROM pessoas WHERE id_pessoa = 20;
--    >>> ERROR: update or delete on table "pessoas" violates foreign key
--    >>> constraint "matriculas_id_aluno_fkey"

-- 3) DELETE em cascata (demonstração):
--    Remover os dados da matrícula cancelada da Valentina.
--    Presenças e pagamentos precisam ser removidos ANTES da matrícula.
DELETE FROM pagamentos WHERE id_matricula = 8;
DELETE FROM presencas WHERE id_matricula = 8;
DELETE FROM matriculas WHERE id_matricula = 8;

-- 4) DELETE com ON DELETE CASCADE (demonstração):
--    Excluir a turma da noite remove automaticamente as associações
--    da tabela turma_materias (OBS: também exigiria remover matrículas
--    antes, por isso o trecho fica comentado):
-- DELETE FROM turmas WHERE id_turma = 3;