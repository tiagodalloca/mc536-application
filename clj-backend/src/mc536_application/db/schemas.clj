(ns mc536-application.db.schemas)

(def entidade-empresa
  [:map
   [:entidade_empresa_id int?]
   [:cnpj [string? {:min 14 :max 14}]]
   [:nome string?]
   [:email {:optional true} string?]
   [:saldo_auxiliar {:optional true} float?]])

(def entidade-governo
  [:map
   [:entidade_governo_id int?]
   [:cnpj string?]
   [:nome string?]
   [:email {:optional true} string?]
   [:federacao [string? {:min 2 :max 2}]]])

(def vaga-emprego
  [:map
   [:vaga_emprego_id int?]
   [:entidade_empresa_id {:optional true} int?]
   [:entidade_governo_id {:optional true} int?]
   [:tipo_vaga string?]
   [:n_vagas int?]
   [:local {:optional true} string?]
   [:horario {:optional true} string?]
   [:contato_entrevista {:optional true} string?]
   [:experiencia_exigida {:optional true} string?]
   [:remuneracao {:optional true} float?]])

(def entidade-pessoa-fisica
  [:map
   [:entidade_pessoa_fisica_id int?]
   [:cpf [string? {:min 11 :max 11}]]
   [:nome string?]
   [:email {:optional true} string?]
   [:federacao [string? {:min 2 :max 2}]]
   [:renda_familiar {:optional true} float?]
   [:vaga_emprego_id {:optional true} int?]])

(def auxilio
  [:map
   [:auxilio_id int?]
   [:entidade_empresa_id {:optional true} int?]
   [:entidade_governo_id {:optional true} int?]
   [:entidade_pessoa_fisica_id {:optional true} int?]
   [:valor_mensal {:optional true} float?]
   [:valor_total {:optional true} float?]
   [:duracao_meses {:optional true} int?]])

(def rel-pessoa-busca-auxilio
  [:map
   [:rel_pessoa_busca_auxilio_id int?]
   [:entidade_pessoa_fisica_id int?]
   [:auxilio_id int?]])

(def rel-pessoa-usa-auxilio
  [:map
   [:rel_pessoa_usa_auxilio_id int?]
   [:entidade_pessoa_fisica_id int?]
   [:auxilio_id int?]])

