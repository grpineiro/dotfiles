(in-package #:nyxt-user)
  
;;configuration window
(define-configuration window
  ((message-buffer-style
    (str:concat
     %slot-default%
     (cl-css:css
      '((body
         :background-color "#191622"
         :color "#E1E1E6")))))))

;;prompt buffer
(define-configuration prompt-buffer
  ((style (str:concat
           %slot-default%
           (cl-css:css
            '((body
               :background-color "#191622"
               :color "#E1E1E6")
              ("#prompt-area"
               :background-color "#191622")
              ("#input"
               :background-color "#483C67"
               :color "#E1E1E6")
              (".source-name"
               :background-color "black"
               :color "white")
              (".source-content"
               :background-color "black")
              (".source-content th"
               :border "1px solid white"
               :background-color "black")
              ("#selection"
               :background-color "#FF79C6"
               :color "black")
              (.marked :background-color "black"
                       :font-weight "bold"
                       :color "white")
              (.selected :background-color "black"
                         :color "white")))))))

;;internal buffer
(define-configuration internal-buffer
  ((style
    (str:concat
     %slot-default%
     (cl-css:css
      '((title
         :color "#E1E1E6")
        (body
         :background-color "191622"
         :color "#E1E1E6")
        (hr
         :color "E1E1E6")
        (a
         :color "FF79C6")
        (.button
         :color "black"
         :background-color "white")))))))

;;history tree
(define-configuration nyxt/history-tree-mode:history-tree-mode
  ((nyxt/history-tree-mode::style
    (str:concat
     %slot-default%
     (cl-css:css
      '((body
         :background-color "#191622"
         :color "E1E1E6")
        (hr
         :color "#483C67")
        (a
         :color "#FF79C6")
        ("ul li::before"
         :background-color "white")
        ("ul li::after"
         :background-color "white")
        ("ul li:only-child::before"
         :background-color "white")))))))

;;highlight boxes
(define-configuration nyxt/web-mode:web-mode
  ((nyxt/web-mode:highlighted-box-style
    (cl-css:css
     '((".nyxt-hint.nyxt-highlight-hint"
        :background "black")))
    :documentation "The style of highlighted boxes, e.g. link hints.")))

;;Styling status buffer black and setting size of tabs and modes. Can uncomment url and controls section for theming those.
(define-configuration status-buffer
  ((style (str:concat
           %slot-default%
           (cl-css:css
            '(
              ("#controls"
               :background-color "#434c5e"
               :border-top "1px solid #434c5e")
              ("#url"
               :background-color "#3b4252"
               :border-top "1px solid #3b4252"
               )
              ("#modes"
               :background-color "#434c5e"
               :border-top "1px solid #434c5e")
              (".button:hover" :color "#41414D")
              ("#tabs"
               :background-color "#3b4252"
               :color "#E1E1E6"
               :border-top "1px solid #3b4252")
              (".tab:hover" :color "#41414")))))))


