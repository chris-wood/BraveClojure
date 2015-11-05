(ns fwpd.core
  (:gen-class))

(def filename "suspects.csv")

(def vamp-keys [:name :glitter-index])
(defn str->int
    [str]
    (Integer. str))
(def conversions {:name identity :glitter-index str->int})
(defn convert
    [vamp-key value]
    ((get conversions vamp-key) value))

(defn parse
    "Convert a CSV into rows of columns"
    [string]
    (map #(clojure.string/split % #",")
        (clojure.string/split string #"\n")))

(defn mapify
    "Return a seq of maps like {:name \"Edward Cullen\" :glitter-index 10}"
    [rows]
    (map (fn [unmapped-row]
            (reduce (fn [row-map [vamp-key value]]
                (assoc row-map vamp-key (convert vamp-key value))) ;; this puts a k-v pair with vamp-key and the converted value into the reduction map {}
                {} ;; build from an empty map
                (map vector vamp-keys unmapped-row))) ;; this returns vectors of [vamp-key value] form
        rows))
;; recall that map FUNC seq1 seq2... invokes ((FUNC seq1[0] seq2[0]) (FUNC seq1[1] seq2[1]) ...)

(defn glitter-filter
    [minimum-glitter records]
    (filter #(>= (:glitter-index %) minimum-glitter) records))


(defn append
    [suspects name index]
    (conj suspects {:name name :glitter-index index}))

;; Write a function, validate, which will check that :name and :glitter-index are present
;; when you append. The validate function should accept two arguments: a map of keywords to
;; validating functions, similar to conversions, and the record to be validated.
;;    TODO!

;; Write a function that will take your list of maps and convert it back to a CSV string.
;; You’ll need to use the clojure.string/join function.
(defn tocsv
    ;; not done -- need to map each row to a CSV line properly
    [suspects]
    (clojure.string/join "\n" (map (fn [unmapped-row]
            (clojure.string/join "," unmapped-row))
        suspects)))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Hello, World!")
  (println (glitter-filter 3 (mapify (parse (slurp filename)))))

  (println (map :name (glitter-filter 3 (mapify (parse (slurp filename))))))

  (println (append (glitter-filter 3 (mapify (parse (slurp filename)))) "Johnny" 4))
  (println "")

  (println (tocsv (glitter-filter 3 (mapify (parse (slurp filename))))))
)
