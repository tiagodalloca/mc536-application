(ns mc536-application.db.tables
  (:require [mc536-application.db.schemas :as db-schemas]))

(def entidade-empresa
  {:name "entidade_empresa"
   :id :entidade_empresa_id
   :schema db-schemas/entidade-empresa})

(def entidade-governo
  {:name "entidade_governo"
   :id :entidade_governo_id
   :schema db-schemas/entidade-governo})

(def vaga-emprego
  {:name "vaga_emprego"
   :id :vaga_emprego_id
   :schema db-schemas/vaga-emprego})

(def entidade-pessoa-fisica
  {:name "entidade_pessoa_fisica"
   :id :entidade_pessoa_fisica_id
   :schema db-schemas/entidade-pessoa-fisica})

(def auxilio
  {:name "auxilio"
   :id :auxilio_id
   :schema db-schemas/auxilio})

(def rel-pessoa-busca-auxilio
  {:name "rel_pessoa_busca_auxilio"
   :id :rel_pessoa_busca_auxilio_id
   :schema db-schemas/rel-pessoa-busca-auxilio})

(def rel-pessoa-usa-auxilio
  {:name "rel_pessoa_usa_auxilio"
   :id :rel_pessoa_usa_auxilio_id
   :schema db-schemas/rel-pessoa-usa-auxilio})

