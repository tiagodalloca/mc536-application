(ns mc536-application.main
  (:require [mc536-application.system :as system])
  (:gen-class))

(defn -main
  [& _]
  ;; CTRL+C to stop gracefully
  (.addShutdownHook
   (Runtime/getRuntime)
   (Thread. (fn []
              (try (when (some? @system/state)
                     (println "\nStopping system gracefully")
                     (system/stop!))
                   (catch Exception _
                     (println "Failed to stop system gracefully."))))))
  (system/start! "system-config.edn"))

