;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname boolean) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define WIDTH 200)
(define HEIGHT 100)

(> WIDTH HEIGHT)
(>= WIDTH HEIGHT)
(= 1 2)
(< 3 9)

(require 2htdp/image)

(define I1 (rectangle 10 20 "solid" "red"))
(define I2 (rectangle 20 10 "solid" "blue")) ; width x height

(< (image-width I1) (image-width I2))
(> (image-height I1) (image-height I2))

(if (< (image-width I1) (image-height I1)) "tail" "wide")
"--------------------"

(and (< (image-width I1) (image-width I2))
     (> (image-height I1) (image-height I2)))

(not 