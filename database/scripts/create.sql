USE `mc536`;

CREATE TABLE `entidade_empresa` (
  `entidade_empresa_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '_id',
  `cnpj` varchar(14) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `saldo_auxiliar` double unsigned DEFAULT NULL,
  PRIMARY KEY (`entidade_empresa_id`)
);

CREATE TABLE `entidade_governo` (
  `entidade_governo_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '_id',
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `federacao` varchar(2) NOT NULL,
  PRIMARY KEY (`entidade_governo_id`)
);

CREATE TABLE `vaga_emprego` (
  `vaga_emprego_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '_id',
  `entidade_empresa_id` int unsigned DEFAULT NULL,
  `entidade_governo_id` int unsigned DEFAULT NULL,
  `tipo_vaga` varchar(1000) NOT NULL,
  `n_vagas` int unsigned NOT NULL,
  `local` varchar(200) DEFAULT NULL,
  `horario` varchar(200) DEFAULT NULL,
  `contato_entrevista` varchar(200) DEFAULT NULL,
  `experiencia_exigida` varchar(1000) DEFAULT NULL,
  `remuneracao` double unsigned DEFAULT NULL,
  PRIMARY KEY (`vaga_emprego_id`),
  KEY `vaga_emprego_FK` (`entidade_empresa_id`),
  KEY `vaga_emprego_FK_1` (`entidade_governo_id`),
  CONSTRAINT `vaga_emprego_FK` FOREIGN KEY (`entidade_empresa_id`) REFERENCES `entidade_empresa` (`entidade_empresa_id`),
  CONSTRAINT `vaga_emprego_FK_1` FOREIGN KEY (`entidade_governo_id`) REFERENCES `entidade_governo` (`entidade_governo_id`)
);


CREATE TABLE `entidade_pessoa_fisica` (
  `cpf` varchar(11) NOT NULL,
  `entidade_pessoa_fisica_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '_id',
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `federacao` varchar(2) NOT NULL,
  `renda_familiar` double unsigned DEFAULT NULL,
  `vaga_emprego_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`entidade_pessoa_fisica_id`),
  KEY `entidade_pessoa_fisica_FK` (`vaga_emprego_id`),
  CONSTRAINT `entidade_pessoa_fisica_FK` FOREIGN KEY (`vaga_emprego_id`) REFERENCES `vaga_emprego` (`vaga_emprego_id`)
);

CREATE TABLE `auxilio` (
  `auxilio_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '_id',
  `entidade_empresa_id` int unsigned DEFAULT NULL,
  `entidade_governo_id` int unsigned DEFAULT NULL,
  `entidade_pessoa_fisica_id` int unsigned DEFAULT NULL,
  `valor_mensal` double unsigned DEFAULT NULL,
  `valor_total` double unsigned DEFAULT NULL,
  `duracao_meses` int unsigned DEFAULT NULL,
  PRIMARY KEY (`auxilio_id`),
  KEY `auxilio_entidade_empresa_FK` (`entidade_empresa_id`),
  KEY `auxilio_entidade_governo_FK` (`entidade_governo_id`),
  KEY `auxilio_entidade_pessoa_fisica_FK` (`entidade_pessoa_fisica_id`),
  CONSTRAINT `auxilio_entidade_empresa_FK` FOREIGN KEY (`entidade_empresa_id`) REFERENCES `entidade_empresa` (`entidade_empresa_id`),
  CONSTRAINT `auxilio_entidade_governo_FK` FOREIGN KEY (`entidade_governo_id`) REFERENCES `entidade_governo` (`entidade_governo_id`),
  CONSTRAINT `auxilio_pessoa_fisica_FK` FOREIGN KEY (`entidade_pessoa_fisica_id`) REFERENCES `entidade_pessoa_fisica` (`entidade_pessoa_fisica_id`)
);

CREATE TABLE `rel_pessoa_busca_auxilio` (
  `rel_pessoa_busca_auxilio_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '_id',
  `entidade_pessoa_fisica_id` int unsigned DEFAULT NULL,
  `auxilio_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`rel_pessoa_busca_auxilio_id`),
  KEY `rel_pessoa_busca_auxilio_pessoa_FK` (`entidade_pessoa_fisica_id`),
  KEY `rel_pessoa_busca_auxilio_auxilio_FK` (`auxilio_id`),
  CONSTRAINT `rel_pessoa_busca_auxilio_auxilio_FK` FOREIGN KEY (`entidade_pessoa_fisica_id`) REFERENCES `entidade_pessoa_fisica` (`entidade_pessoa_fisica_id`),
  CONSTRAINT `rel_pessoa_busca_auxilio_pessoa_FK` FOREIGN KEY (`auxilio_id`) REFERENCES `auxilio` (`auxilio_id`)
);

CREATE TABLE `rel_pessoa_usa_auxilio` (
  `rel_pessoa_usa_auxilio_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '_id',
  `entidade_pessoa_fisica_id` int unsigned DEFAULT NULL,
  `auxilio_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`rel_pessoa_usa_auxilio_id`),
  KEY `rel_pessoa_usa_auxilio_entidade_pessoa_fisica_FK` (`entidade_pessoa_fisica_id`),
  KEY `rel_pessoa_usa_auxilio_auxilio_FK` (`auxilio_id`),
  CONSTRAINT `rel_pessoa_usa_auxilio_auxilio_FK` FOREIGN KEY (`auxilio_id`) REFERENCES `auxilio` (`auxilio_id`),
  CONSTRAINT `rel_pessoa_usa_auxilio_pessoa_fisica_id_FK` FOREIGN KEY (`entidade_pessoa_fisica_id`) REFERENCES `entidade_pessoa_fisica` (`entidade_pessoa_fisica_id`)
);
