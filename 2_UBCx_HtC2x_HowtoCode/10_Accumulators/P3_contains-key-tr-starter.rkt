;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname P3_contains-key-tr-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; bt-contains-tr-starter.rkt


;;Problem:

;;Starting with the following data definition for a binary tree (not a binary search tree) 
;;design a tail-recursive function called contains? that consumes a key and a binary tree 
;;and produces true if the tree contains the key.



(define-struct node (k v l r))  ;key value left right
;; BT is one of:
;;  - false
;;  - (make-node Integer String BT BT)
;; Interp. A binary tree, each node has a key, value and 2 children
(define BT1 false)
(define BT2 (make-node 1 "a"
                       (make-node 6 "f"
                                  (make-node 4 "d" false false)
                                  false)
                       (make-node 7 "g" false false)))

;;Funciton
;;WE NEED TO VISIT EVERY TREES (INCLUDING SUBTREES) 
;;Integer BT -> Boolean
;;produce true it the Binary Tree contains Integer(key) 

(check-expect (contains? 1 BT1) false)
(check-expect (contains? 1 BT2) true)
(check-expect (contains? 3 BT2) false)
(check-expect (contains? 7 BT2) true)

;(define (contains? k bt) false) ;stub


#;
;;1. <Template>
(define (contains? k bt)
  (cond [(false? bt) false]
        [else
         (... (node-k bt)
              (node-l bt)
              (node-r bt))]))

#;
;;2.Non-tail-recursive
(define (contains? k bt)
  (cond [(false? bt) false]
        [else
         (or (= (node-k bt) k)             ;in root node
             (contains? k (node-l bt))     ;in left node
             (contains? k (node-r bt)))])) ;in right node

#;
;;3.Accumulator
(define (contains? k bt)
  ;; todo ; the list of so far unvisited right branches
  (local [(define (contains? bt todo)   ;binary tree & accumulator
            (cond [(false? bt) (...todo)]
                  [else
                   (or (= (node-k bt) k)             
                       (contains? (node-l bt)
                                  (cons (node-r bt) todo)))]))]
    (contains? bt empty)))

#;
;;4.New helper function
(define (contains? k bt)
  (local [(define (contains/one? bt todo)
          (cond [(false? bt) (contains/list? todo)]
                [else
                 (or (= (node-k bt) k)
                     (contains/one? (node-l bt)
                                    (cons (node-r bt) todo)))]))
          (define (contains/list? todo)
            (cond [(empty? todo) false]
                  [else
                   (contains/one? (first todo) (rest todo))]))]
    (contains/one? bt empty)))


#;
;;5. <template from BT + accumulator>
(define (contains? k bt)
  ;; todo: (listof BT); the list of so far univisited right branches
  (local [(define (contains/one? bt todo)
            (cond [(false? bt) (contains/list? todo)]
                  [else
                   (if (= (node-k bt) k)
                       true
                       (contains/one? (node-l bt)
                                      (cons (node-r bt) todo)))]))
          
          (define (contains/list? todo)
            (cond [(empty? todo) false]
                  [else
                   (contains/one? (first todo) (rest todo))]))]
    (contains/one? bt empty)))

#;
;; This alternative is also good. It puts both branches on the todo. Note the change
;; in contains/one? as well as the change in the accumulator invariant
; <template from BT + accumulator>

(define (contains? k bt)
  ;;todo (listof BT) : the list of so far unvisited subtrees 
  (local [(define (contains/one? bt todo)
            (cond [(false? bt) (contains/list? todo)]
                  [else
                   (if (= (node-k bt) k)
                       true
                       (contains/list? (cons (node-l bt) (cons (node-r bt) todo))))]))

          (define (contains/list? todo)
            (cond [(empty? todo) false]
                  [else
                   (contains/one? (first todo) (rest todo))]))]
    (contains/one? bt empty)))


;;================
;;Process #1 

#;
(define (contains? k bt)
  (local [(define (contains/one? bt todo)
            ())


          (define (contains/list? todo)
            )]
    (contains/one? bt empty)))


;;Success !!!!! 
(define (contains? k bt)
  (local [(define (contains/one? bt todo)
            (cond [(false? bt) (contains/list? todo)]
                  [else
                   (if (= (node-k bt) k)
                       true
                       (contains/list? (cons (node-l bt) (cons (node-r bt) todo))))]))
          
           (define (contains/list? todo)
            (cond [(empty? todo) false]
                  [else
                   (contains/one? (first todo) (rest todo))]))]
    (contains/one? bt empty)))





