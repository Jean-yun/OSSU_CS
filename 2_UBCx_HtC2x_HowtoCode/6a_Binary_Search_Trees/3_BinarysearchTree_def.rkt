;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 3_BinarysearchTree_def) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
(define KEY-VAL-SEPERATOR ":")
(define VSPACE (rectangle 1 10 "solid" "white"))
(define HSPACE (rectangle 10 1 "solid" "white"))
(define MTTREE (rectangle 20 10 "solid" "white"))



;;BST -> Image
;;produce simple rendering of the tree
(check-expect (render-bst false) MTTREE)
(check-expect (render-bst BST1) (above (text (string-append "1" KEY-VAL-SEPERATOR "abc")
                                             TEXT-SIZE
                                             TEXT-COLOR)
                                       VSPACE
                                       (beside (render-bst false)
                                               HSPACE
                                               (render-bst false))))

(check-expect (render-bst BST4) (above (text (string-append "4" KEY-VAL-SEPERATOR "dcj")
                                             TEXT-SIZE
                                             TEXT-COLOR)
                                       VSPACE
                                       (beside (render-bst false)
                                               HSPACE
                                               (render-bst (make-node 7 "ruf" false false)))))

(check-expect (render-bst BST3) (above (text (string-append "3" KEY-VAL-SEPERATOR "ilk")
                                             TEXT-SIZE
                                             TEXT-COLOR)
                                       VSPACE
                                       (beside (render-bst BST1)
                                               HSPACE
                                               (render-bst BST4))))

;(define (render-bst t) (square 0 "solid" "white")) ;stub


(define (render-bst t)
  (cond [(false? t) MTTREE]
        [else
         (above (text (string-append (number->string (node-key t)) KEY-VAL-SEPERATOR (node-val t))
                       TEXT-SIZE
                       TEXT-COLOR)
                VSPACE
                (beside (render-bst (node-l t))
                        HSPACE
                        (render-bst (node-r t))))]))             

