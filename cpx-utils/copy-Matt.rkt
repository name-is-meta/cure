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


  ;; Typical function definition syntax
(define (button-callback obj evt)
  (printf "The Object: ~a~nThe Event:~a~n" obj evt))

;; Equivalent
(define button-callback2
  (lambda (obj evt)
    (printf "The Object: ~a~nThe Event:~a~n" obj evt)))

;; Fancy
(define button-callback3
  (λ (obj evt) ;; CMD-\
    'blah))



(define the-gui (build-gui))
(send the-gui show true)
               