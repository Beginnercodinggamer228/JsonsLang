;(ns user)


(defn gen-code [length]

  (clojure.string/join

  (clojure.core/concat

  (clojure.core/string-to-array

  (clojure.core/filterv #(re-matches #"[a-zA-Z0-9]" %) (clojure.core/conj

  (clojure.core/mapv

  (fn [x] (rand-int 62)) ;base62

  (clojure.core/interval 0 length)))

  (clojure.core/string-to-array "abcdefghijklmnopqrstuvwxyz0123456789"))))


(defn write-file [name exp data]

  (with-open [file (clojure.java.io/writer (clojure.java.io/file name "." exp))]

  (clojure.json/writer file data)))


(defn ran-code []

  (gen-code (rand-int 10) 5))


(defn file-value [name exp data]

  (write-file name exp data))


(defn -main []

  (let [username (prnt "Введите имя - ")]

  (let [password (ran-code)

  data {:username username :password password :iflogin? true}]

  (file-value "File" "json" data))))

;-main