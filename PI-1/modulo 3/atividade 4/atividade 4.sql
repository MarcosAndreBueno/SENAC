Use farmacia;

		/* 1. Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.*/
		
		/* mudanças necessárias*/
select dataConsulta;
select * from consulta;
select * from medicos;
alter table consulta add valor INT NOT NULL;

select A.idMedico, B.especialidade
from consulta A JOIN medicos B
ON (A.idMedico = B.idMedico)
GROUP BY A.idMedico;

update consulta set valor = 200 where idMedico = '1' or idMedico = '9' or idMedico = '10';
update consulta set valor = 100 where idMedico = '2' or idMedico = '3' or idMedico = '8' or idMedico = '11' or idMedico = '12';
update consulta set valor = 300 where idMedico = '4' or idMedico = '6';
update consulta set valor = 400 where idMedico = '7' or idMedico = '13';
update consulta set valor = 400 where idMedico = '15' or idMedico = '16';

select A.idMedico, B.especialidade, A.valor
from consulta A JOIN medicos B
ON (A.idMedico = B.idMedico)
GROUP BY A.idMedico;

		/* resposta da 1: */
SELECT *, 
(select avg(valor) from consulta where year(dataConsulta) = year (curdate()) - 2) as ValorMedio2020,
(select avg(valor) from consulta where idConvenio is not null and year(dataConsulta) = year (curdate()) - 2) as ValorMedioConveniados2020,
(select avg(valor) from consulta where idConvenio is not null) as ValorMedioConveniadosTodosAnos
FROM consulta
where year(dataConsulta) = year (curdate()) - 2
group by dataConsulta;

		/* 2. Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.*/
select * from internacao;

		/* resposta da 2: */
select *
from internacao
where data_prev_alta < data_alta;

		/* 3. Receituário completo da primeira consulta registrada com receituário associado.*/
select * from consulta, receita
where idConsulta= 1
group by idConsulta;

		/* 4. Todos os dados da consulta de maior valor e também da de menor valor 
		(ambas as consultas não foram realizadas sob convênio).*/
		
        /* mudanças necessárias*/
select * from consulta;
alter table consulta drop foreign key consulta_ibfk_4;
alter table consulta drop column idConvenio;
alter table consulta add column idConvenio INT;
alter table consulta add foreign key(idConvenio) references convenio(idConvenio);
select * from convenio;
update consulta set idConvenio = null where idConsulta = 1 or idConsulta = 20;
update consulta set valor = 600 where idConsulta = 1;
update consulta set valor = 50 where idConsulta = 20;
update consulta set idConvenio = 1 where idConsulta = 2 or idConsulta = 4 or idConsulta = 6 or idConsulta = 19;
update consulta set idConvenio = 2 where idConsulta = 5 or idConsulta = 16 or idConsulta = 14 or idConsulta = 12;
update consulta set idConvenio = 3 where idConsulta = 7 or idConsulta = 18 or idConsulta = 10 or idConsulta = 18;
update consulta set idConvenio = 1 where idConsulta = 9 or idConsulta = 4 or idConsulta = 17 or idConsulta = 15;
update consulta set idConvenio = 4 where idConsulta = 11 or idConsulta = 3 or idConsulta = 13 or idConsulta = 8;
			/* resposta da 4*/
select * from consulta
where valor = (select min(valor) from consulta) or valor = (select max(valor) from consulta);

			/* 5. Todos os dados das internações em seus respectivos quartos, calculando o total da 
			internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.*/
			/* dados necessários*/
select * from internacao;
select * from quarto;
select * from tipo_quarto;
UPDATE `farmacia`.`internacao` SET `data_alta` = '2021-11-09' WHERE (`idInternacao` = '7');

select *, DATEDIFF (data_alta, data_entrada) +1 as diasInternados
from internacao where idQuarto = 1;

select *, DATEDIFF (data_alta, data_entrada) + 1 as diasInternados, (select diasInternados*50)
from internacao where idQuarto = 1;

select Q.idQuarto, valor_diaria as valorDiario from quarto Q, tipo_quarto T where T.idTipoQuarto = Q.tipo;

select *, 
(select T.valor_diaria from tipo_quarto T where T.idTipoQuarto = Q.tipo) as valorDiario
from internacao I, quarto Q
where I.idQuarto = Q.idQuarto
group by I.idInternacao
order by I.idInternacao;

				/* resposta da 5*/
select I.*,
(select T.valor_diaria from tipo_quarto T where T.idTipoQuarto = Q.tipo) as valorDiaria,
(select DATEDIFF (data_alta, data_entrada) + 1) as diasInternados,
(select diasInternados*valorDiaria) as valorTotal
from internacao I, quarto Q
where I.idQuarto = Q.idQuarto
group by I.idInternacao
order by I.idInternacao;

select I.*,
    T.valor_diaria,
    datediff (data_alta, data_entrada + 1) as diasInternado,
    (T.valor_diaria*(datediff (data_alta, data_entrada) + 1)) as valorTotal
from internacao I
inner join quarto Q on I.idQuarto = Q.idQuarto
inner join tipo_quarto T on Q.tipo = T.idTipoQuarto
;

			/* 6. Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.*/
            /* dados necessários*/
select idQuarto from quarto where tipo = (select idTipoQuarto from tipo_quarto where descricao = 'apartamento');
select idTipoQuarto from tipo_quarto where descricao = ('apartamento');

			/* resposta da 6*/
select
	I.idInternacao, I.procedimento, I.data_entrada, 
    I.data_prev_alta, I.data_alta, T.descricao
from internacao I inner join quarto Q
on I.idQuarto = Q.idQuarto
inner join tipo_quarto T
on Q.tipo = T.idTipoQuarto and descricao = 'enfermaria';

				/* 7. Nome do paciente, data da consulta e especialidade de todas as
				consultas em que os pacientes eram menores de 18 anos na data da consulta
				e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.*/

                /* dados necessários*/
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '75-08-22' WHERE (`idPaciente` = '1');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '94-11-02' WHERE (`idPaciente` = '2');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '07-5-05' WHERE (`idPaciente` = '3');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '96-9-03' WHERE (`idPaciente` = '4');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '99-08-30' WHERE (`idPaciente` = '5');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '04-01-10' WHERE (`idPaciente` = '6');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '05-11-09' WHERE (`idPaciente` = '7');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '07-10-01' WHERE (`idPaciente` = '8');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '11-4-3' WHERE (`idPaciente` = '9');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '82-08-17' WHERE (`idPaciente` = '10');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '70-01-14' WHERE (`idPaciente` = '11');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '74-12-2' WHERE (`idPaciente` = '12');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '98-02-24' WHERE (`idPaciente` = '13');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '99-09-5' WHERE (`idPaciente` = '14');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '87-7-16' WHERE (`idPaciente` = '15');
UPDATE `farmacia`.`paciente` SET `dataNascimento` = '78-4-29' WHERE (`idPaciente` = '16');
select * from consulta;
select * from paciente;
select * from medicos;
			/*
			idConsulta = idPaciente (linha 1: 1 = 10)
			idPaciente: nome, datanascimento
			dataConsulta: (-) datanascimento, filtrar > 18anos
			idMedico: especialidade, excluir pediatras; 
			*/
select idConsulta, idPaciente,
(select nome from paciente P where P.idPaciente = C.idPaciente) as nomePaciente,
(select dataNascimento from paciente P where P.idPaciente = C.idPaciente) as nascimento,
(select nome from medicos M where M.idMedico = C.idMedico) as nomeMedico,
(select especialidade from medicos M where M.idMedico = C.idMedico) as especialidade,
dataConsulta,
(select year(dataconsulta) - year (nascimento)) as idade,
(select idPaciente where (year(dataconsulta) - year (nascimento) < 18 )) as menores18
from consulta C
group by menores18;
							
                            /* resposta da 7*/
select 
	c.idConsulta,
	p.idPaciente, 
	p.nome as nomePaciente, 
	p.dataNascimento as nascimento, 
	m.nome as nomeMedico, 
	m.especialidade,
    c.dataConsulta,
	timestampdiff(YEAR, p.dataNascimento, dataConsulta) as idade
from consulta c
inner join paciente p on c.idPaciente = p.idPaciente and YEAR(dataConsulta) - YEAR(p.dataNascimento) < 18
inner join medicos m on c.idMedico = m.idMedico and especialidade <> 'pediatria'
order by c.dataConsulta
;

				/* 8. Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas 
						por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.*/

select * from internacao;
select * from medicos;
UPDATE `farmacia`.`internacao` SET `idMedico` = '4' WHERE (`idInternacao` = '3');

				/*resposta da 8*/
select
	P.nome as nomePaciente,
    M.nome as nomeMedico,
    I.data_entrada as dataInternacao,
    I.procedimento,
    M.especialidade as especialidadeMedico,
    T.descricao as tipoQuarto
from internacao I inner join paciente P
on I.idPaciente = P.idPaciente
inner join medicos M
on I.idMedico = M.idMedico and M.especialidade = 'gastroenterologia'
inner join quarto Q
on I.idQuarto = Q.idQuarto 
inner join tipo_quarto T
on Q.tipo = T.idTipoQuarto and T.descricao = 'enfermaria'
;

			/* 9. Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.*/
			
            /* resposta da 9 */
select C.idMedico, M.nome, M.crm, count(*) as totalConsultas
from consulta C
inner join medicos M
on C.idMedico = M.idMedico
group by idMedico;
select * from medicos;

		/* 10. Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.*/

		/* resposta da 10*/
select E.idEnfermeiro, E.nome, E.cre, count(*) as totalInternacoes
    from enfermeiro E
    inner join internacao I
    on E.idEnfermeiro = I.idEnfermeiro
    group by idEnfermeiro
    HAVING count(*) > 1;
    ;