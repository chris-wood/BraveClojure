(println (seq '(1 2 3)))
(println (seq [1 2 3]))
(println (seq (set #{1 2 3})))
(println (seq {:name "Chris" :occupation "Bum"}))

# map works on lists of collections
(println (map str ["a" "b" "c"] ["A" "B" "C"]))
(println (list (str "a" "A") (str "b" "B") (str "c" "C")))

(def sum #(reduce + %))
(def avg #(/ (sum %) (count %)))
(defn stats
  [numbers]
  (map #(% numbers) [sum count avg]))

# #(% numbers) --> takes argument and returns (fn [arg] arg numbers),
# so it passes numbers to the argument

(println (stats [3 4 10]))

(println (reduce (fn [new-map [key val]]
          (assoc new-map key (inc val)))
        {}
        {:max 30 :min 10}))

(println (reduce (fn [new-map [key val]]
          (if (> val 4)
            (assoc new-map key val)
            new-map))
        {}
        {:human 4.1
         :critter 3.9}))

# TODO: implement map, filter, and some using reduce
# ; defn rmap

; recall anonymous function shorthand:
; #(OPERATOR %1 (-> first param) %2 (-> second param)
; e.g., #(* %1 %2) --> x1 * x1
; e.g., #(< %1 %2) --> x1 < x2

(def food-journal
  [{:month 1 :day 1 :human 5.3 :critter 2.3}
   {:month 1 :day 2 :human 5.1 :critter 2.0}
   {:month 2 :day 1 :human 4.9 :critter 2.1}
   {:month 2 :day 2 :human 5.0 :critter 2.5}
   {:month 3 :day 1 :human 4.2 :critter 3.3}
   {:month 3 :day 2 :human 4.0 :critter 3.8}
   {:month 4 :day 1 :human 3.7 :critter 3.9}
   {:month 4 :day 2 :human 3.7 :critter 3.6}])

(println (take-while #(< (:month %1) 3) food-journal))

; use filter to return all elements of a seq that test true for a given predicate

(sort [3 1 2])
(sort-by count ["aaa" "c" "bb"])

(concat [1 2] [3 4])

(println (concat (take 8 (repeat "na")) ["Batman!"]))
(println (take 3 (repeatedly (fn [] (rand-int 10)))))




