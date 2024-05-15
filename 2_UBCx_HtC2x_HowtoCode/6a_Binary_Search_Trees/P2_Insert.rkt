;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname P2_Insert) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;PROBLEM:

;Design a function that consumes an Integer, String and BST, and adds a node
;that has the given key and value to the tree. The node should be inserted in 
;the proper place in the tree. The function can assume there is not already 
;an entry for that number in the tree. The function should produce the new BST.

;Do not worry about keeping the tree balanced. We will come back to this later.


;;=========================================
;;Data Definition

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
(check-expect (insert-node 2 "dkf" BST1)
              (make-node 1 "abc" false (make-node 2 "dkf" false false)))

(check-expect (insert-node 2 "qwe" BST3)
              (make-node 3 "ilk" (make-node 1 "abc" false (make-node 2 "qwe" false false)) BST4))

(check-expect (insert-node 70 "svv" BST50)
              (make-node 50 "dug" false (make-node 70 "svv" false false)))




            

;(define (insert-node k v t) (make-node k v false false)) ;stub



;;PROBLEM:

;Design a function that consumes an Integer, String and BST, and adds a node
;that has the given key and value to the tree. The node should be inserted in 
;the proper place in the tree. The function can assume there is not already 
;an entry for that number in the tree. The function should produce the new BST.

;Do not worry about keeping the tree balanced. We will come back to this later.


(define (insert-node k v t)
  (cond [(false? t) (make-node k v false false)]
        [else
         (if (< k (node-key t))

             (make-node
              (node-key t)
              (node-val t)
              (insert-node k v (node-l t))
              (node-r t))

             (make-node
              (node-key t)
              (node-val t)
              (node-l t)
              (insert-node k v (node-r t))))]))

              
               










