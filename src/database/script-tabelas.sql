-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para workbench - local - desenvolvimento */
CREATE DATABASE Cineviews;

USE Cineviews;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	CPF CHAR (11),
	email VARCHAR(50),
	senha VARCHAR(50)
	
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
    descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
); 

CREATE TABLE cinema (
	idCinema INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(20)
);

CREATE TABLE votacao (
	id INT PRIMARY KEY AUTO_INCREMENT,
	fkCinema INT,
	FOREIGN KEY (fkCinema) REFERENCES cinema(idCinema)
);

INSERT INTO cinema VALUES 
      (NULL, 'Batman'),
	  (NULL, 'Pulp Fiction'),
	  (NULL, 'Guerra Civil'),
	  (NULL, 'Mad Max'),
	  (NULL, 'Clube da Luta'),
	  (NULL, 'O Irlandês');



SELECT COUNT(fkCinema) AS id FROM cinema
JOIN votacao
ON fkCinema = idCinema
GROUP BY fkCinema
ORDER BY fkCinema;




/* para sql server - remoto - produção

CREATE TABLE usuario (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
);

CREATE TABLE aviso (
	id INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(100),
    descricao VARCHAR(150),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
); 

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	temperatura DOUBLE,
	umidade DOUBLE,
	momento DATETIME,
	fk_aquario INT
);
 */

