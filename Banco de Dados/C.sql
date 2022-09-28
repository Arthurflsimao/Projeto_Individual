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
      
      
INSERT INTO usuario VALUES 
             (NULL, 'Bruce Wayne', '38828429010', 'brucewayne@gmail.com', 'eusouobatman'),
             (NULL, 'Coringa', '92837462930', 'coringa@gmail.com', 'hahahahaha'),
             (NULL, 'Michael Corleone', '91839293020', 'michaelcorleone@gmail.com', 'padrinho'),
             (NULL, 'Vovózona', '29481939304', 'vovo@gmail.com', 'croche'),
             (NULL, 'Tony Stark', '39529457819', 'tonystarrk@gmail.com', 'eusouohomemdeferro'),
             (NULL, 'David Bowman', '50293913000', 'david@gmail.com', 'hal3000'),
             (NULL, 'Luke Skywalker', '93028349292', 'lukesky@gmail.com', 'force');



SELECT COUNT(fkCinema) AS id FROM cinema
JOIN votacao
ON fkCinema = idCinema
GROUP BY fkCinema
ORDER BY fkCinema;