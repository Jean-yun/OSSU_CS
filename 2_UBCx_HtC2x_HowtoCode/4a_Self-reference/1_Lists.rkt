;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1_Lists) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Lists

(require 2htdp/image)

empty

(define L1 (cons "Flames" empty)   )             ; list of 1 element
;(cons "Leafs" (cons "Flames" empty))) ; list of 2 elements
(define L2 (cons 10 (cons 9 (cons 10 empty)))) ; list of 3 elements
(define L3 (cons (square 10 "solid" "blue")
      (cons (triangle 20 "solid" "green")
            empty)))

(first L1)
(first L2)
(first L3)

(rest L1)
(rest L2)
(rest L3)

; to get the second element?
(first (rest L2))

; to get the third element?
(first (rest (rest L2)))

(empty? empty)