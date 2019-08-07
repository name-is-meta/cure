#lang racket
(require racket/gui)

(define (get-cpx-path)
  (case (system-type 'os) 
  [(macosx)
   (build-path "/Volumes/MAKECODE/SPIFLASH/" "log.txt")
    ]))

; Make a frame by instantiating the frame% class
(define frame (new frame%
                   [label "File copier"]
                   [width 500]
                   [height 400]))

; Make a static text message in the frame
(define msg (new message% [parent frame]
                 [label "Click the button to copy files."]))

; Make a button in the frame
(new button% [parent frame]
     [label "Copy files"]
     [min-width 400]
     [min-height 300]
     [stretchable-width #t]
     [stretchable-height #t]
     ; Callback procedure for a button click:
     [callback (lambda (button event)
                 (copy-file source dest)
                 (send msg set-label "Files copied! Exiting...")
                 (sleep 3)
                 (exit))])

; Create the ingredients for copying.
(define source (get-cpx-path))
(define desk_dir (find-system-path 'desk-dir))
(define dest (build-path desk_dir "log.txt"))

; Show the frame by calling its show method
(send frame show #t)
