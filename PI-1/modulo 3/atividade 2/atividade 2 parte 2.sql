Use farmacia;

create table quarto (
idQuarto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
numero INT NOT NULL,
tipo INT NOT NULL,
FOREIGN KEY(tipo) REFERENCES tipo_quarto(idTipoQuarto),
STATUS CHAR(1) DEFAULT 'A'
);
ALTER TABLE quarto AUTO_INCREMENT = 1;

create table tipo_quarto (
idTipoQuarto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(250) NOT NULL,
valor_diaria INT NOT NULL,
STATUS CHAR(1) DEFAULT 'A'
);

create table internacao (
idInternacao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
data_entrada VARCHAR(8) NOT NULL,
data_prev_alta VARCHAR(8) NOT NULL,
data_alta VARCHAR(8) NOT NULL,
procedimento VARCHAR(250) NOT NULL,
STATUS CHAR(1) DEFAULT 'A'
);
ALTER TABLE internacao ADD idEnfermeiro INT NOT NULL;
ALTER TABLE internacao ADD idPaciente INT NOT NULL;
ALTER TABLE internacao ADD idMedico INT NOT NULL;
ALTER TABLE internacao ADD idQuarto INT NOT NULL;
ALTER TABLE internacao ADD FOREIGN KEY(idEnfermeiro) REFERENCES enfermeiro(idEnfermeiro);
ALTER TABLE internacao ADD FOREIGN KEY(idPaciente) REFERENCES paciente(idPaciente);
ALTER TABLE internacao ADD FOREIGN KEY(idMedico) REFERENCES medicos(idMedico);
ALTER TABLE internacao ADD FOREIGN KEY(idQuarto) REFERENCES quarto(idQuarto);
ALTER TABLE internacao AUTO_INCREMENT = 1;

create table enfermeiro (
idEnfermeiro INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf VARCHAR(15) NOT NULL,
cre VARCHAR(20) NOT NULL,
STATUS CHAR(1) DEFAULT 'A'
);
ALTER TABLE enfermeiro AUTO_INCREMENT = 1;