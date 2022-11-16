-- Populando empresas (exemplos)
INSERT INTO `entidade_empresa` (`cnpj`, `nome`, `email`, `saldo_auxiliar`) VALUES
	('62922362000197', 'Fake Corp. LTDA', 'fake@corp.com', 10005.75),
	('27371215000175', 'Armstrong Corp. LTDA', 'armstrong@corp.com', 150000.00),
  ('23112866000190', 'Albert Corp.', 'albert@corp.com', 98500.00),
  ('18687721000187', 'Quick Starter', 'q.starter@corp.com', 10000.00);

-- Populando pessoas de cargo público no governo (exemplo)
INSERT INTO `entidade_governo` (`cpf`, `nome`, `email`, `federacao`) VALUES
	('83338927878', 'José da Silva Júnior', 'jose-silva@gov.br', 'SP');

-- Populando vagas de emprego (exemplos)
INSERT INTO `vaga_emprego` (`entidade_empresa_id`, `entidade_governo_id`, `tipo_vaga`, `n_vagas`, `local`, `horario`, `contato_entrevista`, `experiencia_exigida`, `remuneracao`) VALUES
	(1, NULL, 'Desenvolvedor Pleno JS', 2, 'Valinhos', '8:00:00 AM - 5:30:00 PM', 'fake@corp.com', '2+ anos de trabalho profissional com JS', 5000.00),
	(NULL, 1, 'Gerente de Desenvolvimento Backend', 1, 'Campinas', '8:00:00 AM - 5:30:00 PM', 'jose-silva@gov.br', '10+ anos de trabalho profissional com JS', 20000.00),
	(1, NULL, 'Desenvolvedor Júnior JS', 1, 'Paulínia', '8:00:00 AM - 5:30:00 PM', 'fake@corp.com', '2+ anos de trabalho profissional com JS', 2500.00),
  (2, NULL, 'Desenvolvedor Sênior SQL', 1, 'Londres', '5:00:00 AM - 4:30:00 PM', 'armstrong@corp.com', '7+ anos de trabalho profissional com JS', 15000.00),
	(2, NULL, 'Estagiário em Desenvolvimento JS', 1, 'Londres', '5:00:00 AM - 2:30:00 PM', 'armstrong@corp.com', NULL, 2000.00);


-- Populando pessoas físicas (exemplos)
INSERT INTO `entidade_pessoa_fisica` (`cpf`, `nome`, `email`, `federacao`, `renda_familiar`, `vaga_emprego_id`) VALUES
	('91425674836', 'João Souza Pereira', 'joao@gmail.com', 'SP', 0.0, NULL),
  ('22717824731', 'Daniel Augusto Alves', 'daniel.aa@gmail.com', 'MG', 2000.0, 4),
	('27537031320', 'Lucas Pitt Smith', 'luca.spitts@hotmail.com', 'SP', 0.0, NULL),
	('99434128528', 'Gabriel Silva Lima', 'glima@gmail.com', 'SP', 20000.0, 2),
  ('07688730961', 'Lucas Brad', 'luke.skybrad@outlook.com', 'SP', 0.0, NULL);

-- Populando auxílios dados por entidades (exemplo)
INSERT INTO `auxilio` (`entidade_empresa_id`, `entidade_governo_id`, `entidade_pessoa_fisica_id`, `valor_mensal`, `valor_total`, `duracao_meses`) VALUES
	(NULL, 1, NULL, 3000.00, 3000.00, 1),
  (3, NULL, NULL, 6000.00, 12000.00, 2);

-- Populando relação de busca de auxílios (exemplo)
INSERT INTO `rel_pessoa_busca_auxilio` (`entidade_pessoa_fisica_id`, `auxilio_id`) VALUES
	(1, 1),
  (1, 2),
  (3, 2),
  (4, 2),
  (5, 2);

-- Populando a tabela de relação entre os usos de auxílios por pessoas físicas (exemplo)
INSERT INTO `rel_pessoa_usa_auxilio` (`entidade_pessoa_fisica_id`, `auxilio_id`) VALUES
	(1, 1),
    (5, 2);
