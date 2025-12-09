;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname quiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)

;; Image Image -> Boolean
;; produce true if the first image is larger than the second
(check-expect (larger? (rectangle 10 10 "solid" "red")
                       (rectangle 5 5 "solid" "blue"))
              true)
(check-expect (larger? (rectangle 5 5 "solid" "red")
                       (rectangle 10 10 "solid" "blue"))
              false)
(check-expect (larger? (rectangle 10 10 "solid" "red")
                       (rectangle 10 10 "solid" "blue"))
              false)

;(define (larger? img1 img2) false) ;stub

;(define (larger? img1 img2) ;template
;  (... img1 img2))

(define (larger? img1 img2)
  (> (* (image-width img1) (image-height img1))
     (* (image-width img2) (image-height img2))))

