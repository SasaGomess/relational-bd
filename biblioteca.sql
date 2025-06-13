/*CREATE*/
CREATE TABLE autor(
  id_autor INT PRIMARY KEY AUTO_INCREMENT,
  nacionalidade VARCHAR(150) NOT NULL,
  nome VARCHAR(200) NOT NULL
);

CREATE TABLE membros(
  id INT PRIMARY KEY AUTO_INCREMENT,
  telefone VARCHAR(200) NOT NULL,
  nome VARCHAR(150) NOT NULL,
  data_nasc DATE NOT NULL
);

CREATE TABLE emprestimos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_membros INT DELETE ON CASCADE,
  id_livros INT DELETE ON CASCADE,
  data_emprestimo DATE,
  data_devolucao DATE,
  status VARCHAR(100) DEFAULT ("nao devolvido"),
  FOREIGN KEY (id_membros) REFERENCES membros (id),
  FOREIGN KEY (id_livros) REFERENCES livros (isbn)
);

CREATE TABLE livros(
  isbn INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(150) NOT NULL UNIQUE,
  id_autor INT,
  genero VARCHAR(150) NOT NULL,
  data_public DATE,
  CONSTRAINT fk_livros_autor
  FOREIGN KEY (id_autor) REFERENCES autor (id_autor) 
  ON DELETE CASCADE ON UPDATE CASCADE
);

/*INSERT INTO*/
INSERT INTO autor(nacionalidade, nome) VALUES 
  ("Brasileiro", "Clarice Lispector"),
  ("Brasileiro", "Jorge Amado"),
  ("Brasileiro", "Carolina Maria de Jesus"),
  ("Espanhol", "Sêneca"),
  ("Inglês","William Shakespeare"),
  ("Estadunidense","John Wooden"),
  ('Alemão', 'Friedrich Nietzsche');

INSERT INTO livros (id_autor, data_public, genero, titulo) VALUES
	(1, '1977-05-02','Romance', 'Hora da Estrela'),
        (1, '1973-06-04', 'Ficção', 'Água viva'),
        (2, '1937-05-04', 'Romance', 'Capitães de Areia'),
        (3, '1960-05-03', 'Biografia', 'Quarto de Desejo'),
        (2, '1936-04-20','Ficção', 'Mar Morto'),
        (4, '2016-04-06', 'Filosofia', 'De Tranquililitate Animi'),
        (5, '1557-11-07', 'Tragédia', 'Romeo e Julieta'),
        (5, '1623-04-20', 'Drama','Hamlet');

INSERT INTO membros (data_nasc, nome, telefone) VALUES
	('2012-06-20', 'Maria Silvana', '(11)96543-2131'),
    	('1997-05-22', 'Gabriel Eduardo', '(99)94321-3432'),
    	('1967-04-30', 'Roberto Mario', '(21)94323-3235'),
    	('2005-12-03', 'Julia Schmitzz', '(11)94321-4321'),
    	('2001-08-22', 'Giulia Santos', '(99)32234-2312'),
    	('2003-06-17', 'Sabrina Soares', '(11)93654-6542'),
    	('2014-04-03', 'Marina Juliana', '(21)95437-4322');

INSERT INTO emprestimos (id_livros, id_membros, data_emprestimo, data_devolucao, status) VALUES
	(1, 1, '2025-06-02', '2025-06-12', 'nao devolvido'),
    	(2, 4, '2025-05-22', '2025-06-02', 'devolvido'),
    	(3, 2, '2025-05-15', '2025-05-25', 'nao devolvido'),
    	(4, 3, '2025-05-25', '2025-06-05', 'devolvido'),
    	(5, 3, '2025-06-12', '2025-06-22', 'nao devolvido'),
    	(6, 5, '2025-05-23', '2025-06-03', 'devolvido'),
    	(7, 6, '2025-04-21', '2025-05-01', 'nao devolvido');

/* SELECT */
SELECT * FROM autor;

SELECT titulo, data_public FROM livros;

SELECT * FROM membros WHERE telefone LIKE ('(11)%');

SELECT * FROM emprestimos WHERE status = 'nao devolvido';

SELECT titulo AS titulos_por_autores FROM livros lv INNER JOIN autor au ON lv.id_autor = au.id_autor;

SELECT titulo, nome FROM livros lv INNER JOIN autor au ON lv.id_autor = au.id_autor;

SELECT nome, titulo, data_emprestimo FROM emprestimos es 	
INNER JOIN membros mb ON es.id_membros = mb.id
INNER JOIN livros lv ON es.id_livros = lv.isbn; 

SELECT nome, titulo FROM autor LEFT JOIN livros ON autor.id_autor = livros.id_autor;

/*SUB CONSULTAS*/
SELECT titulo FROM livros WHERE id_autor IN(SELECT id_autor FROM autor WHERE nome = 'Clarice Lispector');

SELECT * FROM livros WHERE isbn NOT IN(SELECT id_livros FROM emprestimos);

SELECT nome FROM membros WHERE id IN(SELECT id_membros FROM emprestimos, livros WHERE livros.isbn = emprestimos.id_livros && livros.titulo = "Romeo e Julieta") 
	
SELECT nome FROM autor WHERE id_autor IN(SELECT id_autor FROM livros GROUP BY livros.id_autor HAVING SUM(autor.id_autor = livros.id_autor) = 2 )
