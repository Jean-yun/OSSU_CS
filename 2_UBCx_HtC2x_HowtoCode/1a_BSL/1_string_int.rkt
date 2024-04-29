;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; expressions, integers
;(+ 3 4)
;(+ 3 ( * 2 3))
;(/ 12 (* 2 3))

(sqr 3)
(sqrt 16)
(+ 3 4)
(sqrt 2)
(/ (* 2 3) 2)
(/ 2 (* 2 3))
(+ 2 (* 3 4) (- (+ 1 2) 3))

;strings
"apple"
"Ada"
(string-append "Ada" " " "Lovelace")
(string-length "Apple")
(substring "Caribou" 2 4)
(substring "0123456" 1 5)
(string-append "oh" "Ana")

;image
(require 2htdp/image)
(circle 10 "solid" "red")
(rectangle 30 60 "outline" "blue")
(text "hello" 24 "orange")
(above (circle 10 "solid" "red")
       (circle 20 "solid" "yellow")
       (circle 30 "solid" "green"))

(overlay (circle 10 "solid" "red")
       (circle 20 "solid" "yellow")
       (circle 30 "solid" "green"))

(overlay (text "STOP" 48 "white")
         (regular-polygon 60 8 "solid" "red"))


(beside (square 20 "outline" "blue")
        (above (circle 15 "solid" "red")
       (triangle 20 "solid" "green")))


(above (text "snowman" 30 "black")
       (overlay (beside (circle 5 "solid" "black")
                         (circle 5 "solid" "black"))
       (circle 50 "outline" "blue"))
       (circle 70 "outline" "blue"))