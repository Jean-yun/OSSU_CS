;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname P1_Decreasing-image) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;
; Design a function called decreasing-image that consumes a Natural n
; and produces an image of all the numbers from n to 0 side by side.
;
; So (decreasing-image 3) should produce 3 2 1 0 as an image (with an space
; between the numbers).
;


;1) Constant
(define TEXT-COLOR "blue")
(define TEXT-SIZE 15)
(define SPACE (text " " TEXT-SIZE TEXT-COLOR))

;2) Function
(check-expect (decreasing-image 0)
              (text "0" TEXT-SIZE TEXT-COLOR))

(check-expect (decreasing-image 1)
              (beside (text "1" TEXT-SIZE TEXT-COLOR)
                      SPACE
                      (text "0"TEXT-SIZE TEXT-COLOR)))

(check-expect (decreasing-image 3)
              (beside (text "3" TEXT-SIZE TEXT-COLOR)
                      SPACE
                      (text "2"TEXT-SIZE TEXT-COLOR)
                      SPACE
                      (text "1"TEXT-SIZE TEXT-COLOR)
                      SPACE
                      (text "0" TEXT-SIZE TEXT-COLOR)))


(define (decreasing-image n)
  (cond [(zero? n) (text "0" TEXT-SIZE TEXT-COLOR)]
        [else
         (beside (text (number->string n) TEXT-SIZE TEXT-COLOR)
                 SPACE
                 (decreasing-image (sub1 n)))]))
 