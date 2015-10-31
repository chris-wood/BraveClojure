(defn add-100 
    [x]
    (+ x 100))

(println (add-100 100))
(println "")

(defn dec-maker
    [n]
    (fn [x] (- x n)))

(def dec9 (dec-maker 9))
(println (dec9 10))

(defn mapset 
    [&l]
    (set (map l)))

