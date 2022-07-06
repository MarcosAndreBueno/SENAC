Use farmacia;

		/* 1. Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.*/
			/* resposta da 1: */
SELECT *, 
(select avg(valor) from consulta where year(dataConsulta) = year (curdate()) - 2) as ValorMedio2020,
(select avg(valor) from consulta where idConvenio is not null and year(dataConsulta) = year (curdate()) - 2) as ValorMedioConveniados2020,
(select avg(valor) from consulta where idConvenio is not null) as ValorMedioConveniadosTodosAnos
FROM consulta
where year(dataConsulta) = year (curdate()) - 2
group by dataConsulta;

			/* 2. Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.*/
				/* resposta da 2: */
select *
from internacao
where data_prev_alta < data_alta;

			/* 3. Receituário completo da primeira consulta registrada com receituário associado.*/
				/* resposta da 3: */
select * from consulta, receita
where idConsulta = 1
group by idConsulta;

			/* 4. Todos os dados da consulta de maior valor e também da de menor valor 
					(ambas as consultas não foram realizadas sob convênio).*/	
				/* resposta da 4*/
select * from consulta
where valor = (select min(valor) from consulta) or valor = (select max(valor) from consulta);
                
			/* 5. Todos os dados das internações em seus respectivos quartos, calculando o total da 
			internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.*/
        /* resposta da 5*/
select I.*,
    T.valor_diaria,
    datediff (data_alta, data_entrada + 1) as diasInternado,
    (T.valor_diaria*(datediff (data_alta, data_entrada) + 1)) as valorTotal
from internacao I
inner join quarto Q on I.idQuarto = Q.idQuarto
inner join tipo_quarto T on Q.tipo = T.idTipoQuarto
;

				/* 6. Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.*/
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