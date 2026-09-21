-- teste do DELETE e também pra mostrar como o banco segura quando a gente
-- tenta apagar uma coisa que ainda está sendo usada (chave estrangeira).
-- o número 2 fica comentado de propósito: se descomentar, dá o erro de fk.

-- 1) DELETE válido: remove uma presença com lançamento incorreto
--    (Pedro não esteve em "Youtuber/Edição" em 2026-08-04 - registrada por engano)
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
--    * pagamentos NÃO possuem ON DELETE CASCADE -> remover ANTES
--    * presencas possuem ON DELETE CASCADE -> apagar matrícula basta,
--      mas o DELETE explícito também é válido
DELETE FROM pagamentos WHERE id_matricula = 8;
DELETE FROM matriculas WHERE id_matricula = 8;

-- 4) DELETE com ON DELETE CASCADE (demonstração):
--    Excluir a turma da noite apagaria automaticamente suas associações
--    em turma_materias. Porém MATRICULAS reference turmas sem CASCADE,
--    então seria preciso remover matrículas 6 e 7 antes. Trecho comentado:
-- DELETE FROM matriculas WHERE id_turma = 3;
-- DELETE FROM turmas WHERE id_turma = 3;