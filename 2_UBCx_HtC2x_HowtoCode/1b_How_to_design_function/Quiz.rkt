;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Quiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; HtDD Design Quiz


; Problem 1:
; Consider the above data definition for the age of a person.
; Design a function called teenager? that determines whether a person
; of a particular age is a teenager (i.e., between the ages of 13 and 19).

; Number -> Boolean
; Determines whether the age is teenager (between ages of 13 and 19, inclusive)

(check-expect (teenager? 13) true)
(check-expect (teenager? 19) true)
(check-expect (teenager? 15) true)
(check-expect (teenager? 20) false)
(check-expect (teenager? 10) false)

;(define (teenager? num) false) ;stub
;(define (teengaer? num) ...num) ;template

(define (teenager? num) (and (>= num 13)
                             (<= num 19)))





; Problem 2:
; Design a data definition called MonthAge to represent a person's age
; in months.


;; Num -> Months
;; get person'sage and return in months form

(check-expect (MonthAge 13) (* 13 12))
(check-expect (MonthAge 10) (* 10 12))
(check-expect (MonthAge 5) (* 5 12))


;(define (MonthAge n) 0) ;stub
;(define (MonthAge n) ...n) ;template

(define (MonthAge n) (* n 12))



; Problem 3:
; 
; Consider a video game where you need to represent the health of your
; character. The only thing that matters about their health is:
; 
;   - if they are dead (which is shockingly poor health)
;   - if they are alive then they can have 0 or more extra lives
; 
; Design a data definition called Health to represent the health of your
; character.
; 
; Design a function called increase-health that allows you to increase the
; lives of a character.  The function should only increase the lives
; of the character if the character is not dead, otherwise the character
; remains dead.


;;Number -> String
;;receive HP gauge (0-100) and return  dead(if 0) or alive(0< x <=100)

(check-expect (Health 50) "alive")
(check-expect (Health 100) "alive")
(check-expect (Health 1) "alive")
(check-expect (Health 0) "dead")

(check-expect (increase-health 30) 31)
(check-expect (increase-health 99) 100)
(check-expect (increase-health 0) "dead")
(check-expect (increase-health 99) 100)


;(define (Health num) "dead") ;stub
;(define (Health num) ...num) ;template

(define (Health num) (if (and (< 0 num) (>= 100 num)) "alive" "dead"))
(define (increase-health num) (if (and (< 0 num) (> 100 num)) (+ 1 num) "dead"))


