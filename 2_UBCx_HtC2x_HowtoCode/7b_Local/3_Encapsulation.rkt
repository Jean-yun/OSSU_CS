;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3_Encapsulation) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


;;=================
;P1
;function consumes Elements and produces the Sum of all the file data in the tree

;; Data definitions:
(define-struct elt (name data subs))
;; Element is (make-elt String Integer ListOfElement)
;; interp. An element in the file system, with name, and EITHER data or subs.
;;         If data is 0, then subs is considered to be list of sub elements.
;;         If data is not 0, then subs is ignored.
(define F1 (make-elt "F1" 1 empty))
(define F2 (make-elt "F2" 2 empty))
(define F3 (make-elt "F3" 3 empty))
(define D4 (make-elt "D4" 0 (list F1 F2)))
(define D5 (make-elt "D5" 0 (list F3)))
(define D6 (make-elt "D6" 0 (list D4 D5)))


;Element -> Integer
;produce the sum of all the data in Element (and its subs)
(check-expect (sum-data F1) 1)
(check-expect (sum-data D5) 3)
(check-expect (sum-data D4) (+ 1 2))
(check-expect (sum-data D6) (+ 1 2 3))


;Encapsulate
(define (sum-data e)
  (local [(define (sum-data--element e)
            (if (zero? (elt-data e))      
                (sum-data--loe (elt-subs e))  
                (elt-data e)))               
          (define (sum-data--loe loe)
            (cond [(empty? loe) 0]
                  [else
                   (+ (sum-data--element (first loe))
                      (sum-data--loe (rest loe)))]))]
    (sum-data--element e)))




;;=================
;P2
;function consumes Elements and produces a list of the names of all the elements in the tree
;Element -> ListOfString
;produces list of the name of all the elements in the tree

(check-expect (all-names F1) (list "F1"))
(check-expect (all-names D4) (list "D4" "F1" "F2"))
(check-expect (all-names D5) (list "D5" "F3"))
(check-expect (all-names D6) (cons "D6" (append (list "D4" "F1" "F2") (list "D5" "F3"))))

;(define (all-names e) empty) ;stub

(define (all-names e)
  (local [(define (all-names--element e)
            (cons (elt-name e)
                  (all-names--loe (elt-subs e))))
      

          (define (all-names--loe loe)
            (cond [(empty? loe) empty]
                  [else
                   (append (all-names--element (first loe))
                           (all-names--loe (rest loe)))]))]
    (all-names--element e)))




;;=================
;P3
;function consumes String and Element, and looks for a data element with the given name
;If it finds that element, it returns data (Integer)

;If not found, return false
;;String Element -> Integer or False
;;find the given for an element with the given name, produce data if found; false otherwise
(check-expect (find "F1" D5) false)
(check-expect (find "F1" D4) 1)
(check-expect (find "F2" D4) 2)
(check-expect (find "G1" D6) false)
(check-expect (find "F3" D6) 3)
(check-expect (find "F6" D6) false)
(check-expect (find "D4" D4) 0)

;(define (find str e) false) ;stub


(define (find str e)
  (local [(define (find--element str e)
            (if (string=? str (elt-name e)) ;String
                (elt-data e) ;Integer
                (find--loe str (elt-subs e))))
 
          (define (find--loe str loe) 
            (cond [(empty? loe) false]
                  [else
                   (if (not (false? (find--element str (first loe)))) ;found in first loe?
                       (find--element str (first loe))
                       (find--loe str (rest loe)))]))]
    (find--element str e)))
 







