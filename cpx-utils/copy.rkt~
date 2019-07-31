#lang racket
(require htdp/gui)


(define desk_dir (find-system-path 'desk-dir))
(define source (build-path desk_dir "test_in"))
(define dest (build-path desk_dir "test_out"))

(define w
  (create-window
   (list (list (make-button "Copy file" (lambda (e) ((copy-file source dest)
                                                     (hide-window w)
                                                     )))))))

(show-window w)
