;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname P2_Boolean_list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; PROBLEM A:
;
; Design a data definition to represent a list of booleans. Call it ListOfBoolean.
;

;; Data definitions:
;;ListOfBoolean is one of:
;; - empty
;; - (cons Bool ListOfBoolean)
;;interp. a list of booleans

;<example>
(define BO1 empty)
(define BO2 (cons true empty))
(define BO3 (cons true (cons false empty)))

#; ;<template>
(define (fn-for-bool lob)
  (cond [(empty? lob) (...)]
        [else
         (... (fist lob)
              (fn-for-bool (rest lob)))])) ;recursion


;;Template rules used:
;;- one of : 2 cases
;;- atomic distinct : empty
;;- compound : (cons Bool ListofBoolean)
;;- self-reference: (rest lob) is ListOfBoolean


;; =================
; PROBLEM B:
;
; Design a function that consumes a list of boolean values and produces true
; if every value in the list is true. If the list is empty, your function
; should also produce true. Call it all-true?
;

;; Functions:
;;ListOfBoolean -> Boolean
;;produce true if all value in list is true or list is empty
(check-expect (all-true? empty) true)  ;when empty
(check-expect (all-true? (cons true empty)) true)  ;when all true
(check-expect (all-true? (cons true (cons false empty))) false)


;(define (all-true? lob) false) ;stub

;<template from above>
(define (all-true? lob)
  (cond [(empty? lob) true]
        [else
         (and (boolean=? (first lob) true)  (all-true? (rest lob)))]))

; it was 'AND' !!

