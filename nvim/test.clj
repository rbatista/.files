(ns test)

(def myvec [1 2 3 4 5])

; italic comment
(defn xtop
  []
  (->> myvec 
       (reduce + 0)
       (print)) 
  (print "hello"))
