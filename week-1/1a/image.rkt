;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)

(above
 (above (rectangle 50 30 "solid" "black")
        (rectangle 70 8 "solid" "black"))
 
 (overlay
  (above
   (beside (circle 3 "solid" "black")
           (rectangle 10 1 "outline" "white")
           (circle 3 "solid" "black"))
   (rectangle 1 5 "outline" "white")

   (triangle 15 "solid" "orange")
   (rectangle 1 5 "outline" "white")

   (beside (circle 2 "solid" "black")
           (rectangle 3 1 "outline" "white")
           (circle 2 "solid" "black")
           (rectangle 3 1 "outline" "white")
           (circle 2 "solid" "black")))
  (circle 30 "outline" "black"))

 (overlay
  (above (circle 4 "solid" "black")
         (rectangle 1 8 "outline" "white")
         (circle 4 "solid" "black")
         (rectangle 1 8 "outline" "white")
         (circle 4 "solid" "black"))
  (circle 45 "outline" "black"))
 
 (circle 60 "outline" "black"))