;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname quiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require 2htdp/universe)

;; A simple single line text editor.

;; =================
;; Constants:

(define WIDTH 400)
(define HEIGHT 36)
(define TEXT-SIZE 24)
(define TEXT-COLOR "black")
(define CURSOR-COLOR "red")
(define BG-COLOR "white")

(define MTS (empty-scene WIDTH HEIGHT BG-COLOR))
(define CURSOR (rectangle 2 TEXT-SIZE "solid" CURSOR-COLOR))


;; =================
;; Data definitions:

;; EditorState is String
;; interp. the text currently in the editor
(define ES1 "")
(define ES2 "hello")
(define ES3 "Hello World!")

#;
(define (fn-for-editor-state es)
  (... es))

;; Template rules used:
;; - atomic non-distinct: String


;; =================
;; Functions:

;; EditorState -> EditorState
;; start with (main "")
;; 
(define (main es)
  (big-bang es                          ; EditorState
            (to-draw   render-editor)   ; EditorState -> Image
            (on-key    handle-key)))    ; EditorState KeyEvent -> EditorState

;; EditorState -> Image
;; render the editor with text and a blinking cursor at the end
(check-expect (render-editor "") 
              (overlay/align "left" "middle"
                             (beside (text "" TEXT-SIZE TEXT-COLOR)
                                     CURSOR)
                             MTS))
(check-expect (render-editor "hi") 
              (overlay/align "left" "middle"
                             (beside (text "hi" TEXT-SIZE TEXT-COLOR)
                                     CURSOR)
                             MTS))

;(define (render-editor es) MTS) ;stub

;<use template from EditorState>

(define (render-editor es)
  (overlay/align "left" "middle"
                 (beside (text es TEXT-SIZE TEXT-COLOR)
                         CURSOR)
                 MTS))


;; EditorState KeyEvent -> EditorState
;; handle keyboard input: add character to end or delete with backspace
(check-expect (handle-key "" "a") "a")
(check-expect (handle-key "hel" "l") "hell")
(check-expect (handle-key "hello" "!") "hello!")
(check-expect (handle-key "hello" "\b") "hell")
(check-expect (handle-key "h" "\b") "")
(check-expect (handle-key "" "\b") "")
(check-expect (handle-key "hello" "shift") "hello")
(check-expect (handle-key "hi" "left") "hi")

;(define (handle-key es key) es) ;stub

;<use template from EditorState>

(define (handle-key es key)
  (cond [(key=? key "\b") 
         (if (> (string-length es) 0)
             (substring es 0 (- (string-length es) 1))
             es)]
        [(key=? key "\r") es]
        [(= (string-length key) 1)
         (string-append es key)]
        [else es]))