;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname P4_Area_Image) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; =================
;; Data definitions:

;
; PROBLEM A:
;
; Design a data definition to represent a list of images. Call it ListOfImage.
;
;;ListOfImage is one of:
;;- empty
;;- (cons Image ListOfImage)
;;interp. a list of images
;<example>
(define LOI1 empty)
(define LOI2 (cons (rectangle 10 20 "solid" "blue") empty))
(define LOI3 (cons (rectangle 10 20 "solid" "blue") (cons (square 30 "outline" "orange") empty)))


#;
;<template>
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]
        [else
         (... (first loi)
              (fn-for-loi (rest loi)))]))

;;Template rules used:
;;-one of : 2 cases
;;-atomic distinct: empty
;;-compound: (cons Image ListOfImage)
;;-self-reference: (rest loi) is ListOfImage


;; =================
;; Functions:

;
; PROBLEM B:
;
; Design a function that consumes a list of images and produces a number
; that is the sum of the areas of each image. For area, just use the image's
; width times its height.
;


;;ListOfImage -> Number
;;product sum of area of each image (area is width times height)
(check-expect (area-sum (cons (rectangle 10 20 "solid" "black") empty)) (+ (* 10 20) 0)) 
(check-expect (area-sum
                (cons (rectangle 10 20 "solid" "black") (cons (square 20 "solid" "blue") empty))) (+ (* 10 20) (* 20 20))) 

;(define (area-sum loi) 0) ;stub


;<template from above>
(define (area-sum loi)
  (cond [(empty? loi) 0]
        [else
         (+ (* (image-width (first loi)) (image-height (first loi)))
              (area-sum (rest loi)))]))

