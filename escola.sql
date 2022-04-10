CREATE DATABASE escola;
USE escola;

CREATE TABLE aluno (
	CPF VARCHAR(11) NOT NULL,
	Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Telefone VARCHAR(255) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    PRIMARY KEY (CPF)
    );
        
CREATE TABLE departamento (
	Cod_Departamento INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    PRIMARY KEY (Cod_Departamento)
    );

CREATE TABLE curso (
	Cod_Curso INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    Cod_departamento INT NOT NULL,
    PRIMARY KEY (Cod_Curso),
    FOREIGN KEY (Cod_departamento) REFERENCES Departamento(Cod_departamento)
    );
    
CREATE TABLE matricula (
	Cod_Matricula INT NOT NULL AUTO_INCREMENT,
	Cod_Curso INT NOT NULL,
    CPF_Aluno VARCHAR(11) NOT NULL,
    Data_Matricula DATE NOT NULL,
    PRIMARY KEY (Cod_Matricula),
	FOREIGN KEY (Cod_Curso) REFERENCES curso(Cod_Curso),
    FOREIGN KEY (CPF_Aluno) REFERENCES aluno(CPF)
    );
    
CREATE TABLE professor (
	Matricula_Professor INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Telefone VARCHAR(255) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Cod_Departamento INT NOT NULL,
    Data_Contratacao DATE NOT NULL,
    PRIMARY KEY (Matricula_Professor),
	FOREIGN KEY (Cod_Departamento) REFERENCES departamento(Cod_Departamento)
    );
    
CREATE TABLE disciplina (
	Cod_Disciplina INT NOT NULL AUTO_INCREMENT,
    Nome_Disciplina VARCHAR(50) NOT NULL,
    Qtde_Creditos VARCHAR(4) NOT NULL,
    Matricula_Professor INT NOT NULL,
    PRIMARY KEY (Cod_Disciplina),
	FOREIGN KEY (Matricula_Professor) REFERENCES professor(Matricula_Professor)
    );
    
CREATE TABLE cursa (
	CPF_Aluno VARCHAR(11) NOT NULL,
    Cod_Disciplina INT NOT NULL,
    FOREIGN KEY (CPF_Aluno) REFERENCES aluno(CPF),
    FOREIGN KEY (Cod_Disciplina) REFERENCES disciplina(Cod_Disciplina)
    );
    
CREATE TABLE compoe (
	Cod_Curso INT NOT NULL,
    Cod_Disciplina INT NOT NULL,
    FOREIGN KEY (Cod_Curso) REFERENCES curso(Cod_Curso),
    FOREIGN KEY (Cod_Disciplina) REFERENCES disciplina(Cod_Disciplina)
    );
    
CREATE TABLE pre_requisito (
	Cod_Disciplina INT NOT NULL,
    Cod_Disc_Dependencia INT NOT NULL,
    FOREIGN KEY (Cod_Disciplina) REFERENCES disciplina(Cod_Disciplina),
    FOREIGN KEY (Cod_Disc_Dependencia) REFERENCES disciplina(Cod_Disciplina)
    )