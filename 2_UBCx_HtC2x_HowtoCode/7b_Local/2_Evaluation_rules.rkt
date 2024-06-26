;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 2_Evaluation_rules) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define b 1)
(define b_0 2)  ;;Lifting

(+ b   ;global
   (local [(define b 2)]
     (* b b))    ;local
   b)  ;global


(+ 1  
   (local [(define b 2)]
     (* b b))    ;local
   b)  ;global



;;Renaming
(+ 1  
  (* b_0 b_0)  ;Local is gone! 
   b)  ;global

;step by step
(+ 1  
  (* 2 b_0)  
   b)

(+ 1  
  (* 2 2)  
   b)

(+ 1
   4  
   1)

6