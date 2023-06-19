#MOSTRA DADOS DOS ENFERMEIROS QUE PARTICIPARAM DE OCORRÊNCIAS NOS ÚLTIMOS 6 MESES
CREATE VIEW enfermeiros_ocorrencias_6_meses as
SELECT DISTINCT (e.coren), f.nome, f.salario, f.telefone, e.especializacao, o.id_ocorrencia
from FUNCIONARIOS f
INNER JOIN ENFERMEIROS e 
ON f.id_funcionario = e.funcionario_id
INNER JOIN OCORRENCIA o
ON o.enfermeiro_id = e.id_enfermeiro
WHERE o.data_hora BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW();


#MOSTRA INFORMAÇÕES DOS MÉDICOS DO HOSPITAL
CREATE VIEW medicos_hospital as
SELECT f.nome, f.salario, f.telefone, f.sexo, m.crm 
from MEDICOS m INNER JOIN FUNCIONARIOS f
ON m.funcionario_id = f.id_funcionario;


#LISTA AS AMBULÂNCIAS DISPONÍVEIS NO HOSPITAL
CREATE VIEW ambulancias_disponiveis as
select * from AMBULANCIAS a where a.disponibilidade = 1;


#QUANTIDADE DE FUNCIONARIOS DE CADA SEXO
CREATE VIEW sexo_funcionarios as
select f.sexo,count(*) as quantidade from Funcionarios f group by f.sexo;


#SOMA DOS SALÁRIOS DOS FUNCIONÁRIOS, GERANDO A FOLHA SALARIAL DO HOSPITAL
CREATE VIEW folha_salarial as
SELECT sum(f.salario) as 'FOLHA DE PAGAMENTO'
from FUNCIONARIOS f;