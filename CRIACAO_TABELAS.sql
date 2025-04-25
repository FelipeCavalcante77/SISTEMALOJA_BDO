
USE SistemaLoja;
GO

--  SEQUENCE PARA ID_PESSOA
CREATE SEQUENCE seq_id_pessoa
    START WITH 1
    INCREMENT BY 1;
GO

-- TABELA USUÁRIOS
CREATE TABLE usuarios (
    id_usuario INT IDENTITY PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(100)
);
GO

-- TABELA PESSOAS
CREATE TABLE pessoas (
    id_pessoa INT PRIMARY KEY DEFAULT NEXT VALUE FOR seq_id_pessoa,
    nome VARCHAR(100),
    endereco VARCHAR(150),
    telefone VARCHAR(20),
    email VARCHAR(100)
);
GO

-- TABELA PESSOA FÍSICA
CREATE TABLE pessoa_fisica (
    id_pessoa INT PRIMARY KEY,
    cpf CHAR(11) UNIQUE,
    CONSTRAINT fk_pf_pessoa FOREIGN KEY (id_pessoa) REFERENCES pessoas(id_pessoa)
);
GO

-- TABELA PESSOA JURÍDICA
CREATE TABLE pessoa_juridica (
    id_pessoa INT PRIMARY KEY,
    cnpj CHAR(14) UNIQUE,
    razao_social VARCHAR(150),
    CONSTRAINT fk_pj_pessoa FOREIGN KEY (id_pessoa) REFERENCES pessoas(id_pessoa)
);
GO

-- TABELA PRODUTOS
CREATE TABLE produtos (
    id_produto INT IDENTITY PRIMARY KEY,
    nome VARCHAR(100),
    quantidade INT,
    preco_venda DECIMAL(10,2)
);
GO

-- TABELA MOVIMENTOS DE COMPRA
CREATE TABLE movimentos_compra (
    id_compra INT IDENTITY PRIMARY KEY,
    id_usuario INT,
    id_produto INT,
    id_pessoa_jur INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    data_compra DATETIME DEFAULT GETDATE(),
    CONSTRAINT fk_compra_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    CONSTRAINT fk_compra_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    CONSTRAINT fk_compra_pj FOREIGN KEY (id_pessoa_jur) REFERENCES pessoa_juridica(id_pessoa)
);
GO

-- TABELA MOVIMENTOS DE VENDA
CREATE TABLE movimentos_venda (
    id_venda INT IDENTITY PRIMARY KEY,
    id_usuario INT,
    id_produto INT,
    id_pessoa_fis INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    data_venda DATETIME DEFAULT GETDATE(),
    CONSTRAINT fk_venda_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    CONSTRAINT fk_venda_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    CONSTRAINT fk_venda_pf FOREIGN KEY (id_pessoa_fis) REFERENCES pessoa_fisica(id_pessoa)
);
GO
