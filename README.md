# 🗄️ Sistema Universitário - Implementação em SQL

Este repositório contém a implementação prática em **SQL (DDL e DML)** para um banco de dados relacional universitário, desenvolvido a partir da modelagem conceitual (DER).

---

### 🛠️ Tecnologias Utilizadas
- **SQL (Structured Query Language)**
- **PostgreSQL / MySQL**
- **Git & GitHub**

---

### 📋 Estrutura do Banco de Dados (`schema.sql`)

O script inclui a criação das seguintes tabelas e relacionamentos:
- **CURSO:** Cadastro de cursos universitários.
- **DEPARTAMENTO:** Departamentos acadêmicos.
- **PROFESSOR:** Cadastro de professores vinculados a departamentos.
- **BOLSA:** Tipos e valores de bolsas de estudo.
- **ALUNO:** Registro de alunos com vínculo a cursos e bolsas.
- **DISCIPLINA:** Disciplinas com carga horária, período e suporte a pré-requisitos (auto-relacionamento).
- **MATRICULA:** Entidade associativa registrando a nota do aluno na disciplina.

---

### 🚀 Como Executar
1. Copie o conteúdo do arquivo [`schema.sql`](./schema.sql).
2. Execute em qualquer SGBD relacional (PostgreSQL, MySQL, SQLite) ou num simulador online como o [DB-Fiddle](https://www.db-fiddle.com/).
3. Realize consultas de teste, como:
   ```sql
   SELECT a.nome AS Aluno, c.nome_curso AS Curso, m.nota
   FROM ALUNO a
   JOIN CURSO c ON a.codigo_curso = c.codigo
   JOIN MATRICULA m ON a.matricula = m.matricula_aluno;
