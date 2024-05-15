;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |P2_SpinningBear(self-solution)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
;;===================
;;Constant

(define WIDTH 600)
(define HEIGHT 600)
(define MTS (empty-scene WIDTH HEIGHT))
(define BEAR-IMG (text "BEAR" 20 "olive"))
(define ROTATE 5)


;;DataDefinition
(define-struct bear (x y r))
;;Bear is in x,y coordinate with r angle

(define B1 (make-bear 30 30 0))
(define B2 (make-bear 100 100 270))

(define (fn-for-bear b)
  (... (bear-x b)   ;Number
       (bear-y b)   ;Number
       (bear-r b))) ;Number

;;Template rules used:
;;- compound : 3 fields



;;ListOfBear is one of:
;;-empty
;;-(cons Bear ListOfBear)
;;interp. a list of Bears

(define LOB1 empty)
(define LOB2 (cons (make-bear 10 10 0)
                   (cons (make-bear 50 50 45) empty)))
(define LOB3 (cons (make-bear 10 10 0)
                   (cons (make-bear 50 50 45)
                         (cons (make-bear 100 100 90) empty))))

(define (fn-for-lob lob)
  (cond [(empty? lob) empty]
        [else
         (... (first lob)
              (fn-for-lob (rest lob)))]))

;;Template rules used:
;;-one of 2 cases:
;;   - atomic distinct : empty
;;   - compound : (cons Bear ListOfBear)
;;-referecne : (first lob) is Bear
;;-self-reference : (rest lob) is ListOfBear

;;===================
;; Functions:

;; BEAR -> BEAR
;; start the world with (main empty)
;; produces BEAR on clicked location, rotating SPEEED amount of degree

(define (main lob)
  (big-bang lob            
            (on-tick   rotate-bears)     ; BEAR -> BEAR
            (to-draw   render-bears)     ; BEAR -> Image
            (on-mouse  click-bears)))    ; BEAR Integer Integer MouseEvent -> BEAR

;; ListOfBear -> ListOfBear
;; produce the next bear with rotated (ROTATE) amount
(check-expect (rotate-bears empty) empty)
(check-expect (rotate-bears (cons (make-bear 10 10 0) empty))
              (cons (make-bear 10 10 (+ 0 ROTATE)) empty))
(check-expect (rotate-bears (cons (make-bear 10 10 0) (cons (make-bear 100 100 45) empty)))
              (cons (make-bear 10 10 (+ 0 ROTATE)) (cons (make-bear 100 100 (+ 45 ROTATE)) empty)))
              
;(define (rotate-bears lob) empty) ;stub

;<template from definition>
(define (rotate-bears lob)
  (cond [(empty? lob) empty]
        [else
         (cons (rotate-bear-single (first lob))
               (rotate-bears (rest lob)))]))


;;[Helper Function 1]
;;Bear -> Bear
(check-expect (rotate-bear-single (make-bear 30 30 0))
  (make-bear 30 30 (+ 0 ROTATE)))

(define (rotate-bear-single b)
  (make-bear (bear-x b) (bear-y b) (+ (bear-r b) ROTATE)))

;; ListOfBear -> Image
;; produce proper bear image on MTS Screen with x, y coordinate and r angle

(check-expect (render-bears empty) MTS)
(check-expect (render-bears (cons (make-bear 10 10 0) (cons (make-bear 50 50 45) empty)))
              (place-image (rotate 0 BEAR-IMG) 10 10
                           (place-image (rotate 45 BEAR-IMG) 50 50 MTS)))

(define (render-bears lob)
  (cond [(empty? lob) MTS]
        [else
         (render-bear-single (first lob)
                             (render-bears (rest lob)))]))
  
;; Bear -> Image
;; produce single bear image on MTS Screen
(define (render-bear-single b MTS)   ;why MTS here ?! 
  (place-image (rotate (modulo (bear-r b) 360) BEAR-IMG) (bear-x b) (bear-y b) MTS))


;; ListOfBear KeyEvent -> ListOfBear
;;When mouse is clicked, the bear stnading right up will add to the list
(check-expect (click-bears empty 5 4 "button-down") (cons (make-bear 5 4 0) empty))
(check-expect (click-bears empty 5 4 "move") empty)


(define (click-bears lob x y me)
  (cond [(mouse=? me "button-down") (cons (make-bear x y 0) lob)]
        [else lob]))
