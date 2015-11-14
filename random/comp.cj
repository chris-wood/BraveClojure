;; a trivial function that composes two functions together -- f(g(x))
(defn two-comp
    [f g]
    (fn [& args]
        (f (apply g args))))

;; illustrate how memoize works
(defn sleepy-identity
    [x]
    (Thread/sleep 1000)
    x)

(def memo-sleepy-identity (memoize sleepy-identity))

(sleepy-identity "Chris")
(sleepy-identity "Chris")
(memo-sleepy-identity "Chris")
(memo-sleepy-identity "Chris")

