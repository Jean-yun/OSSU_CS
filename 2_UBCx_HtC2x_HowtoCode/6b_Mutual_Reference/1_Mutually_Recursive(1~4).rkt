;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 1_Mutually_Recursive) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
;#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname fs-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; fs-starter.rkt (type comments and examples)

;; Data definitions:

(define-struct elt (name data subs))
;; Element is (make-elt String Integer ListOfElement)
;; interp. An element in the file system, with name, and EITHER data or subs.
;;         If data is 0, then subs is considered to be list of sub elements.
;;         If data is not 0, then subs is ignored.

;; ListOfElement is one of:
;;  - empty
;;  - (cons Element ListOfElement)
;; interp. A list of file system Elements

(define F1 (make-elt "F1" 1 empty))
(define F2 (make-elt "F2" 2 empty))
(define F3 (make-elt "F3" 3 empty))
(define D4 (make-elt "D4" 0 (list F1 F2)))
(define D5 (make-elt "D5" 0 (list F3)))
(define D6 (make-elt "D6" 0 (list D4 D5)))


#;
(define (fn-for-element e)
   (... (elt-name e)               ;String
        (elt-data e)               ;Integer
        (fn-for-loe (elt-subs e)))) ;ListOfElement

#;
(define (fn-for-loe loe)
  (cond [(empty? loe) (...)]
        [else
         (...
          (fn-for-element (first loe)) ;Element
          (fn-for-loe (rest loe)))]))  ;ListOfElement

;;=================
;P1
;function consumes Elements and produces the Sum of all the file data in the tree

;Element -> Integer
;ListOfElement -> Integer???
;produce the sum of all the data in Element (and its subs)
(check-expect (sum-data--element F1) 1)
(check-expect (sum-data--loe empty) 0)
(check-expect (sum-data--element D5) 3)
(check-expect (sum-data--element D4) (+ 1 2))
(check-expect (sum-data--element D6) (+ 1 2 3))

;(define (sum-data--element e) 0) ;stub
;(define (sum-data--loe loe) 0)   ;stub


(define (sum-data--element e)
   (if (zero? (elt-data e))       ;if data itself is zero
       (sum-data--loe (elt-subs e))  ;go get the sum of its sub data
       (elt-data e)))                ;if not, get the data itself


(define (sum-data--loe loe)
  (cond [(empty? loe) 0]
        [else
         (+ (sum-data--element (first loe))
            (sum-data--loe (rest loe)))]))


;;=================
;P2
;function consumes Elements and produces a list of the names of all the elements in the tree
;Element -> ListOfString
;ListOfElement -> ListOfString ???
;produces list of the name of all the elements in the tree

(check-expect (name-data--element F1) (list "F1"))
(check-expect (name-data--loe empty) empty)
(check-expect (name-data--element D4) (list "D4" "F1" "F2"))
(check-expect (name-data--element D5) (list "D5" "F3"))
(check-expect (name-data--element D6) (cons "D6" (append (list "D4" "F1" "F2") (list "D5" "F3"))))

;(define (name-data--element e) empty) ;stub

(define (name-data--element e)
  (cons (elt-name e)
        (name-data--loe (elt-subs e))))
      

(define (name-data--loe loe)
  (cond [(empty? loe) empty]
        [else
         (append (name-data--element (first loe))
                 (name-data--loe (rest loe)))]))

             


;;=================
;P3
;function consumes String and Element, and looks for a data element with the given name
;If it finds that element, it returns data (Integer)
;If not found, return false
;;String Element -> Integer or False
;;String ListOfElement  -> Integer or False???
;;Search the given for an element with the given name, produce data if found; false otherwise
(check-expect (search--element "F1" D5) false)
(check-expect (search--element "F1" D4) 1)
(check-expect (search--element "F2" D4) 2)
(check-expect (search--element "G1" D6) false)
(check-expect (search--element "F3" D6) 3)
(check-expect (search--element "F6" D6) false)
(check-expect (search--element "D4" D4) 0)
(check-expect (search--loe "F1" empty) false)
(check-expect (search--loe "F1" (cons F1 (cons F2 empty))) 1)
(check-expect (search--loe "F3" (cons F1 (cons F2 empty))) false)

;(define (search-element str e) false) ;stub
;(define (search-loe str e) false) ;stub

(define (search--element str e)
  (if (string=? str (elt-name e)) ;String
      (elt-data e) ;Integer
      (search--loe str (elt-subs e))))
 
(define (search--loe str loe) 
  (cond [(empty? loe) false]
        [else
         (if (not (false? (search--element str (first loe)))) ;found in first loe?
             (search--element str (first loe))
             (search--loe str (rest loe)))]))


;;=================
;P4
;function consumes Element and produces a rendering of the tree


#;
(define (search-element e)
   (... (elt-name e)              
        (elt-data e)              
        (search-loe (elt-subs e)))) 
#;
(define (search-loe loe)
  (cond [(empty? loe) (...)]
        [else
         (...
          (search-element (first loe)) 
          (search-loe (rest loe)))]))



