(ns mc536-application.http.handler
  (:require [mc536-application.db.tables :refer [entidade-empresa
                                                 entidade-governo
                                                 vaga-emprego
                                                 entidade-pessoa-fisica
                                                 auxilio
                                                 rel-pessoa-busca-auxilio
                                                 rel-pessoa-usa-auxilio]]
            [malli.core :as m]
            [malli.util :as mu]
            [honey.sql :as sql]
            [next.jdbc.sql :as s-jdbc]
            [reitit.dev.pretty :as pretty]
            [muuntaja.core :as muuntaja-core]
            reitit.coercion.malli
            [reitit.ring :as ring]
            [reitit.ring.coercion :as coercion]
            reitit.ring.malli
            [reitit.ring.middleware.exception :as exception]
            [reitit.ring.middleware.multipart :as multipart]
            [reitit.ring.middleware.muuntaja :as muuntaja]
            [reitit.ring.middleware.parameters :as parameters]))

(defn root-handler
  [_ _]
  {:body "Hello World!"})

(defn make-table-handlers
  [{:keys [name id schema]} {db-client :db/client}]
  (let [closed-optional-schema (-> (mu/dissoc schema id) mu/closed-schema mu/optional-keys)
        schema (mu/optional-keys schema)]
    [[(str "/" name)
      {:post {:response {200 {:body any?}}
              :parameters {:body closed-optional-schema}
              :handler (fn [{{body-params :body} :parameters}]
                         {:body (s-jdbc/insert! db-client name body-params {:return-keys true})})}
       :get {:response {200 {:body any?}}
             :parameters {:query schema}
             :handler (fn [{{query-params :query} :parameters}]
                        (if-not (empty? (doto query-params))
                          {:body (s-jdbc/query db-client
                                               (sql/format {:select :*
                                                            :from [(keyword name)]
                                                            :where (into [:and]
                                                                         (map (fn [[k v]]
                                                                                [:= k v])
                                                                              query-params))})
                                               {:return-keys true})}
                          {:body "Nothing to show."}))}}]
     [(str "/" name "/:id")
      {:patch {:response {200 {:body any?}}
               :parameters {:path [:map [:id int?]]
                            :body closed-optional-schema}
               :handler (fn [{{body-params :body
                              {id-val :id} :path} :parameters}]
                          {:body (s-jdbc/update! db-client name body-params {id id-val} {:return-keys true})})}
       :delete {:response {200 {:body any?}}
                :parameters {:path [:map [:id int?]]}
                :handler (fn [{{{id-val :id} :path} :parameters}]
                           {:body (s-jdbc/delete! db-client name {id id-val})})}}]]))

(defn inject-handler-deps
  [handler deps]
  (fn [request]
    (handler request deps)))

(defn get-routes
  [deps]
  [["/" {:get
         {:responses {200 {:body string?}}
          :handler (inject-handler-deps root-handler deps)}}]
   (into ["/tables"]
         (map (fn [table] (make-table-handlers table deps))
              [entidade-empresa
               entidade-governo
               vaga-emprego
               entidade-pessoa-fisica
               auxilio
               rel-pessoa-busca-auxilio
               rel-pessoa-usa-auxilio]))])

(def options
  {;;:reitit.middleware/transform dev/print-request-diffs ;; pretty diffs
   ;;:validate spec/validate ;; enable spec validation for route data
   ;;:reitit.spec/wrap spell/closed ;; strict top-level validation
   :exception pretty/exception
   :data {:coercion (reitit.coercion.malli/create
                     {;; set of keys to include in error messages
                      :error-keys #{#_:type :coercion :in :schema :value :errors :humanized #_:transformed}
                      ;; schema identity function (default: close all map schemas)
                      :compile mu/closed-schema
                      ;; strip-extra-keys (effects only predefined transformers)
                      :strip-extra-keys true
                      ;; add/set default values
                      :default-values true
                      ;; malli options
                      :options nil})
          :muuntaja muuntaja-core/instance
          :middleware [;; swagger feature
                       ;; swagger/swagger-feature
                       ;; query-params & form-params
                       parameters/parameters-middleware
                       ;; content-negotiation
                       muuntaja/format-negotiate-middleware
                       ;; encoding response body
                       muuntaja/format-response-middleware
                       ;; exception handling
                       exception/exception-middleware
                       ;; decoding request body
                       muuntaja/format-request-middleware
                       ;; coercing response bodys
                       coercion/coerce-response-middleware
                       ;; coercing request parameters
                       coercion/coerce-request-middleware
                       ;; multipart
                       multipart/multipart-middleware]}})

(defn get-handler
  [deps]
  (let [routes (get-routes deps)
        _ (def routes routes)]
    (ring/ring-handler 
     (ring/router routes options)
     (constantly {:status 404, :body "Not found."}))))

(comment
  (prn routes))
