/*
=======================================
		Criação e Scripts do BD
=======================================
*/

create database Biblioteca;
use Biblioteca;

CREATE TABLE IF NOT EXISTS `Biblioteca`.`Acesso` (
  `login` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(50) NOT NULL,
  `niveis_acesso` ENUM('admin', 'biblio', 'usuario') NOT NULL,
  PRIMARY KEY (`login`, `senha`)
);


CREATE TABLE IF NOT EXISTS `Biblioteca`.`livros` (
  `ISBN` INT NOT NULL AUTO_INCREMENT,
  `título` VARCHAR(60) NOT NULL,
  `ano_lançamento` INT(4) NOT NULL,
  `editora` VARCHAR(45) NOT NULL,
  `qtde_copias` INT NOT NULL,
  `nome_autor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ISBN`));

CREATE TABLE IF NOT EXISTS `Biblioteca`.`categoria` (
  `codigo` INT NOT NULL,
  `descricao` VARCHAR(30) NOT NULL,
  `Livros_ISBN` INT NOT NULL,
	PRIMARY KEY (`codigo`),
	FOREIGN KEY (`Livros_ISBN`) REFERENCES `Biblioteca`.`livros` (`ISBN`)
);

CREATE TABLE IF NOT EXISTS `Biblioteca`.`autores_dos_livros` (
  `livros_ISBN` INT NOT NULL,
  `autores_email` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`livros_ISBN`, `autores_email`),
  FOREIGN KEY (`livros_ISBN`) REFERENCES `Biblioteca`.`livros` (`ISBN`),
  FOREIGN KEY (`autores_email`) REFERENCES `Biblioteca`.`autores` (`email`)
);
  
CREATE TABLE IF NOT EXISTS `Biblioteca`.`autores` (
  `nome` VARCHAR(40) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `nacionalidade` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`email`));
  
CREATE TABLE IF NOT EXISTS `Biblioteca`.`curso` (
  `cod_curso` INT NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_curso`));
  
CREATE TABLE IF NOT EXISTS `Biblioteca`.`livros_reserva_professores` (
  `livros_ISBN` INT NOT NULL,
  `professores_mat_siape` INT NOT NULL,
  `professores_cod_curso` INT NOT NULL,
  `qtd_livros` INT NULL,
  `prazo_entrega` DATE NULL,
	PRIMARY KEY (`livros_ISBN`, `professores_mat_siape`, `professores_cod_curso`),
    FOREIGN KEY (`livros_ISBN`) REFERENCES `Biblioteca`.`livros` (`ISBN`),
    FOREIGN KEY (`professores_mat_siape` , `professores_cod_curso`) REFERENCES `Biblioteca`.`professores` (`mat_siape` , `cod_curso`)
);

CREATE TABLE IF NOT EXISTS `Biblioteca`.`professores` (
  `mat_siape` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `endereco` VARCHAR(70) NOT NULL,
  `regime_trabalho` VARCHAR(3) NOT NULL,
  `data_contratacao` DATE NOT NULL,
  `cod_curso` INT NOT NULL,
	PRIMARY KEY (`mat_siape`, `cod_curso`),
	FOREIGN KEY (`cod_curso`) REFERENCES `Biblioteca`.`curso` (`cod_curso`)
);

CREATE TABLE IF NOT EXISTS `Biblioteca`.`telefone_professores` (
  `telefone` VARCHAR(14) NOT NULL,
  `professores_mat_siape` INT NOT NULL,
	PRIMARY KEY (`telefone`),
    FOREIGN KEY (`professores_mat_siape`) REFERENCES `Biblioteca`.`professores` (`mat_siape`));

CREATE TABLE IF NOT EXISTS `Biblioteca`.`alunos_reserva_livros` (
  `alunos_matricula` INT NOT NULL,
  `alunos_cod_curso` INT NOT NULL,
  `livros_ISBN` INT NOT NULL,
  `qtd_livros` INT NULL,
  `prazo_reserva` DATE NULL,
	PRIMARY KEY (`alunos_matricula`, `alunos_cod_curso`, `livros_ISBN`),
    FOREIGN KEY (`alunos_matricula`) REFERENCES `Biblioteca`.`alunos` (`matricula`),
    FOREIGN KEY (`livros_ISBN`) REFERENCES `Biblioteca`.`livros` (`ISBN`)
);

CREATE TABLE IF NOT EXISTS `Biblioteca`.`alunos` (
  `matricula` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `endereco` VARCHAR(70) NOT NULL,
  `data_ingresso` DATE NOT NULL,
  `data_conclusao_prevista` DATE NOT NULL,
  `telefone_aluno` VARCHAR(13) NOT NULL,
  `cod_curso` INT NOT NULL,
	PRIMARY KEY (`matricula`, `cod_curso`),
	FOREIGN KEY (`cod_curso`) REFERENCES `Biblioteca`.`curso` (`cod_curso`)
);

CREATE TABLE IF NOT EXISTS `Biblioteca`.`telefone_alunos` (
  `telefone` VARCHAR(14) NOT NULL,
  `alunos_matricula` INT NOT NULL,
	PRIMARY KEY (`telefone`),
    FOREIGN KEY (`alunos_matricula`) REFERENCES `Biblioteca`.`alunos` (`matricula`)
);

CREATE TABLE IF NOT EXISTS `Biblioteca`.`livros_reserva_funcionarios` (
  `livros_ISBN` INT NOT NULL,
  `funcionarios_matricula` INT NOT NULL,
  `qtd_livros` INT NULL,
  `prazo_reserva` DATE NULL,
  `livros_reserva_funcionarioscol` VARCHAR(45) NULL,
	PRIMARY KEY (`livros_ISBN`, `funcionarios_matricula`),
    FOREIGN KEY (`livros_ISBN`) REFERENCES `Biblioteca`.`livros` (`ISBN`),
    FOREIGN KEY (`funcionarios_matricula`) REFERENCES `Biblioteca`.`funcionarios` (`matricula`)
);

CREATE TABLE IF NOT EXISTS `Biblioteca`.`funcionarios` (
  `matricula` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `endereco` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`matricula`)
);

CREATE TABLE IF NOT EXISTS `Biblioteca`.`telefone_funcionarios` (
  `telefone` VARCHAR(14) NOT NULL,
  `funcionarios_matricula` INT NOT NULL,
	PRIMARY KEY (`telefone`),
    FOREIGN KEY (`funcionarios_matricula`) REFERENCES `Biblioteca`.`funcionarios` (`matricula`)
);

/*
============================================
            Povoamento BD
============================================
*/

/* ================ Níveis de Acesso ===================== */
/* Administrador */
INSERT INTO `acesso` VALUES ('admin', 'root', 'admin');
/* Bibliotecário */
INSERT INTO `acesso` VALUES ('Biblio', '4321', 'biblio');
/* Usuário */
INSERT INTO `acesso` VALUES ('User', '4567', 'usuario');

/* ===================== Curso ======================== */
INSERT INTO `curso` (cod_curso, nome_curso)
VALUES ('2389', 'Engenharia da Computação');

INSERT INTO `curso` (cod_curso, nome_curso)
VALUES ('5128', 'Economia');

INSERT INTO `curso` (cod_curso, nome_curso)
VALUES ('5210', 'Engenharia Eletrica');

/* ===================== Autores ======================== */
INSERT INTO `autores` (nome, email, nacionalidade)
VALUES ('Augusto Freitas', 'augustofreitas@gmail.com', 'Argentino');

INSERT INTO `autores` (nome, email, nacionalidade)
VALUES ('André Rodrigues', 'andrederodrigues@gmail.com', 'Português');

INSERT INTO `autores` (nome, email, nacionalidade)
VALUES ('Thiago Gomes', 'thiagogomes1@gmail.com', 'Brasileiro');

/* =====================  Autores dos Livros ======================== */
INSERT INTO autores_dos_livros
VALUES('100' , 'augustofreitas@gmail.com');

INSERT INTO autores_dos_livros
VALUES('101' , 'andrederodrigues@gmail.com');

INSERT INTO autores_dos_livros
VALUES('101' , 'thiagogomes1@gmail.com');

INSERT INTO autores_dos_livros
VALUES('102' , 'thiagogomes1@gmail.com');

/* ===================== Livros ======================== */
INSERT INTO `livros` (ISBN, ano_lançamento, editora, qtde_copias, nome_autor, titulo)
VALUES (100, '2000', 'Cengage', 10, 'Augusto Freitas', 'Calculo I');

INSERT INTO `livros` (ISBN, ano_lançamento, editora, qtde_copias, nome_autor, titulo)
VALUES (101, '1998', 'Intriseca', 8, 'André Rodrigues', 'Fundamentos da Economia');

INSERT INTO `livros` (ISBN, ano_lançamento, editora, qtde_copias, nome_autor, titulo)
VALUES (102, '1996', 'Cengage', 11, 'Thiago Gomes', 'Circuitos Eletricos');

/* ===================== Categorias ======================== */
INSERT INTO categoria (codigo, descricao, Livros_ISBN)
VALUES (26, 'Matemática', 100);

INSERT INTO categoria (codigo, descricao, Livros_ISBN)
VALUES (27, 'Economia', 101);

INSERT INTO categoria (codigo, descricao, Livros_ISBN)
VALUES (28, 'Física', 102);

/* ===================== Professores ======================== */
INSERT INTO Professores (mat_siape, nome, endereco, regime_trabalho, data_contratacao, cod_curso)
VALUES (165427, 'Paulo Costa', 'Estanislau Frota - Centro - Sobral', '20', '1999/03/12', '2389');

INSERT INTO Professores (mat_siape, nome, endereco, regime_trabalho, data_contratacao, cod_curso)
VALUES (168290, 'Thiago Fontes', 'Lucia Saboia - Centro - Sobral', '40', '1998/04/10', '2389');

INSERT INTO Professores (mat_siape, nome, endereco, regime_trabalho, data_contratacao, cod_curso)
VALUES (167293, 'Marcilio Santos', 'Estanislau Frota - Centro - Sobral', '20', '1998/08/08', '5128');

/* ===================== Reserva de Livros dos Professores ======================== */
INSERT INTO livros_reserva_professores (livros_ISBN, professores_mat_siape, professores_cod_curso, qtd_livros, prazo_entrega)
VALUES (100, '168290', 2389, 2, '2022-07-08');

INSERT INTO livros_reserva_professores (livros_ISBN, professores_mat_siape, professores_cod_curso, qtd_livros, prazo_entrega) 
VALUES ('102', '168290', '5210', '1', '2022-07-10'); /*Corrigir problemas aqui*/

/* =====================  telefone dos professores ======================== */
INSERT INTO telefone_professores (telefone, professores_mat_siape) 
VALUES ('+5588999104569', '165427');

INSERT INTO telefone_professores (telefone, professores_mat_siape) 
VALUES ('+5588999104879', '165427');

INSERT INTO telefone_professores (telefone, professores_mat_siape) 
VALUES ('+5588996897523', '167293');

/* ===================== Alunos ======================== */
INSERT INTO alunos (matricula, nome, endereco, data_ingresso, data_conclusao_prevista, cod_curso) 
VALUES ('0200', 'Ricardo dos Santos', 'Rua Estanislau Frota - Centro - Sobral', '2015/03/21', '2020/04/09', '2389');

INSERT INTO alunos (matricula, nome, endereco, data_ingresso, data_conclusao_prevista, cod_curso) 
VALUES ('0201', 'José da Costa', 'Rua Estanislau Frota - Centro - Sobral', '2015/09/15', '2020/10/09', '5210');

INSERT INTO alunos (matricula, nome, endereco, data_ingresso, data_conclusao_prevista, cod_curso) 
VALUES ('0202', 'Francisco Sousa', 'Rua Coronel Deodoro - Sumare - Sobral', '2017/03/23', '2022/04/29', '5128');

/* ===================== Reserva de livros por alunos ======================== */
INSERT INTO alunos_reserva_livros (alunos_matricula, alunos_cod_curso, livros_ISBN, qtd_livros, prazo_reserva) 
VALUES ('200', '2389', '100', 1, '2022/08/03');

INSERT INTO alunos_reserva_livros (alunos_matricula, alunos_cod_curso, livros_ISBN, qtd_livros, prazo_reserva) 
VALUES ('201', '5210', '101', 2, '2022/09/01');

INSERT INTO alunos_reserva_livros (alunos_matricula, alunos_cod_curso, livros_ISBN, qtd_livros, prazo_reserva) 
VALUES ('202', '5128', '102', 3, '2022/08/20');

/* ===================== telefone dos alunos ======================== */
INSERT INTO telefone_alunos (telefone, alunos_matricula) 
VALUE ('+5588995214789', '0200');

INSERT INTO telefone_alunos (telefone, alunos_matricula) 
VALUE ('+558896547821', '0201');

INSERT INTO telefone_alunos (telefone, alunos_matricula) 
VALUE ('+558897854613', '0202');

/* ===================== Funcionários ======================== */
INSERT INTO funcionarios (matricula, nome, endereco) 
VALUE ('301', 'Gisele Rodrigues', 'Estanislau Frota - Centro - Sobral');

INSERT INTO funcionarios (matricula, nome, endereco) 
VALUE ('300', 'Pedro Gonçalves', 'Lucia Saboia - Centro - Sobral');

INSERT INTO funcionarios (matricula, nome, endereco) 
VALUE ('302', 'Vitor Gomes', 'Lucia Saboia - Centro - Sobral');

/* ===================== telefone dos funcionarios ======================== */
INSERT INTO telefone_funcionarios (telefone, funcionarios_matricula) 
VALUE ('+5588996321456', '300');

INSERT INTO telefone_funcionarios (telefone, funcionarios_matricula) 
VALUE ('+5588997864215', '301');

INSERT INTO telefone_funcionarios (telefone, funcionarios_matricula) 
VALUE ('+5588998564219', '302');

/* ===================== livros reservados pelos funcionários ======================== */
INSERT INTO livros_reserva_funcionarios (livros_ISBN, funcionarios_matricula, qtd_livros, prazo_reserva)
VALUE ('100', '300', 2, '2022/09/20');

INSERT INTO livros_reserva_funcionarios (livros_ISBN, funcionarios_matricula, qtd_livros, prazo_reserva)
VALUE ('101', '301', 1, '2022/10/02');

INSERT INTO livros_reserva_funcionarios (livros_ISBN, funcionarios_matricula, qtd_livros, prazo_reserva)
VALUE ('101', '302', 1, '2022/10/08');


/*
select * from livros_reserva_funcionarios;

alter table livros_reserva_funcionarios
drop column livros_reserva_funcionarioscol;

drop table telefone_professores;

delete from livros_reserva_professores
where livros_ISBN='100';
*/