USE farmacia;

			/* PARTE 1: Crie scripts de povoamento das tabelas desenvolvidas na Atividade 2:*/
		
SELECT * FROM especialidade;
INSERT INTO especialidade(idEspecialidade, especialidade) VALUES
(1, 'clínica geral'),
(2, 'pediatria'),
(3, 'gastroenterologia'),
(4, 'dermatologista'),
(5, 'obstetra'),
(6, 'ginecologista'),
(7, 'fisioterapeuta'
);

SELECT * FROM funcao;
INSERT INTO funcao(idFuncao, funcao) VALUES
(1, 'clínico geral'),
(2, 'especialista'),
(3, 'residente'
);
SELECT * FROM medicos;
ALTER TABLE medicos ADD funcao VARCHAR(20) NOT NULL;
ALTER TABLE medicos DROP COLUMN especialidade;
ALTER TABLE medicos ADD especialidade VARCHAR(50) NOT NULL;
DELETE FROM medicos;
SELECT * FROM medicos;
ALTER TABLE medicos AUTO_INCREMENT = 1;
INSERT INTO medicos(nome, crm, idEspecialidade, idFuncao, especialidade, funcao) VALUES
('Anny Quintanilha', '120935', 2, 2, 'pediatria', 'especialista'),
('Suéli Simão Pegado', '15891', 1, 3, 'clínica geral', 'residente'),
('Alisson Sacramento', '178105', 1, 2,  'clínica geral', 'especialista'),
('Lívia Veloso', '17897', 3, 2, 'gastroenterologia', 'especialista'),
('Gael Milheiro Lemes', '9826', 2, 2, 'pediatria', 'especialista'),
('Gisela Espinosa', '34548', 3, 1, 'gastroenterologia', 'generalista'),
('Nelson Anjos Palmeira', '344789', 4, 2, 'dermatologista', 'especialista'),
('Ezequiel Pestana Henriques', '9756', 1, 2, 'clínica geral', 'especialista'),
('Tito Carqueijeiro', '14777', 2, 1, 'pediatria', 'generalista'),
('Fabiano Gomide', '65765', 2, 3, 'pediatria', 'residente'),
('Cristovão Xavier', '67432', 1, 2, 'clínica geral', 'especialista'),
('Alberto Veríssimo', '13548', 1, 3, 'clínica geral', 'residente'),
('Júlia Camarinho', '24654', 4, 1, 'dermatologista', 'generalista'),
('José Camargo', '82793', 5, 1, 'obstetra', 'generalista'),
('Luís Beto', '17264', 6, 3, 'ginecologista', 'residente'),
('Manuel Diaz', '52645', 7, 2, 'fisioterapeuta', 'especialista'
);

SELECT * FROM convenio;
ALTER TABLE convenio AUTO_INCREMENT = 1;
INSERT INTO convenio(nome, cnpj, tempoCarencia) VALUES
('NotreDame', '15293762549382', '10 dias'),
('Hapvida', '87253700146221', '20 dias'),
('Bradesco', '63923762549895', '15 dias'),
('Amil', '53293712549343', '30 dias'
);

DELETE FROM paciente;
ALTER TABLE paciente AUTO_INCREMENT = 1;
SELECT * FROM paciente;
INSERT INTO paciente(nome, cpf, rg, dataNascimento, endereco, telefone) VALUES
('Maria', '26345327611', '364513763','22-08-75', 'Rua xxxxx', 'xxxx-xxxx'),
('Pedro', '26456427611', '561313763','11-02-85', 'Rua xxxxx', 'xxxx-xxxx'),
('Lúcio', '26345348561', '642713763','5-05-89', 'Rua xxxxx', 'xxxx-xxxx'),
('Ana', '26363936761', '676113763','9-03-96', 'Rua xxxxx', 'xxxx-xxxx'),
('Zelda', '26345372438', '364564063','30-08-55', 'Rua xxxxx', 'xxxx-xxxx'),
('Doncic', '26345050672', '360032763','10-01-71', 'Rua xxxxx', 'xxxx-xxxx'),
('Sabo', '26346392758', '263413763','09-11-80', 'Rua xxxxx', 'xxxx-xxxx'),
('Fernanda', '26659027611', '590213763','01-10-68', 'Rua xxxxx', 'xxxx-xxxx'),
('Wiggins', '30589327611', '364517611','4-03-91', 'Rua xxxxx', 'xxxx-xxxx'),
('Luca', '1742327611', '376113763','17-08-82', 'Rua xxxxx', 'xxxx-xxxx'),
('Antonieta', '04875327611', '048713763','14-01-67', 'Rua xxxxx', 'xxxx-xxxx'),
('Marjorie', '43346392765', '023413763','2-12-74', 'Rua xxxxx', 'xxxx-xxxx'),
('Ruppert', '48259027632', '592713763','24-02-98', 'Rua xxxxx', 'xxxx-xxxx'),
('Arnaldo', '30589327668', '3645170080','09-05-99', 'Rua xxxxx', 'xxxx-xxxx'),
('Agnaldo', '1746277611', '376118592','16-7-68', 'Rua xxxxx', 'xxxx-xxxx'),
('Estefano', '04890127611', '028713172','29-4-78', 'Rua xxxxx', 'xxxx-xxxx'
);

SHOW CREATE TABLE consulta;
ALTER TABLE consulta DROP FOREIGN KEY consulta_ibfk_1;
ALTER TABLE consulta DROP COLUMN idReceita;
SELECT * FROM consulta;
DELETE FROM consulta;
ALTER TABLE consulta AUTO_INCREMENT = 1;
INSERT INTO consulta(idPaciente, idMedico, dataConsulta, idConvenio, idReceita) VALUES
(10,15,'2018-05-24', 1, 1),
(9,10,'2016-12-06', 3, 2),	
(6,13,'2017-03-19', 2, 3),
(5,6,'2015-05-05', 2, 4),
(1,2,'2014-03-31', 4, 5),
(3,9,'2021-01-01', 1, 6),
(12,4,'2018-04-21', 3, 7),
(7,3,'2020-09-09', 1, 8),
(10,16,'2016-01-04', 4, 9),
(4,4,'2015-08-15', 2, 10),
(15,2,'2020-11-02', 1, 11),
(9,1,'2017-07-28', 3, 12),
(3,8,'2015-07-30', 3, 13),
(11,15,'2016-10-10', 1, 14),
(2,12,'2018-11-25', 2, 15),
(14,11,'2017-06-13', 1, 16),
(7,1,'2020-07-14', 1, 17),
(9,9,'2021-05-02', 3, 18),
(1,7,'2019-02-02', 1, 19),
(8,6,'2021-02-14', 3, 20
);


SELECT * FROM receita;
DELETE FROM receita;
ALTER TABLE receita AUTO_INCREMENT = 1;
INSERT INTO receita(medicamento, quantidade, posologia) VALUES
('desogestrel, dipirona', 1, 'via oral'),
('ibuprofeno', 1, 'via oral'),
('sensibioDS', 1, 'via oral'),
('omeprazol, dipirona', 1, 'via oral'),
('dipirona, cebion', 1, 'via oral'),
('ibuprofeno, dipirona', 1, 'via oral'),
('omeprazol', 1, 'via oral'),
('dipirona', 1, 'via oral'),
('miosan, omeprazol', 1, 'via oral'),
('omeprazol, dipirona', 1, 'via oral'),
('paracetamol', 1, 'via oral'),
('ibuprofeno, melhoralInfantil', 1, 'via oral'),
('dipirona, omeprazol', 1, 'via oral'),
('desogestrel, omeprazol', 1, 'via oral'),
('paracetamol', 1, 'via oral'),
('dipirona, dicoflenaco', 1, 'via oral'),
('ibuprofeno', 1, 'via oral'),
('ibuprofeno', 1, 'via oral'),
('sensibioDs', 1, 'via oral'),
('omeprazol, dicoflenaco', 1, 'via oral'
);

/* quartos , tipo quartos(3 dos 3 tipos, com valores), enfermeiros(10), internação(7, 4 quartos, 2 pacientes 2 vezes), */
SELECT * FROM tipo_quarto;
DELETE FROM tipo_quarto;
ALTER TABLE tipo_quarto AUTO_INCREMENT = 1;
INSERT INTO `farmacia`.`tipo_quarto` (`descricao`, `valor_diaria`) VALUES 
('enfermaria', '50'),
('apartamento', '100'),
('quartos duplos', '20');

SELECT * FROM quarto;
DELETE FROM quarto;
ALTER TABLE quarto AUTO_INCREMENT = 1;
INSERT INTO `farmacia`.`quarto` (`numero`, `tipo`) VALUES 
('1', '1'),
('2', '1'),
('3', '1'),
('4', '2'),
('5', '2'),
('6', '2'),
('7', '3'),
('8', '3'),
('9', '3');

SELECT * FROM enfermeiro;
ALTER TABLE enfermeiro AUTO_INCREMENT = 1;
INSERT INTO enfermeiro(nome,cpf,cre) VALUES
('Rita', '43628175892', '836274'),
('Beatriz', '73682935490', '182736'),
('Sara', '09738946728', '285930'),
('Ricardo', '17263547384', '583749'),
('Pedro', '17263546275', '559847'),
('Diego', '18274637589', '095748'),
('Diva', '92888462756', '495849'),
('João', '17244920394', '403958'),
('José', '92756226452', '573829'),
('Tiago', '28172635411', '282634');

SELECT * FROM internacao;
DELETE FROM internacao;
ALTER TABLE internacao AUTO_INCREMENT = 1;
INSERT INTO `farmacia`.`internacao` (`data_entrada`, `data_prev_alta`, `data_alta`, `procedimento`, `idEnfermeiro`, `idPaciente`, `idMedico`, `idQuarto`) VALUES 
('2021-08-12', '2021-08-22', '2021-08-16', '\'\'', '1', '14', '1', '1'),
('2020-08-01', '2020-10-01', '2020-12-01', '\'\'', '5', '12', '15', '1'),
('2021-05-26', '2021-05-28', '2021-05-29', '\'\'', '10', '4', '2', '2'),
('2017-03-04', '2017-06-04', '2017-05-04', '\'\'', '4', '7', '14', '4'),
('2016-02-22', '2016-02-28', '2016-03-28', '\'\'', '5', '4', '2', '9'),
('2016-02-19', '2016-03-01', '2016-03-05', '\'\'', '2', '11', '1', '7'),
('2021-11-09', '2021-09-23', '2021-10-23', '\'\'', '3', '12', '9', '8');