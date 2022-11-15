(ns mc536-application.db.client)

(defprotocol SimpleDbClient
  (insert [db-client what where])
  (find [db-client query])
  (find [db-client query]))
