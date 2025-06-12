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
