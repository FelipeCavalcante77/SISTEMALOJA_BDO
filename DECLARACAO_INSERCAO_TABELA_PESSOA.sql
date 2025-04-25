
DECLARE @id_pessoa INT = NEXT VALUE FOR seq_pessoa;

-- Inserir dados na tabela pessoa
INSERT INTO pessoas (id_pessoa, nome, logradouro, cidade, estado, telefone, email)
VALUES (@id_pessoa, 'João Silva', 'Av. Central, 100', 'Rio Claro', 'SP', '3131-3131', 'joao@exemplo.com');

-- Relacionar com CPF
INSERT INTO pessoa_fisica (id_pessoa, cpf)
VALUES (id_pessoa, '11111111111');

select * from pessoa_fisica