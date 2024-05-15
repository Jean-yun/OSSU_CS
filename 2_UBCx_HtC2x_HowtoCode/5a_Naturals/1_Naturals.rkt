;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1_Naturals) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Natural is one of:
;; - 0
;; - (add1 Natural)
;; interp. a natural number

(define N0 0)
(define N1 (add1 N0))
(define N2 (add1 N1))

#;
(define (fn-for-natural n)
  (cond [(zero? n) (...)]
        [else
         (...n ;
               ;
               ;
               (fn-for-natural (sub1 n)))]))

;;Template rules used:
;;-one-of: two cases
;;-atomic distinct: 0
;;-compound: (add1 Natural)
;;-self-reference: (sub1 n) is Natural


;;======================
;1)Function that consumes Natural Number n and produces the sum of all the naturals in [0, n]
;2)Function that consumes Natural Number n and produces a list of all the naturals of the form (cons n ( cons n-1 ... empty) not including 0.


;1)
;;Natural -> Natural
;;produces sum of all naturals in [0, n]
(check-expect (sum 0) 0)
(check-expect (sum 4) (+ 4 3 2 1))
(check-expect (sum 6) (+ 6 5 4 3 2 1))

;(define (sum n) 0) ;stub

;<template from data definition>
(define (sum n)
  (cond [(zero? n) 0]
        [else
         (+ n
              (sum (sub1 n)))]))


;2)
;;Natural -> ListOfNatural
;;produce (cons n (cons n-1 ... empty)), not including 0

(check-expect (to-list 0) empty)
(check-expect (to-list 1) (cons 1 empty))
(check-expect (to-list 5) (cons 5 (cons 4 (cons 3 (cons 2 (cons 1 empty))))))

;(define (to-list n) empty) ;stub

;<template>
(define (to-list n)
  (cond [(zero? n) empty]
        [else
         (cons n 
               (to-list (sub1 n)))]))


;3) Factorial
;;produce n!

(check-expect (fact 0) 1)
(check-expect (fact 3) (* 3 2 1))

;(define (fact n) 1) ;stub

;<template>
(define (fact n)
  (cond [(zero? n) 1]
        [else
         (* n
               (fact (sub1 n)))]))
