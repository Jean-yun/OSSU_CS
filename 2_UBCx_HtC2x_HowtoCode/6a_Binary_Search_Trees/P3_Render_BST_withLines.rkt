;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname P3_Render_BST_withLines) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;I DID IT!!!!!

;Design a data definition to represent binary search trees.

(define-struct node (key val l r))
;;BST (Binary Search Tree) is one of:
;; - false (base case, if the node is empty)
;; - (make-node Integer String BST BST)          ;self-referecnes
;; interp. false means no BST, or empty BST
;          key is the node key
;          val is the node val
;          l and r are left and right subtrees
;;INVARIANT : for a given node:  (invariant is true over the whole tree)
;             key is > all keys in its left(l) child, key is < all keys in its right(r) child
;             the same key never appears twice in the tree

(define BST0 false)
(define BST1 (make-node 1 "abc" false false))
(define BST4 (make-node 4 "dcj" false (make-node 7 "ruf" false false)))
(define BST3 (make-node 3 "ilk" BST1 BST4))

(define BST14 (make-node 14 "old" false false))
(define BST27 (make-node 27 "wit" BST14 false))
(define BST50 (make-node 50 "dug" false false))
(define BST42 (make-node 42 "ily" BST27 BST50))

(define BST10 (make-node 10 "why" BST3 BST42))

#;
(define (fn-for-bst t)
  (cond [(false? t) (...)]
        [else
         (... (node-key t)  ;Integer
              (node-val t)   ;String
              (fn-for-bst (node-l t))     ;BST
              (fn-for-bst (node-r t)))])) ;BST
             

;;Template rules used:
;; -one of : 2 cases
;; -atomic distinct : false 
;; -compound: (make-node Integer String BST BST)
;; -self reference: (node-l t) has type BST
;; -self reference: (ndoe-r t) has type BST

  


;;=========================================
;;Complete the design of lookup-key function

;;BST Natural -> String or false
;;Try to find node with given key, if found- produce value; if not found- produce false.
(check-expect (lookup-key BST0 99) false)
(check-expect (lookup-key BST1 1) "abc")   ;succeed
(check-expect (lookup-key BST1 0) false)   ;L -fail
(check-expect (lookup-key BST1 99) false)  ;R -fail
(check-expect (lookup-key BST10 1) "abc")  ;L L -succeed
(check-expect (lookup-key BST10 4) "dcj")  ;L R -succeed
(check-expect (lookup-key BST10 27) "wit") ;R L -succeed
(check-expect (lookup-key BST10 50) "dug") ;R R -succeed
 
;(define (lookup-key t k) "") ;stub

;<template according to BST, and additional atomic parameter k>
(define (lookup-key t k)
  (cond [(false? t) false]
        [else
         (cond [(= k (node-key t)) (node-val t)]  ;when found 

               [(< k (node-key t)) (lookup-key (node-l t) k)]   ;we should go left
  
               [(> k (node-key t)) (lookup-key (node-r t) k)])]))   ;we should go right

               


; if there is no key in the BST, there should be an else statement.



;;=========================================
;;Design a function that consumes a bst and produces SIMPLE rendering of that BST.
(require 2htdp/image)

;;Constants
(define TEXT-SIZE 14)
(define TEXT-COLOR "black")
(define KEY-VAL-SEPARATOR ":")
(define VSPACE (rectangle 1 10 "solid" "white"))
(define HSPACE (rectangle 10 1 "solid" "white"))
(define MTTREE (rectangle 20 10 "solid" "white"))
(define BLINE (add-line (rectangle 10 10 "outline" "white")
                        10 0 0 10 "white"))


;;============Main Function===========
;;BST -> Image with Line

(check-expect (render-bst false) MTTREE)
(check-expect (render-bst BST1)
              (above (render-keyval (make-node 1 "abc" false false))
                     (render-lines
                      (image-width (render-bst false))  ;left
                      (image-width (render-bst false))
                      BST1) ;right
                     (beside/align "top" (render-bst false)
                                   (render-bst false))))

;(define (render-bst BST1) MTTREE) ;stub


(define (render-bst t)
  (cond [(false? t) MTTREE]
        [else
         (above (render-keyval t)  ;Integer, String
      
                (render-lines (image-width (render-bst (node-l t)))     ;lw
                              (image-width (render-bst (node-r t)))
                              t)    ;rw
                (beside/align "top" (render-bst (node-l t))
                              (render-bst (node-r t))))]))


;;======render-keyval

(check-expect (render-keyval false) MTTREE)
(check-expect (render-keyval BST1)
              (text (string-append "1"  KEY-VAL-SEPARATOR "abc")
                    TEXT-SIZE
                    TEXT-COLOR))


(define (render-keyval t)
  (cond [(false? t) MTTREE]
        [else
         (text (string-append (number->string (node-key t)) KEY-VAL-SEPARATOR (node-val t))
               TEXT-SIZE
               TEXT-COLOR)]))

;;======render-lines
;;Number Number -> Image
;;creates lines connecting subtrees of node

#;
(check-expect (render-lines 60 130 BST1)  ;lw rw
              (add-line (add-line (rectangle (+ 60 130) (/ (+ 60 130) 4) "outline" "white")
                                  (/ (+ 60 130) 2) 0         ;center node
                                  (/ 60 2) (/ (+ 60 130) 4)  ;left node (it's positive, not negative, so confusing 
                                  "black")
                        (/ (+ 60 130) 2) 0
                        (+ 60 (/ 130 2)) (/ (+ 60 130) 4)
                        "black"))
                       
                        
;(define (render-lines lw rw) (add-line MTTREE 0 0 0 0 "black"))) ;stub

(define (render-lines lw rw t)
  (cond [(and (false? (node-l t)) (false? (node-r t))) BLINE]
        [(and (false? (node-l t)) (not (false? (node-r t))))
         (add-line (rectangle (+ lw rw) (/ (+ lw rw) 4) "outline" "white")
                   (/ (+ lw rw) 2) 0
                   (+ lw (/ rw 2)) (/ (+ lw rw) 4)
                   "black")]
        [(and (not (false? (node-l t))) (false? (node-r t)))
         (add-line (rectangle (+ lw rw) (/ (+ lw rw) 4) "outline" "white")
                   (/ (+ lw rw) 2) 0
                   (/ lw 2) (/ (+ lw rw) 4)
                   "black")]
        [else
         (add-line
          (add-line (rectangle (+ lw rw) (/ (+ lw rw) 4) "outline" "white")
                    (/ (+ lw rw) 2) 0
                    (/ lw 2) (/ (+ lw rw) 4)
                    "black")
          (/ (+ lw rw) 2) 0
          (+ lw (/ rw 2)) (/ (+ lw rw) 4)
          "black")]))
         

      


#;
(define (render-lines lw rw t)
  (cond [(false? (node-l t)) BLINE]
        [(false? (node-r t)) BLINE]
        [else
         (add-line (add-line (rectangle (+ lw rw) (/ (+ lw rw) 4) "outline" "white")
                             (/ (+ lw rw) 2) 0
                             (/ lw 2) (/ (+ lw rw) 4)
                             "black")
                   (/ (+ lw rw) 2) 0
                   (+ lw (/ rw 2)) (/ (+ lw rw) 4)
                   "black")]))

             
