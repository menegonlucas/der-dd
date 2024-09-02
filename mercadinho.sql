-- Remove o banco de dados se ele já existir
DROP DATABASE IF EXISTS mercadinho_do_joao;

-- Cria um novo banco de dados
CREATE DATABASE mercadinho_do_joao;

-- Usa o banco de dados recém-criado
USE mercadinho_do_joao;

-- Criação da tabela de Clientes
CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(15),
    email VARCHAR(100),
    data_cadastro DATE DEFAULT CURRENT_DATE
);

-- Criação da tabela de Fornecedores
CREATE TABLE fornecedores (
    fornecedor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(15),
    email VARCHAR(100),
    cnpj VARCHAR(18) UNIQUE NOT NULL
);

-- Criação da tabela de Produtos
CREATE TABLE produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(fornecedor_id)
);

-- Criação da tabela de Vendas
CREATE TABLE vendas (
    venda_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_venda DATE DEFAULT CURRENT_DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Criação da tabela de Itens de Vendas
CREATE TABLE itens_vendas (
    item_venda_id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (venda_id) REFERENCES vendas(venda_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- Adicionar 4 produtos à tabela Produtos
-- Primeiro, adicione um fornecedor para os produtos
INSERT INTO fornecedores (nome, endereco, telefone, email, cnpj) VALUES
('Fornecedor A', 'Rua A, 123', '123456789', 'fornecedorA@example.com', '12.345.678/0001-90'),
('Fornecedor B', 'Rua B, 456', '987654321', 'fornecedorB@example.com', '98.765.432/0001-01');

-- Agora, adicione os produtos
INSERT INTO produtos (nome, descricao, preco, quantidade_estoque, fornecedor_id) VALUES
('Produto 1', 'Descrição do Produto 1', 10.99, 100, 1),
('Produto 2', 'Descrição do Produto 2', 20.49, 50, 1),
('Produto 3', 'Descrição do Produto 3', 5.99, 200, 2),
('Produto 4', 'Descrição do Produto 4', 15.75, 75, 2);
