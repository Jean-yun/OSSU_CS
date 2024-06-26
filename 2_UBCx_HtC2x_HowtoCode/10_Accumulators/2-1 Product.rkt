;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |2-1 Product|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; (listof Number) -> Number
;; produce the product of all the numbers in lon
(check-expect (product empty) 1)
(check-expect (product (list 1 2 3)) 6)
(check-expect (product (list 2.5 1 -4)) -10)

#;
(define (product lon)
  (cond [(empty? lon) 1]
        [else
         (* (first lon)
            (product (rest lon)))]))



(define (product lon0)
  ;;acc: Number; the product of the elements of lon0 seen so far
  ;; (product (list 2 4 5))
  ;; (product (list 2 4 5)  1)
  ;; (product (list   4 5)  2) : 1*2 
  ;; (product (list     5)  8) ; 2*4
  ;; (product (list      ) 40) ; 2*4*5
  (local [(define (product lon acc)
          (cond [(empty? lon) acc]
                [else
                 (product (rest lon)
                          (* acc (first lon)))]))]
    (product lon0 1)))
                
