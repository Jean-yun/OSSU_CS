;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname P3_LargestNum) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; PROBLEM A:
;
; Design a data definition to represent a list of number. Call it ListOfNumber
;
;;ListOfNumber is one of:
;;-empty
;;- (cons Number ListOfNumber)
;;Interp. a list of numbers
(define LON1 empty)
(define LON2 (cons 5.1 empty))
(define LON3 (cons 5 (cons 19.5 empty)))

#;
;<template>
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

;;Template rules used:
;;-one of : 2 cases
;;-atomic distinct : empty
;;-compound : (cons Number ListOfNumber)
;;-self-reference : (rest lon) is ListOfNumber


;=====================
; PROBLEM B:
;
; Design a function that consumes a list of numbers and produces the
; largest number in the list. You may assume that all numbers in the
; list are greater than 0. If the list is empty, produce 0.
;

;;ListOfNumber -> Number
;;product largest number in the ListOfNumber (> 0) , and produce 0 if empty
(check-expect (largest empty) 0)
(check-expect (largest (cons 10 empty)) 10)
(check-expect (largest (cons 10 (cons 20 (cons 35 empty)))) 35)

;(define (largest lon) 0) ;stub

;<template from above>
(define (largest lon)
  (cond [(empty? lon) 0]
        [else
         (max (first lon)
              (largest (rest lon)))]))

; used the 'MAX' function
