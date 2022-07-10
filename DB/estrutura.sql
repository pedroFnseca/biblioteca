DROP DATABASE IF EXISTS Biblioteca;

CREATE DATABASE Biblioteca;
-- -----------------------------------------------------
-- Usando o Banco
-- -----------------------------------------------------
USE Biblioteca;

-- -----------------------------------------------------
-- Tabela tbl_categoria
-- -----------------------------------------------------
CREATE TABLE tbl_categoria (
	codigo_categoria INT NOT NULL AUTO_INCREMENT,
	nome_categoria VARCHAR(45) NOT NULL,
	PRIMARY KEY (codigo_categoria)
);

-- -----------------------------------------------------
-- Tabela tbl_Editora
-- -----------------------------------------------------
CREATE TABLE tbl_Editora (
	codigo_editora INT NOT NULL AUTO_INCREMENT,
	nome_editora VARCHAR(100) NOT NULL,
	cnpj VARCHAR(45) NOT NULL,
	email VARCHAR(100) NOT NULL,
	PRIMARY KEY (codigo_editora)
  );

-- -----------------------------------------------------
-- Tabela tbl_Livros
-- -----------------------------------------------------
CREATE TABLE tbl_Livros (
	codigo_livro INT NOT NULL AUTO_INCREMENT,
	nome_livro VARCHAR(45) NOT NULL,
	data_publicacao DATE NOT NULL,
	paginas INT NOT NULL,
	valor_unitario DECIMAL(6,2) NOT NULL,
	FK_Categoria INT NOT NULL,
	FK_Editora INT,
	PRIMARY KEY (codigo_livro),
	CONSTRAINT FK_Categoria foreign key (FK_Categoria)
		references tbl_categoria (codigo_categoria),
	constraint FK_Editoria foreign key (FK_Editora)
		references tbl_Editora (codigo_editora)
);
## categoria / editora
-- -----------------------------------------------------
-- Tabela tbl_Autor
-- -----------------------------------------------------
CREATE TABLE tbl_Autor (
	codigo_autor INT NOT NULL AUTO_INCREMENT,
	nome_autor VARCHAR(45) NOT NULL,
	nasc_autor DATE NOT NULL,
	nacionalidade VARCHAR(45) NOT NULL,
	PRIMARY KEY (codigo_autor)
);

-- -----------------------------------------------------
-- Tabela tbl_Cliente
-- -----------------------------------------------------
CREATE TABLE tbl_Cliente (
	codigo_cliente INT NOT NULL AUTO_INCREMENT,
	nome_cliente VARCHAR(45) NOT NULL,
	cpf_cliente VARCHAR(45) NOT NULL,
	nasc_cliente DATE NOT NULL,
	email VARCHAR(45) NOT NULL,
	PRIMARY KEY (codigo_cliente)
);

-- -----------------------------------------------------
-- Tabela tbl_bibliotecaria
-- -----------------------------------------------------
CREATE TABLE tbl_bibliotecario (
	codigo_bibliotecario INT NOT NULL AUTO_INCREMENT,
	nome_bibliotecario VARCHAR(45) NOT NULL,
	nasc_bibliotecario DATE NOT NULL,
	telefone VARCHAR(45) NOT NULL,
    FK_Biblio_responsavel INT,
	PRIMARY KEY (codigo_bibliotecario),
    FOREIGN KEY (FK_Biblio_responsavel) REFERENCES tbl_bibliotecario (codigo_bibliotecario)
  );

-- -----------------------------------------------------
-- Tabela Autor_Livro
-- -----------------------------------------------------
CREATE TABLE Autor_Livro (
	FK_Autor INT NOT NULL,
	FK_Livro INT NOT NULL,
	PRIMARY KEY (FK_Autor, FK_Livro),
	FOREIGN KEY (FK_Autor) REFERENCES tbl_Autor (codigo_autor),
	FOREIGN KEY (FK_Livro) REFERENCES tbl_Livros (codigo_livro)
);

-- -----------------------------------------------------
-- Tabela tbl_Emprestimo
-- -----------------------------------------------------
CREATE TABLE tbl_Emprestimo (
	codigo_emprestimo INT NOT NULL AUTO_INCREMENT,
	retirada DATETIME,
	devolucao DATETIME,
	FK_Bibliotecario INT NOT NULL,
	FK_Cliente INT NOT NULL,
	PRIMARY KEY (codigo_emprestimo),
	FOREIGN KEY (FK_Bibliotecario) REFERENCES tbl_bibliotecario (codigo_bibliotecario),
	FOREIGN KEY (FK_Cliente) REFERENCES tbl_Cliente (codigo_cliente)
);

-- -----------------------------------------------------
-- Tabela Livro_Emprestimo
-- -----------------------------------------------------
CREATE TABLE Livro_Emprestimo (
	FK_Livro INT NOT NULL,
	FK_Emprestimo INT NOT NULL,
	PRIMARY KEY (FK_Livro, FK_Emprestimo),
	FOREIGN KEY (FK_Livro) REFERENCES tbl_Livros (codigo_livro),
	FOREIGN KEY (FK_Emprestimo) REFERENCES tbl_Emprestimo (codigo_emprestimo)
);
