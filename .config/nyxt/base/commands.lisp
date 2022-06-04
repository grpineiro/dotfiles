(in-package #:nyxt-user)

(define-command-global open-external-browser ()
  "Open the current url in external browser"
  (uiop:run-program (list "firefox" (render-url (url (current-buffer))))))

