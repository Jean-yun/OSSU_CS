;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname function) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define (bulb c)
  (circle 40 "solid" c))

(bulb "purple")
(above (bulb "red")
       (bulb "purple")
       (bulb "green"))

(bulb (string-append "re" "d")) ;red

(define (foo a b)
  (+ (* 3 a)
     b
    (* b a)))

(foo (+ 1 1) 4)
