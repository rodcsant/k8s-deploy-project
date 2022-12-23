CREATE TABLE mensagens (
    id int,
    nome varchar(50),
    email varchar(50),
    comentario varchar(100)
);

-- 1. CREATE TABLE - Esta instrução cria uma nova tabela no banco de dados.
-- 2. mensagens - Este é o nome da tabela que está sendo criada.
-- 3. (id int, nome varchar(50), email varchar(50), comentário varchar(100))
-- Esta é uma lista de colunas e seus tipos de dados para a tabela. 
-- Neste exemplo, a tabela possui quatro colunas: id (inteiro), 
-- nome (caractere variável com comprimento máximo de 50 caracteres), 
-- email (caractere variável com comprimento máximo de 50 caracteres) e 
-- comentario (caractere variável com comprimento máximo de 100 caracteres).