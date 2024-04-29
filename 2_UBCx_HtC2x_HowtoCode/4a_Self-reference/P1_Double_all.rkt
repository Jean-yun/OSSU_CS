;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname P1_Double_all) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; PROBLEM 1:
; Design a data definition for a list of Number.
;
;
;;Data Definition
;;ListofNumber is one of:
;;- empty
;;- (cons Number ListofNumber) ;self-reference
;;interp. a list of numbers
(define LON1 empty)
(define LON2 (cons 10 empty))
(define LON3 (cons 10 (cons 30 empty)))

;<template>
#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))])) ;recursion 


;Template rules used:
; -one of : 2 cases
; -atomic distinct : empty
; -compound : (cons Number ListOfNumber)
; -self-reference : (rest lon) is ListOfNumber


;==================
; PROBLEM 2:
;
; Design a function that consumes a list of numbers and doubles every
; number in the list. Call it double-all.

;;Functions
;ListOfNumber -> ListOfNumber
(check-expect (double-all empty) empty)
(check-expect (double-all (cons 10 empty)) (cons (* 2 10) empty))
(check-expect (double-all (cons 10 (cons 30 empty))) (cons (* 2 10) (cons (* 2 30) empty)))

;(define (double-all lon) 0) ;stub


;<template from above>
(define (double-all lon)
  (cond [(empty? lon) empty]
        [else
         (cons (* 2 (first lon)) (double-all (rest lon)))]   ))