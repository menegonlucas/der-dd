-- Remove o banco de dados se ele já existir
DROP DATABASE IF EXISTS biblioteca;

-- Cria um novo banco de dados
CREATE DATABASE biblioteca;

-- Usa o banco de dados recém-criado
USE biblioteca;

-- Criação da tabela de Itens (Livros, Revistas, Jornais, etc.)
CREATE TABLE Itens (
    codigo INTEGER PRIMARY KEY,  -- Código único do item
    titulo TEXT NOT NULL,         -- Título do item
    autor TEXT NOT NULL,          -- Autor do item
    quantidade_estoque INTEGER NOT NULL  -- Quantidade em estoque
);

-- Criação da tabela de Sócios
CREATE TABLE Socios (
    socio_id INTEGER PRIMARY KEY, -- ID único do sócio
    nome TEXT NOT NULL,           -- Nome do sócio
    endereco TEXT,                -- Endereço do sócio
    telefone TEXT                 -- Telefone do sócio
);

-- Criação da tabela de Empréstimos
CREATE TABLE Emprestimos (
    emprestimo_id INTEGER PRIMARY KEY, -- ID único do empréstimo
    data_emprestimo DATE NOT NULL,     -- Data do empréstimo
    socio_id INTEGER NOT NULL,         -- Referência ao sócio que fez o empréstimo
    FOREIGN KEY (socio_id) REFERENCES Socios(socio_id)
);

-- Criação da tabela de Itens_Emprestimos (Relaciona itens com empréstimos)
CREATE TABLE Itens_Emprestimos (
    emprestimo_id INTEGER NOT NULL, -- ID do empréstimo
    codigo INTEGER NOT NULL,        -- Código do item
    quantidade INTEGER NOT NULL,    -- Quantidade do item emprestado
    FOREIGN KEY (emprestimo_id) REFERENCES Emprestimos(emprestimo_id),
    FOREIGN KEY (codigo) REFERENCES Itens(codigo),
    PRIMARY KEY (emprestimo_id, codigo)
);

-- (Opcional) Limpar a tabela Itens para evitar conflitos de chave primária
DELETE FROM Itens;

-- Adicionar 4 livros à tabela Itens
INSERT INTO Itens (codigo, titulo, autor, quantidade_estoque) VALUES
(1, 'O Senhor dos Anéis', 'J.R.R. Tolkien', 10),
(2, '1984', 'George Orwell', 5),
(3, 'Dom Casmurro', 'Machado de Assis', 7),
(4, 'A Guerra dos Tronos', 'George R.R. Martin', 3);
