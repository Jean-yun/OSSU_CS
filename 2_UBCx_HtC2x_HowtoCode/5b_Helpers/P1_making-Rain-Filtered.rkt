;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname P1_making-Rain-Filtered) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)



; PROBLEM:
;
; Design a simple interactive animation of rain falling down a
; screen. Wherever we click, a rain drop should be created and as time
; goes by it should fall. Over time the drops will reach the bottom of
; the screen and "fall off". You should filter these excess drops out
; of the world state - otherwise your program is continuing to tick and
; and draw them long after they are invisible.
;
; In your design pay particular attention to the helper rules. In our
; solution we use these rules to split out helpers:
;   - function composition
;   - reference
;   - knowledge domain shift
;

;;=======================================
;; Make it rain where we want it to



;; =================
;; Constants:
(define WIDTH 500)
(define HEIGHT 500)
(define MTS (empty-scene WIDTH HEIGHT))
(define R-IMG (circle 10 "solid" "blue"))
(define SPEED -1)

;; =================
;; Data definitions:
(define-struct raindrop (x y))
;; Raindrop is (make-raindrop Number Number)
;; raindrop-x , raindrop-y is the coo rrdinates of the raindrop

(define R1 (make-raindrop 400 400))
(define R2 (make-raindrop 300 250))
(define R3 (make-raindrop 200 3))

(define (fn-for-rain r)
  (... (raindrop-x r)   ;Number
       (raindrop-y r))) ;Number

;;Template rules used:
;;-compound : 2 fields

;-------------------

;;ListOfRain is one of:
;;-empty
;;-(cons Raindrop ListOfRain)

(define LOI1 empty)
(define LOI2 (cons R1 (cons R2 (cons R3 empty))))

#;
(define (fn-for-lor lor)
  (cond [(empty? lor) empty]
        [else
         (... (first lor)
              (fn-for-lor (rest lor)))]))

;Template rules used:
;-one of: 2 cases
; -atomic distinct: empty
; -compound: (cons Raindrop ListOfRain)
;-reference : (first lor) is raindrop 
;-self-reference: (rest lor) is ListOfRain

;; =================
;; Functions:

;; Raindrop -> Image
;; start the world with (main empty)
;; 
(define (main lor)
  (big-bang lor                   
            (on-tick   fall-rain)     ; Raindrop -> Raindrop
            (to-draw   draw-rain)   ; Raindrop -> Image
           (on-mouse  click-rain)))      ; Raindrop Integer Integer MouseEvent -> Raindrop

;;-----------Main Function 1 (fall-rain)---------------
;; ListOfRain -> ListOfRain
;; produce the next raindrop with SPEED amound fallen
(check-expect (fall-rain empty) empty)
(check-expect (fall-rain (cons (make-raindrop 400 400) (cons (make-raindrop 300 250) empty)))
              (cons (make-raindrop 400 (- 400 SPEED)) (cons (make-raindrop 300 (- 250 SPEED)) empty)))

;(define (fall-rain lor) empty) ;stub

;<template from data def>
(define (fall-rain lor)
  (filter-drops (tick-drops lor)))

#;
(define (fall-rain lor)
  (cond [(empty? lor) empty]
        [else
         (cons (fall-rain-single (first lor))
               (fall-rain (rest lor)))]))


;;-----------Helper Function 1-1 (tick-drops) ---------------
;;ListOfDrop -> ListOfDrop
;;produce list of raindrops with decrased Height
(define (tick-drops lor)
  (cond [(empty? lor) empty]
        [else
         (cons (fall-rain-single (first lor))
               (tick-drops (rest lor)))]))


;;-----------Helper Function 1-2 (fall-rain-single) ---------------
;;Raindrop -> Raindrop
;;decrease Height of a single raindrop
(check-expect (fall-rain-single (make-raindrop 10 10))
  (make-raindrop 10 (- 10 SPEED)))

;(define (fall-rain-single r) 0) ;stub

;<template from data def>
(define (fall-rain-single r)
  (make-raindrop (raindrop-x r)
                 (- (raindrop-y r) SPEED)))

;;-----------Helper Function 1-3 (filter-drops)---------------
;; ListofRain -> ListOfRain
;; Product list of rain only inside the Height
(check-expect (off-canvas? (make-raindrop 50 50)) false)
(check-expect (off-canvas? (make-raindrop 100 (+ HEIGHT 1))) true)

;(define (off-canvas? r) false) ;stub

(define (filter-drops lor)
  (cond [(empty? lor) empty]
        [else
         (if (off-canvas? (first lor))   ;if height off canvas
             (filter-drops (rest lor))   ;remove the first one 
             (cons (first lor)           ;contains the first one
                   (filter-drops (rest lor))))]))

;;-----------Helper Function 1-4 (off-canvas?)---------------
;;Raindrop -> Boolean
;; Produce true if drop is off the canvas
(define (off-canvas? r)
  (> (raindrop-y r) HEIGHT))


;;-----------Main Function 2 (draw-rain)---------------
;; ListOfRain -> Image
;; render raindrop image of LOR on proper x, y coordinate of MTS
(check-expect (draw-rain empty) MTS)
(check-expect (draw-rain (cons R1 empty))
              (place-image R-IMG (raindrop-x R1) (raindrop-y R1) MTS))

(check-expect (draw-rain (cons R1 (cons R2 (cons R3 empty))))
              (place-image R-IMG (raindrop-x R1) (raindrop-y R1)
                                  (place-image R-IMG (raindrop-x R2) (raindrop-y R2)
                                              (place-image R-IMG (raindrop-x R3) (raindrop-y R3) MTS))))

;(define (draw-rain lor) MTS) ;stub

;<template from data def>
(define (draw-rain lor)
  (cond [(empty? lor) MTS]
        [else
         (draw-rain-single (first lor)
                           (draw-rain (rest lor)))]))

;;-----------Helper Function 2 (draw-rain-single)---------------
;; Raindrop -> Image
;;render raindrop image from single raindrop

;(check-expect (draw-rain-single 0 MTS) MTS)
(check-expect (draw-rain-single (make-raindrop 300 300) MTS)
              (place-image R-IMG 300 300 MTS))
(check-expect (draw-rain-single (make-raindrop 50 5) MTS)
              (place-image R-IMG 50 5 MTS))


;(define (draw-rain-single r) MTS);stub

;;<template from data def>
(define (draw-rain-single r MTS)
  (place-image R-IMG (raindrop-x r) (raindrop-y r) MTS))

;;-----------Main Function 3 (click-rain) --------------- ;;button, botton ..... !
;;Raindrop Integer Integer MouseEvent -> ListOfRain
;;when mouse is clicked (botton-down), the Raindrop will add to the list


;(check-expect (click-rain empty 400 400 "botton-down") (cons (make-raindrop 400 400) empty))
(check-expect (click-rain empty 100 100 "enter") empty)
(check-expect (click-rain empty 10 20 "button-down") (cons (make-raindrop 10 20) empty))
(check-expect (click-rain empty 10 20 "enter") empty)


;(define (click-rain lor x y mevt) empty) ; stub


(define (click-rain lor x y mevt)
  (cond [(mouse=? mevt "button-down") (cons (make-raindrop x y) lor)]
        [else lor]))

