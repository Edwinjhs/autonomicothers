(import [math [factorial :as fact]])

(defn iterate [lines]
  (setv values (.split (input)))
  (setv elem (int (first values)))
  (setv choose (int (second values)))
  (setv combi (int (/ (fact elem) (* (fact choose) (fact (- elem choose))))))
  (if (= lines 1)
    (str combi)
    (+ (str combi) " " (iterate (- lines 1)))))

(defn main []
  (setv entry (int (input)))
  (setv output (iterate entry))
  (print output))

(main)
