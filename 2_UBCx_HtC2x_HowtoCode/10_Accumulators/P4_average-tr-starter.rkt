;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname P4_average-tr-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; average-starter.rkt

;;PROBLEM:

;;Design a function called average that consumes (listof Number) and produces the
;;average of the numbers in the list.



;;(listof Number) -> Number
;;produces average of numbers in the list
;; ASSUME: lon contains at least 1 element

(check-expect (average (list 1 2 3)) 2)
(check-expect (average (list 10 20 30)) 20)
(check-expect (average (list 15 15 15)) 15)


;(define (average lon) 0) ;stub

;<template>
;;1.
#;
(define (average lon)
  (cond [(empty? lon) 0]
        [else
         (... (first lon)
              (average (rest lon)))]))


;;2.
#;
(define (average lon)
  (cond [(empty? lon) 0]
        [else
         (/ (sum lon) (length lon))]))


#;
;;helper function  - sum
(define (sum lon)
  (if (empty? lon)
      0
      (+ (first lon) (sum (rest lon)))))


;;3. 2 accumulator
#;
(define (average lon)
  (local [(define (average lon0)

            (cond [(empty? lon) 0]
                  [else
                   (/ (sum lon) (length lon))]))
          (define (sum lon)
            (if (empty? lon)
                0
                (+ (first lon) (sum (rest lon)))))]
    (average lon)))
          
#;
; <template from (listof Number) + 2 accumulators>
(define (average lon)
  ;; cnt: Number; how many numbers so far 
  ;; sum: Number; sum of numbers so far  
  ;;
  ;; (average (list 2 3 4)  0 0)
  ;; (average (list   3 4)  1 2)
  ;; (average (list     4)  2 5)
  ;; (average (list      )  3 9)
  (local [(define (average lon cnt sum)
            (cond [(empty? lon) (/ sum cnt)]
                  [else
                   (average (rest lon) (add1 cnt) (+ (first lon) sum))]))]
    (average lon 0 0)))

;;;;One more time with accumulator


(define (average lon)
  (local [(define (average lon cnt sum)
            (cond [(empty? lon) (/ sum cnt)]
                  [else
                   (average (rest lon) (add1 cnt) (+ sum (first lon)))]))]
    (average lon 0 0)))


