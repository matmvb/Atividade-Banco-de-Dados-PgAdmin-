-- ============================================================
-- 001__create_database_escola_megamente.sql
-- Cria o banco de dados escola_megamente.
-- Deve ser executado conectado no banco "postgres" (ou outro).
-- Executável múltiplas vezes sem erro.
-- ============================================================
SELECT 'CREATE DATABASE escola_megamente'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'escola_megamente')\gexec