-- Relação de todas as pessoas com seus auxílios recebidos
SELECT `pessoa_fisica`.`nome`, `pessoa_fisica`.`cpf`, `aux`.`valor_mensal`, `aux`.`valor_total`, `aux`.`duracao_meses`
FROM `rel_pessoa_usa_auxilio` AS `relacao_uso`
INNER JOIN `entidade_pessoa_fisica` AS `pessoa_fisica` ON `pessoa_fisica`.`entidade_pessoa_fisica_id` = `relacao_uso`.`entidade_pessoa_fisica_id`
INNER JOIN `auxilio` AS `aux` ON `aux`.`auxilio_id` = `relacao_uso`.`auxilio_id`;

-- Relação de todas as pessoas com seus auxílios buscados
SELECT `pessoa_fisica`.`nome`, `pessoa_fisica`.`cpf`, `aux`.`valor_mensal`, `aux`.`valor_total`, `aux`.`duracao_meses`
FROM `rel_pessoa_busca_auxilio` AS `relacao_busca`
INNER JOIN `entidade_pessoa_fisica` AS `pessoa_fisica` ON `pessoa_fisica`.`entidade_pessoa_fisica_id` = `relacao_busca`.`entidade_pessoa_fisica_id`
INNER JOIN `auxilio` AS `aux` ON `aux`.`auxilio_id` = `relacao_busca`.`auxilio_id`;

-- Relação de todos os governos com suas ofertas de vagas de emprego
SELECT `governo`.`nome`, `governo`.`cpf`, `governo`.`federacao`, `vaga`.`local`, `vaga`.`tipo_vaga`, `vaga`.`n_vagas`,
    `vaga`.`horario`, `vaga`.`contato_entrevista`, `vaga`.`experiencia_exigida`, `vaga`.`remuneracao`
FROM `vaga_emprego` AS `vaga`
INNER JOIN `entidade_governo` AS `governo` ON `governo`.`entidade_governo_id` = `vaga`.`entidade_governo_id`;

-- Relação de todas as empresas com suas ofertas de vagas de emprego
SELECT  `empresa`.`nome`,  `empresa`.`cnpj`, `vaga`.`tipo_vaga`, `vaga`.`n_vagas`, `vaga`.`local`, `vaga`.`horario`, 
    `vaga`.`contato_entrevista`, `vaga`.`experiencia_exigida`, `vaga`.`remuneracao`
FROM `vaga_emprego` AS `vaga`
INNER JOIN `entidade_empresa` AS `empresa` ON `empresa`.`entidade_empresa_id` = `vaga`.`entidade_empresa_id`;

-- Relação de todos os governos com seus auxílios oferecidos
SELECT `governo`.`nome`, `governo`.`cpf`, `governo`.`federacao`, `aux`.`valor_mensal`, 
    `aux`.`valor_total`, `aux`.`duracao_meses`
FROM `auxilio` AS `aux`
INNER JOIN `entidade_governo` AS `governo` ON `governo`.`entidade_governo_id` = `aux`.`entidade_governo_id`;

-- Relação de todas as empresas com seus auxílios oferecidos
SELECT `empresa`.`nome`, `empresa`.`cnpj`, `aux`.`valor_mensal`, `aux`.`valor_total`, `aux`.`duracao_meses`
FROM `auxilio` AS `aux`
INNER JOIN `entidade_empresa` AS `empresa` ON `empresa`.`entidade_empresa_id` = `aux`.`entidade_empresa_id`;

-- Relação de todas as vagas de emprego disponíveis (n_vagas > 0)
SELECT vaga.tipo_vaga, vaga.n_vagas, vaga.local, vaga.horario, 
    vaga.contato_entrevista, vaga.experiencia_exigida, vaga.remuneracao
FROM vaga_emprego AS vaga
WHERE vaga.n_vagas > 0;

-- Relação de todos os governos com a quantidade de auxilios oferecidos
SELECT governo.nome, governo.cpf, governo.federacao, COUNT(0)
FROM entidade_governo AS governo, auxilio
WHERE governo.entidade_governo_id = auxilio.entidade_governo_id
GROUP BY governo.entidade_governo_id;

-- Relação de todas as empresas com a quantidade de auxilios oferecidos
SELECT empresa.nome, empresa.cnpj, COUNT(0)
FROM entidade_empresa AS empresa, auxilio
WHERE empresa.entidade_empresa_id = auxilio.entidade_empresa_id
GROUP BY empresa.entidade_empresa_id;

-- Consulta que seria feita pelo governo ou pelas empresas para 
-- obter os dados de todas as pessoas físicas no sistema
SELECT * FROM entidade_pessoa_fisica;
