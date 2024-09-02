CREATE DATABASE biblioteca;
USE biblioteca;

-- Criação da tabela de Itens (Livros, Revistas, Jornais, etc.)
CREATE TABLE Itens (
    codigo INT PRIMARY KEY AUTO_INCREMENT,  -- Código único do item
    titulo VARCHAR(255) NOT NULL,           -- Título do item
    autor VARCHAR(255) NOT NULL,            -- Autor do item
    quantidade_estoque INT NOT NULL         -- Quantidade em estoque
);

-- Criação da tabela de Sócios
CREATE TABLE Socios (
    socio_id INT PRIMARY KEY AUTO_INCREMENT, -- ID único do sócio
    nome VARCHAR(255) NOT NULL,              -- Nome do sócio
    endereco VARCHAR(255),                   -- Endereço do sócio
    telefone VARCHAR(20)                     -- Telefone do sócio
);

-- Criação da tabela de Empréstimos
CREATE TABLE Emprestimos (
    emprestimo_id INT PRIMARY KEY AUTO_INCREMENT, -- ID único do empréstimo
    data_emprestimo DATE NOT NULL,                -- Data do empréstimo
    socio_id INT NOT NULL,                        -- Referência ao sócio que fez o empréstimo
    FOREIGN KEY (socio_id) REFERENCES Socios(socio_id)
);

-- Criação da tabela de Itens_Emprestimos (Relaciona itens com empréstimos)
CREATE TABLE Itens_Emprestimos (
    emprestimo_id INT NOT NULL,   -- ID do empréstimo
    codigo INT NOT NULL,          -- Código do item
    quantidade INT NOT NULL,      -- Quantidade do item emprestado
    FOREIGN KEY (emprestimo_id) REFERENCES Emprestimos(emprestimo_id),
    FOREIGN KEY (codigo) REFERENCES Itens(codigo),
    PRIMARY KEY (emprestimo_id, codigo)
);

-- Inserir itens na tabela Itens
INSERT INTO Itens (titulo, autor, quantidade_estoque) VALUES ('Livro A', 'Autor A', 10);
INSERT INTO Itens (titulo, autor, quantidade_estoque) VALUES ('Revista B', 'Autor B', 5);

-- Inserir sócios na tabela Sócios
INSERT INTO Socios (nome, endereco, telefone) VALUES ('João', 'Rua A', '123456789');
INSERT INTO Socios (nome, endereco, telefone) VALUES ('Maria', 'Rua B', '987654321');

-- Criar um empréstimo
INSERT INTO Emprestimos (data_emprestimo, socio_id) VALUES ('2024-09-01', 1);

-- Associar itens ao empréstimo
INSERT INTO Itens_Emprestimos (emprestimo_id, codigo, quantidade) VALUES (1, 1, 2);
INSERT INTO Itens_Emprestimos (emprestimo_id, codigo, quantidade) VALUES (1, 2, 1);


-- Verificar dados de Itens
SELECT * FROM Itens;

-- Verificar dados de Sócios
SELECT * FROM Socios;

-- Verificar dados de Empréstimos
SELECT * FROM Emprestimos;

-- Verificar itens associados aos Empréstimos
SELECT * FROM Itens_Emprestimos;
