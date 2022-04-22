(asdf:load-system :nx-fruit)

(defmethod nyxt::startup ((browser browser) urls)
  "Make a blank buffer."
  (window-make browser)
  (let ((window (current-window)))
    (window-set-buffer window (make-buffer :url (quri:uri "about:blank")))
    (toggle-fullscreen window)))
