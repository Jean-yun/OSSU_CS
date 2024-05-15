;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2_arrange-strings) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;The questions in the next view videos will walk you through the design of a function called arrange-strings,
;which consumes an arbitrary number of strings and lays them out vertically in alphabetical order.

;First design a data definition for an arbitrary number of strings before moving on.


;ListOfStrings is one of
;-empty
;-(cons String ListOfStrings)
;interp. a list of strings 

(define LOS1 empty)
(define LOS2 (cons "a" emtpy))
(define LOS3 (cons "a" (cons "b" (cons "c" empty))))

(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
         (... (first los)
              (fn-for-los (rest los)))]))

