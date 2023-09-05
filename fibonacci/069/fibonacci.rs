(ns frank1030.core
  (:gen-class)
  (:require [clojure.core :as core]))

(defn fib-div [a b iterator n]
  (let [r (mod (+ a b) n)]
    (if (= r 0)
      (print @iterator "")
      (do (swap! iterator inc)
        (fib-div b r iterator n)))))

(defn process [index]
  (let [x (atom index) n (core/read) iterator (atom 2)]
    (if (> @x 0)
      (do (swap! x dec)
        (fib-div 0 1 iterator n)
        (if (not= @x 0)
          (process @x)
          (print "")))
      (print ""))))

(defn main []
  (let [index (core/read)]
    (process index)))

(main)
