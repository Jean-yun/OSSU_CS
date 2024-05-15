;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 1_ListAbbreviations) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(cons "a" (cons "b" (cons "c" empty)))
; =
(list "a" "b" "c")

(list (+ 1 2) (+ 3 4) (+ 6 9))

(define L1 (list "b" "c"))
(define L2 (list "d" "e" "f"))

(list "a" L1) ;seperate list 
(cons "a" L1) ;single lisst

(list L1 L2)  ;seperate lists
(append L1 L2) ;single list

