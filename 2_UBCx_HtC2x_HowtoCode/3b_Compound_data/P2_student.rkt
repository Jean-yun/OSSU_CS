;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname P2_student) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; ================
;; DATA DEFINITIONS

;
; PROBLEM A:
;
; Design a data definition to help a teacher organize their next field trip.
; On the trip, lunch must be provided for all students. For each student, track
; their name, their grade (from 1 to 12), and whether or not they have allergies.
;

(define-struct student (name grade alg))
;Student is (make-student str number bool)
;interp. student's name, grade(1~12), and if they have allergies

;<example>
(define S1 (make-student "Alex" 3 false))
(define S2 (make-student "Adam" 5 true))
(define S3 (make-student "Jassica" 6 false))
(define S4 (make-student "Rick" 12 true))

;<function>
(define (fn-for-student s)
  (... (student-name s)  ;string
       (student-grade s) ;number
       (student-alg s))) ;bool

;Template rules used:
;- compound : 3 fields


;; =========
;; FUNCTIONS

;
; PROBLEM B:
;
; To plan for the field trip, if students are in grade 6 or below, the teacher
; is responsible for keeping track of their allergies. If a student has allergies,
; and is in a qualifying grade, their name should be added to a special list.
; Design a function to produce true if a student name should be added to this list.
;

;Student -> Bool
;interp. produce true if students are under or equal to grade 6, and have allergies (else, false)
(check-expect (isallergy? S1) false)
(check-expect (isallergy? S2) true)
(check-expect (isallergy? S3) false)


;(define (isallergy? st) false) ;stub

#;
;<template used from Student>
(define (fn-for-isallergy? s)
  (... (student-name s)  ;string
       (student-grade s) ;number
       (student-alg s))) ;bool

(define (isallergy? s)
  (and (<= (student-grade s) 6 ) (equal? (student-alg s) true)))

;;Test cases
;- grade >  6 and allergies = true   ;false
;- grade >  6 and allergies = false  ;false
;- grade <=  6 and allergies = true  ;true
;- grade <=  6 and allergies = false ;false
