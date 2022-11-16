(ns mc536-application.system.config
  (:require
   [integrant.core :as ig]
   [mc536-application.http.handler :as http-handler]
   [mc536-application.http.server :as http-server]
   [next.jdbc :as jdbc]))

(defmethod ig/init-key :http/server [_ {:keys [handler]
                                        {:keys [port]} :opts}]
  (http-server/start-server {:handler handler :port port}))

(defmethod ig/halt-key! :http/server [_ server]
  (when server (.stop server)))

(defmethod ig/init-key :http/handler [_ deps]
  (http-handler/get-handler deps))

(defmethod ig/init-key :db/client [_ {:keys [database user password host]}]
  (jdbc/get-datasource
   (doto {:dbtype "mysql"
          :dbname database
          :user user
          :password password
          :host host}
     prn)))

