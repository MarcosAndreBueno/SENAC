CREATE TABLE farmacia;
USE farmacia;

create table medicos (
idMedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
crm VARCHAR(10) NOT NULL,
especialidade VARCHAR(20) NOT NULL,
STATUS CHAR(1) DEFAULT 'A'
);

create table especialidade (
funcao VARCHAR(20) NOT NULL
);

create table paciente (
idPaciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf VARCHAR(15) NOT NULL,
rg VARCHAR(15) NOT NULL,
dataNascimento VARCHAR(8) NOT NULL,
endereco VARCHAR(50) NOT NULL,
telefone VARCHAR(10) NOT NULL,
email VARCHAR(20),
STATUS CHAR(1) DEFAULT 'A'
);

create table convenio (
idConvenio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cnpj VARCHAR(15) NOT NULL,
tempoCarencia VARCHAR(8) NOT NULL,
STATUS CHAR(1) DEFAULT 'A'
);

create table receita (
medicamento VARCHAR(250) NOT NULL,
quantidade INT NOT NULL,
posologia VARCHAR(250) NOT NULL,
idMedico INT NOT NULL,
idPaciente INT NOT NULL,
FOREIGN KEY(idMedico) REFERENCES medicos(idMedico),
FOREIGN KEY(idPaciente) REFERENCES paciente(idPaciente)
);
ALTER TABLE receita ADD idReceita INT NOT NULL PRIMARY KEY AUTO_INCREMENT;

create table consulta(
idConsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idMedico INT NOT NULL,
dataConsulta DATE NOT NULL,
idConvenio INT NOT NULL,
FOREIGN KEY(idConvenio) REFERENCES convenio(idConvenio),
FOREIGN KEY(idReceita) REFERENCES receita(idReceita),
FOREIGN KEY(idMedico) REFERENCES medicos(idMedico),
FOREIGN KEY(idPaciente) REFERENCES paciente(idPaciente)
);
alter table consulta ADD idConvenio INT NOT NULL;
alter table consulta ADD FOREIGN KEY(idConvenio) REFERENCES convenio(idConvenio) ON DELETE CASCADE;
alter table consulta ADD idReceita INT NOT NULL;
alter table consulta ADD FOREIGN KEY(idReceita) REFERENCES receita(idReceita);