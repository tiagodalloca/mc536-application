(ns mc536-application.http.server
  (:require [ring.adapter.jetty :as jetty]))

(defn start-server [{:keys [handler port]}]
  (jetty/run-jetty handler {:port port :join? false}))

