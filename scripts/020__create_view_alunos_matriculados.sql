-- ============================================================
-- 020__create_view_alunos_matriculados.sql
-- View que consolida os alunos matriculados com turma, unidade,
-- professor e responsável.
-- ============================================================
CREATE OR REPLACE VIEW view_alunos_matriculados AS
SELECT
    a.id_pessoa                        AS id_aluno,
    a.nome_completo                    AS nome_aluno,
    a.data_nascimento,
    a.id_responsavel,
    r.nome_completo                    AS nome_responsavel,
    t.id_turma,
    t.nome_turma,
    t.turno,
    t.horario_inicio,
    t.horario_fim,
    u.nome                             AS nome_unidade,
    u.cidade,
    u.estado,
    c.nome_curso,
    p.nome_completo                    AS nome_professor,
    m.valor_mensalidade,
    m.desconto,
    (m.valor_mensalidade - m.desconto) AS valor_final
FROM pessoas a
JOIN matriculas m    ON m.id_aluno  = a.id_pessoa
JOIN turmas t        ON t.id_turma  = m.id_turma
JOIN unidades u      ON u.id_unidade = t.id_unidade
JOIN cursos c        ON c.id_curso  = t.id_curso
JOIN pessoas p       ON p.id_pessoa = t.id_professor
LEFT JOIN pessoas r  ON r.id_pessoa = a.id_responsavel
WHERE a.tipo_pessoa = 'ALUNO'
  AND m.status = 'ATIVA';