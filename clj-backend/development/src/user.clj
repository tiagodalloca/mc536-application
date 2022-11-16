(ns user
  (:require [next.jdbc :as jdbc]
            mc536-application.system.config
            [integrant.core :as ig]
            [integrant.repl :refer [clear go halt init prep reset reset-all]]))

(def db {:dbtype "mysql" :dbname "mc536" :user "root" :password "password"})

(def ds (jdbc/get-datasource db))

(comment (jdbc/execute! ds ["select * from entidade_empresa"]))

(def config
  {:http/server {:opts {:port 8989}
                 :handler (ig/ref :http/handler)}
   :http/handler {:db/client ds}})

(integrant.repl/set-prep! (constantly config))

(comment (prep)
         (init)
         (reset))
(require '[reitit.core :as r])

(comment
  (prn mc536-application.http.handler/routes)
  (-> #_mc536-application.http.handler/routes
      [
       ["/" ::hello]
       ["/tables"
        ["/entidade_empresa" ::asdf
         ["/:id" ::asdf]]]]
      r/router
      (r/match-by-path "/tables/entidade_empresa/id")))

(comment
  (-> #_mc536-application.http.handler/routes
      ["/api" ::api
       ["/admin" {:middleware [::admin]}
        ["" ::admin]
        ["/db" ::db]]
       ["/ping" ::ping]]
      r/router
      (r/match-by-path "/api/admin/db")))
