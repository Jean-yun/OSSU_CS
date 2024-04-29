;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Problem1_4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Problem1

(* 3 5 7)
(* (* 3 5) 7)


;Problem2
(require 2htdp/image)
; Use the DrRacket square, beside and above functions to create
; an image like this one:
;
;   "./imgs/tiles.jpg"
;
; If you prefer to be more creative feel free to do so. You can
; use other DrRacket image functions to make a more interesting
; or more attractive image.

(above (beside (square 20 "solid" "blue")
               (square 20 "solid" "yellow"))
       (beside (square 20 "solid" "yellow")
               (square 20 "solid" "blue")))


;Problem3
; Based on the two constants provided, write three expressions to
; determine whether:
;
; 1) IMAGE1 is taller than IMAGE2
; 2) IMAGE1 is narrower than IMAGE2
; 3) IMAGE1 has both the same width AND height as IMAGE2
;


(define IMAGE1 (rectangle 10 15 "solid" "red"))
(define IMAGE2 (rectangle 15 10 "solid" "red"))

(> (image-height IMAGE1) (image-height IMAGE2))
(< (image-width IMAGE1) (image-width IMAGE1))
(and (= (image-width IMAGE1) (image-width IMAGE1))
     (= (image-height IMAGE1) (image-height IMAGE2)))


;Problem4
; Given the following function definition:
;
; (define (foo n)
;   (* n n))
;
; Write out the step-by-step evaluation of the expression:
;
; (foo (+ 3 4))
;
; Be sure to show every intermediate evaluation step.

1) (foo (7))
2) (* 7 7)
3) 49
