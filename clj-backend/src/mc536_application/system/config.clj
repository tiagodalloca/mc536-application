(ns mc536-application.system.config
  (:require [mc536-application.http.server :as http-server]
            [mc536-application.http.handler :as http-handler]
            [integrant.core :as ig]))

(defmethod ig/init-key :http/server [_ {:keys [handler]
                                        {:keys [port]} :opts}]
  (http-server/start-server {:handler handler :port port}))

(defmethod ig/halt-key! :http/server [_ server]
  (when server (.stop server)))

#_{:clj-kondo/ignore [:unused-binding]}
(defmethod ig/init-key :http/handler [_ deps]
  (http-handler/get-handler deps))

