(defn heapify [nums root length]
  (let [left (* 2 root 1)
        right (* 2 root 2)
        largest (if (and (< left length) (> (nth nums left) (nth nums root)))
                  left
                  root)]
    (if (and (< right length) (> (nth nums right) (nth nums largest)))
      (recur (assoc nums largest (nth nums right))
             right
             length)
      (if (not= largest root)
        (recur (assoc nums largest (nth nums root))
               root
               length)
        nums))))

(defn heap-sort [nums]
  (let [n (count nums)
        build-heap (fn [nums]
                     (loop [i (quot n 2)]
                       (if (>= i 0)
                         (recur (dec i))
                         nums)))]
    (loop [nums (build-heap nums)
           end n]
      (when (> end 1)
        (recur (heapify (assoc nums 0 (nth nums (dec end))) 0 (dec end))
               (dec end))))
    nums))

(defn sort-array [nums]
  (heap-sort nums))