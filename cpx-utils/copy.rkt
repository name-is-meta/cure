#lang racket
(require racket/gui)

(define (build-gui)
  
  (define f (new frame%
                 [label "The Frame"]
                 [width 400]
                 [height 300]))

  (define p (new panel%
                 (parent f)))
  
  (define b (new button%
                 [label "Copy Things"]
                 [parent p]
                 [callback button-callback]
                 ))

  ;; Return the parent
  f)

(define desk_dir (find-system-path 'desk-dir))
(define source (build-path desk_dir "test_in"))
(define dest (build-path desk_dir "test_out"))

(define (button-callback obj evt)
  (copy-file source dest)
  (send b set-label "Copied!")
  (sleep 2)
  (exit)
  )

(define w
  (create-window
   (list (list (make-button "Copy file" (lambda (e) (button-callback)))))))

(show-window w)
