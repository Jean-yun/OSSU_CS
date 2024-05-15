;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1_Decrease-image(hard)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;
; In this problem imagine you have a bunch of pictures that you would like to
; store as data and present in different ways. We'll do a simple version of that
; here, and set the stage for a more elaborate version later.
;
; (A) Design a data definition to represent an arbitrary number of images.
;
; (B) Design a function called arrange-images that consumes an arbitrary number
; of images and lays them out left-to-right in increasing order of size.
;
; NOTE: by size means the total area of each image.
;

;;=======================
;;Constant
(define BLANK (square 0 "solid" "white"))

;;For Testing
(define I1 (rectangle 10 20 "solid" "blue"))
(define I2 (rectangle 20 30 "solid" "red"))
(define I3 (rectangle 30 40 "solid" "green"))
  
;;Data Definition

;;ListOfImage is one of:
;;-empty
;;-(cons Img ListOfImage)
;;-interp. an arbitrary number of images

(define IMG0 empty)
(define IMG1 (cons I1 empty))
(define IMG2 (cons I1 (cons I2 empty)))

#;
(define (fn-for-img loi)
  (cond [(empty? loi) (...)]
        [else
         (... (first loi)
              (fn-for-img (rest loi)))]))


;;Template rules used
;;-one of : 2 cases
;;  -atomic distinct : empty
;;  -compound: (cons Image ListOfImage)
;;-self-reference: (rest loi) is ListOfImage


;;=======================
;;Function
;;ListOfImage -> Image
;;lay out images left to right in increasing order of size
;; size = width * heigth
(check-expect (arrange-images (cons I1 (cons I2 empty)))
              (beside I1 I2 BLANK))
(check-expect (arrange-images (cons I2 (cons I1 empty)))
              (beside I1 I2 BLANK))

;<template>   sorting first -> laying out later (function composition)
(define (arrange-images loi)
  (layout-images (sort-images loi)))


;;---Helper 1 (layout-images)
;;ListOfImage -> Image
;;place images beside each other in order of list

(check-expect (layout-images empty) BLANK)
;(check-expect (layout-images (cons I3 (cons I1 empty))) (beside I1 I3 BLANK)) ;;this test fucek up, wasted time 
;(check-expect (layout-images (cons I2 (cons I3 empty))) (beside I2 I3 BLANK)) ;; it was not, It just didn't have the listing funciton here -_- ;; 

(check-expect (layout-images empty) BLANK)
(check-expect (layout-images (cons I1 (cons I2 empty))) (beside I1 I2 BLANK))
(check-expect (layout-images (cons I2 (cons I3 empty))) (beside I2 I3 BLANK))
(check-expect (layout-images (cons I1 (cons I3 empty))) (beside I1 I3 BLANK))
                             
;(define (layout-images loi) BLANK) ;stub
(define (layout-images loi)
  (cond [(empty? loi) BLANK]
        [else
         (beside (first loi)
                 (layout-images (rest loi)))]))



;;---Helper 2 (sort-images : operating on a list)

;;;;;;SORTING IS NOT WORKING !!!!!!
;;ListOfImage -> ListOfImage
;sort images in increasing order of size (area)
(check-expect (sort-images empty) empty)
(check-expect (sort-images (cons I1 (cons I2 empty)))
              (cons I1 (cons I2 empty)))

(check-expect (sort-images (cons I3 (cons I2 empty)))
              (cons I2 (cons I3 empty)))              

(check-expect (sort-images (cons I3 (cons I2 (cons I1 empty))))
              (cons I1 (cons I2 (cons I3 empty))))

;(define (sort-images loi) loi) ;stub

(define (sort-images loi)
  (cond [(empty? loi) empty]
        [else
         (insert (first loi)      ;arbitrary-sized data <- we have to use a function to do it
                 (sort-images (rest loi)))]))  ;natural recursion will be sorted


;;---Helper 3 (insert - put smaller in front, and bigger back)
;;Image ListOfImage -> ListOfImage
;;produce new loi, with img in proper place in loi (in increasing order of size)
;;Assume: loi is already sorted
(check-expect (insert I1 empty) (cons I1 empty))
(check-expect (insert I1 (cons I2 (cons I3 empty))) (cons I1 (cons I2 (cons I3 empty)))) ;first
(check-expect (insert I2 (cons I1 (cons I3 empty))) (cons I1 (cons I2 (cons I3 empty)))) ;middle
(check-expect (insert I3 (cons I1 (cons I2 empty))) (cons I1 (cons I2 (cons I3 empty)))) ;end

;(define (insert img loi) loi);stub

(define (insert img loi)
  (cond [(empty? loi) (cons img empty)]
        [else
         (if (larger? img (first loi))  ;compare the size of 2 images. True if (img > (first loi))
             (cons (first loi)
                   (insert img (rest loi)))
             (cons img loi))]))         ;if (img < first loi), then img comes first
 

;;---Helper 4 (larger - decide the bigger image)
;;Image Image -> Boolean
;;produce true if img1 is larger than img2
(check-expect (larger? (rectangle 3 4 "solid" "red") (rectangle 4 3 "solid" "red")) false) ;same
(check-expect (larger? (rectangle 5 4 "solid" "red") (rectangle 2 6 "solid" "red")) true)  ;first bigger
(check-expect (larger? (rectangle 3 5 "solid" "red") (rectangle 2 6 "solid" "red")) true)  ;first bigger
(check-expect (larger? (rectangle 3 4 "solid" "red") (rectangle 5 6 "solid" "red")) false) ;second bigger

;(define (larger? img1 img2) true) ;stub

;<template>
#;
(define (larger? img1 img2)
  (... img1 img2))

(define (larger? img1 img2)
  (> (* (image-width img1) (image-height img1))
     (* (image-width img2) (image-height img2))))