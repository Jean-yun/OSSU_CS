;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname P1_movie) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; =========
; DATA DEFINITIONS

; PROBLEM A:
;
; Design a data definition to represent a movie, including
; title, budget, and year released.
;
; To help you to create some examples, find some interesting movie facts below:
; "Titanic" - budget: 200000000 released: 1997
; "Avatar" - budget: 237000000 released: 2009
; "The Avengers" - budget: 220000000 released: 2012
;

(define-struct movie (title budget year))
;; Movie is (make-movie str num num)
;; interp. (make-movie title budget year) is the movie's information


(define M1 (make-movie "Titanic" 200000000 1997))
(define M2 (make-movie "Avatar" 237000000 2009))
(define M3 (make-movie "500 days of Summer" 25000000 2010))
(define M4 (make-movie "Juno" 20000000 2007))

#;
(define (fn-for-movie m)
  (... (movie-title m)  ;string
       (movie-budget m) ;number
       (movie-year m))) ;number

;Template rules used:
; - compound : 3 fields

;; =========
;; FUNCTIONS

;
; PROBLEM B:
;
; You have a list of movies you want to watch, but you like to watch your
; rentals in chronological order. Design a function that consumes two movies
; and produces the title of the most recently released movie.
;
; Note that the rule for templating a function that consumes two compound data
; parameters is for the template to include all the selectors for both
; parameters.
;


;Make movie -> String
;produce movie's title which was released most recently
(check-expect (recent-movie M1 M2) (movie-title M2))
(check-expect (recent-movie M3 M4) (movie-title M3))


;(define (recent-movie m1 m2) m1);stub

#;
;<template>
(define (fn-for-recent-movie m1 m2)
  (... (movie-title m1)  ;string
       (movie-budget m1) ;number
       (movie-year m1)   ;number
       (movie-title m2)  ;string
       (movie-budget m2) ;number
       (movie-year m2))) ;number


(define (recent-movie m1 m2)
  (if (> (movie-year m1) (movie-year m2)) (movie-title m1) (movie-title m2)))



