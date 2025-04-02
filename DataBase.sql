DROP DATABASE mounted_style;

CREATE DATABASE mounted_style;

USE mounted_style;

CREATE TABLE funcionarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
    imagem TEXT NOT NULL,
    nome_completo VARCHAR(45) NOT NULL,
    nascimento DATE NOT NULL,
    e_mail VARCHAR(45) NOT NULL UNIQUE,
    cargo VARCHAR(20) NOT NULL,
    telefone VARCHAR(15) NOT NULL UNIQUE

);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imagem TEXT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    e_mail VARCHAR(45) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL UNIQUE,
    senha_cliente VARCHAR(255) NOT NULL
);

CREATE TABLE tipo(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE bike_Montada (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    imagem TEXT NOT NULL,
    pecas VARCHAR(100) NOT NULL,
    preco FLOAT NOT NULL,
    tipo_id INT NOT NULL,
    FOREIGN KEY (tipo_id) REFERENCES tipo(id)
);

CREATE TABLE Quadro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    preco FLOAT NOT NULL,
    imagem TEXT NOT NULL,
    quadros VARCHAR(45) NOT NULL
);

CREATE TABLE acessorios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    imagem TEXT NOT NULL,
    preco FLOAT NOT NULL,
    pecas VARCHAR(100) NOT NULL
);


    CREATE TABLE personalizada (
        id INT AUTO_INCREMENT PRIMARY KEY,
        imagem TEXT NOT NULL,
        nome VARCHAR(45) NOT NULL,
        pecas VARCHAR(100) NOT NULL,
        preco FLOAT NOT NULL,
        quadros_id INT,
        acessorios_id INT,
        FOREIGN KEY (acessorios_id) REFERENCES acessorios(id),
        FOREIGN KEY (quadros_id) REFERENCES Quadro(id)
        
    );


CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    personalizada_id INT,
    funcionarios_id INT,
    clientes_id  INT,
    FOREIGN KEY (personalizada_id) REFERENCES personalizada(id),
    FOREIGN KEY (funcionarios_id) REFERENCES funcionarios(id),
    FOREIGN KEY (clientes_id) REFERENCES clientes(id)
);

CREATE TABLE historico_compras(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_compra VARCHAR(45) NOT NULL,
    data DATE NOT NULL,
    preco FLOAT NOT NULL UNIQUE,
    funcionarios_id INT,
    clientes_id  INT,
    FOREIGN KEY (funcionarios_id) REFERENCES funcionarios(id),
    FOREIGN KEY (clientes_id) REFERENCES clientes(id)
);
