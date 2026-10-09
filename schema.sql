-- ============================================================
-- PROJETO: BANCO DE DADOS SISTEMA UNIVERSITÁRIO
-- AUTORA: ELAINE RODRIGUES GOMES
-- ============================================================

-- 1. CRIAÇÃO DAS TABELAS (DDL)

CREATE TABLE CURSO (
    codigo INT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL
);

CREATE TABLE DEPARTAMENTO (
    codigo_dep INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE PROFESSOR (
    siape INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    codigo_dep INT,
    FOREIGN KEY (codigo_dep) REFERENCES DEPARTAMENTO(codigo_dep)
);

CREATE TABLE BOLSA (
    codigo_bolsa INT PRIMARY KEY,
    tipo_bolsa VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE ALUNO (
    matricula INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE,
    codigo_curso INT,
    codigo_bolsa INT,
    FOREIGN KEY (codigo_curso) REFERENCES CURSO(codigo),
    FOREIGN KEY (codigo_bolsa) REFERENCES BOLSA(codigo_bolsa)
);

CREATE TABLE DISCIPLINA (
    codigo_disc INT PRIMARY KEY,
    nome_disciplina VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    periodo VARCHAR(20),
    codigo_curso INT,
    siape_professor INT,
    codigo_prerequisito INT,
    FOREIGN KEY (codigo_curso) REFERENCES CURSO(codigo),
    FOREIGN KEY (siape_professor) REFERENCES PROFESSOR(siape),
    FOREIGN KEY (codigo_prerequisito) REFERENCES DISCIPLINA(codigo_disc)
);

CREATE TABLE MATRICULA (
    matricula_aluno INT,
    codigo_disciplina INT,
    nota DECIMAL(4,2),
    PRIMARY KEY (matricula_aluno, codigo_disciplina),
    FOREIGN KEY (matricula_aluno) REFERENCES ALUNO(matricula),
    FOREIGN KEY (codigo_disciplina) REFERENCES DISCIPLINA(codigo_disc)
);

-- ============================================================
-- 2. INSERÇÃO DE DADOS DE TESTE (DML)
-- ============================================================

INSERT INTO CURSO VALUES (1, 'Análise e Desenvolvimento de Sistemas');
INSERT INTO DEPARTAMENTO VALUES (10, 'Departamento de Tecnologia da Informação');
INSERT INTO PROFESSOR VALUES (1001, 'Kariston Luiz', 'Banco de Dados', 10);
INSERT INTO BOLSA VALUES (101, 'Mérito Acadêmico', 500.00);

INSERT INTO ALUNO VALUES (202501, 'Elaine Rodrigues Gomes', '000.000.000-00', '1995-05-10', 1, 101);
INSERT INTO DISCIPLINA VALUES (501, 'Modelagem de Dados', 80, '1º Semestre', 1, 1001, NULL);
INSERT INTO MATRICULA VALUES (202501, 501, 9.5);
