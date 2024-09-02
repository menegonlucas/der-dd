-- Criação do Banco de Dados
CREATE DATABASE mercadinho_do_joao;

-- Uso do Banco de Dados
USE mercadinho_do_joao;

-- Tabela de Clientes
CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(15),
    email VARCHAR(100),
    data_cadastro DATE DEFAULT CURRENT_DATE
);

-- Tabela de Fornecedores
CREATE TABLE fornecedores (
    fornecedor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(15),
    email VARCHAR(100),
    cnpj VARCHAR(18) UNIQUE NOT NULL
);

-- Tabela de Produtos
CREATE TABLE produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(fornecedor_id)
);

-- Tabela de Vendas
CREATE TABLE vendas (
    venda_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_venda DATE DEFAULT CURRENT_DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Tabela de Itens de Vendas
CREATE TABLE itens_vendas (
    item_venda_id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (venda_id) REFERENCES vendas(venda_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);