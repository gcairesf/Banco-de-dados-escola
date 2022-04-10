USE escola;

-- 1) Produza um relatório que contenha os dados dos alunos matriculados em todos os cursos oferecidos pela escola
SELECT * FROM aluno a, matricula m WHERE a.CPF = m.CPF_Aluno;

-- 2) Produza um relatório com os dados de todos os cursos, com suas respectivas disciplinas, oferecidos pela escola
SELECT c.*, d.Nome_Disciplina FROM curso c, disciplina d, compoe cp WHERE cp.Cod_Curso = c.Cod_Curso AND d.Cod_Disciplina = cp.Cod_Disciplina;

-- 3) Produza um relatório que contenha o nome dos alunos e as disciplinas em que estão matriculados
SELECT a.Nome, d.Nome_Disciplina FROM aluno a, disciplina d INNER JOIN cursa c WHERE a.CPF = c.CPF_Aluno and c.Cod_Disciplina = d.Cod_Disciplina;

-- 4) Produza um relatório com os dados dos professores e as disciplinas que ministram
SELECT p.*, d.Nome_disciplina FROM professor p, disciplina d WHERE d.Matricula_Professor = p.Matricula_Professor;

-- 5) Produza um relatório com os nomes das disciplinas e seus pré-requisitos
CREATE VIEW dependencias AS SELECT d.Nome_Disciplina, p.Cod_Disc_Dependencia FROM disciplina d, pre_requisito p WHERE p.Cod_Disciplina = d.Cod_Disciplina;
SELECT dd.Nome_Disciplina, d.Nome_Disciplina AS Dependencia FROM dependencias dd, disciplina d WHERE dd.Cod_Disc_Dependencia = d.Cod_Disciplina;
DROP VIEW dependencias;

-- 6) Produza um relatório com a média de idade dos alunos matriculados em cada curso
SELECT c.Nome, (SELECT AVG(TIMESTAMPDIFF(YEAR , a.Data_Nascimento, NOW())) FROM aluno a , matricula m where c.Cod_Curso = m.Cod_Curso and a.CPF = m.CPF_Aluno) as idade_media from curso c;

-- 7) Produza um relatório com os cursos oferecidos por cada departamento
SELECT d.Nome, c.Nome FROM Departamento d, Curso c where c.Cod_departamento = d.Cod_Departamento;