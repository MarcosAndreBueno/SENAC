USE farmacia;

		/* PARTE 2: Realize algumas alterações nas tabelas e nos dados usando comandos de atualização e exclusão:*/
        
/*
Crie uma coluna “em atividade” para os médicos, indicando se ele ainda está atuando no hospital ou não. Crie script para atualizar ao menos dois médicos como inativos e os demais em atividade.
Crie script para atualizar as datas de alta nas internações em quartos de enfermaria para três dias após a entrada.
Crie script para excluir o último convênio cadastrado e todas as consultas realizadas com esse convênio.
*/

SELECT * FROM medicos;
/* Tabela "em atividade" já criada com o nome STATUS */
UPDATE medicos SET `STATUS` = 'I' WHERE (`idMedico` = '1' or idMedico = '2');
SELECT * FROM medicos;

SELECT * FROM internacao;
UPDATE `farmacia`.`internacao` SET `data_prev_alta` = (SELECT DATE_ADD(data_entrada, INTERVAL 3 DAY));
/* UPDATE `farmacia`.`internacao` SET `data_prev_alta` = (SELECT DATE_ADD(data_entrada, INTERVAL 3 DAY)) WHERE (`idInternacao` = '1');*/

SELECT * FROM consulta;
DELETE FROM consulta WHERE idConvenio = 4;