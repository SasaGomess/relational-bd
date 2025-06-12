/*CREATE*/
CREATE TABLE autor(
  id_autor INT PRIMARY KEY,
  nacionalidade VARCHAR(150),
  nome VARCHAR(200)
);

CREATE TABLE membros(
  id INT PRIMARY KEY,
  telefone VARCHAR(200),
  nome VARCHAR(150) NOT NULL,
  data_nasc DATE
);

CREATE TABLE emprestimos(
  id INT PRIMARY KEY,
  id_membros INT,
  id_livros INT,
  data_emprestimo DATE,
  data_devolucao DATE,
  status VARCHAR(100) DEFAULT("nao devolvido"),
  FOREIGN KEY (id_membros) REFERENCES membros (id),
  FOREIGN KEY (id_livros) REFERENCES livros (isbn)
);

CREATE TABLE livros(
  isbn INT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  id_autor INT,
  genero VARCHAR(150) NOT NULL,
  data_public DATE,
  CONSTRAINT fk_livros_autor
  FOREIGN KEY (id_autor) REFERENCES autor (id)
);

/*INSERT INTO*/
INSERT INTO autor(id_autor, nacionalidade, nome) VALUES 
  (1,"Brasileiro", "Clarice Lispector"),
  (2,"Brasileiro", "Jorge Amado"),
  (3,"Brasileiro", "Carolina Maria de Jesus"),
  (4,"Espanhol", "Sêneca"),
  (5,"Inglês","William Shakespeare"),
  (6, "Estadunidense","John Wooden");

INSERT INTO livros (id_autor, data_public, genero, titulo) VALUES
	(1, '1977-05-02','Romance', 'Hora da Estrela'),
        (1, '1973-06-04', 'Ficção', 'Água viva'),
        (2, '1937-05-04', 'Romance', 'Capitães de Areia'),
        (3, '1960-05-03', 'Biografia', 'Quarto de Desejo'),
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
