(in-package :nyxt-user)

(asdf:load-system :nx-fruit)

(nyxt::load-lisp "~/.config/nyxt/base/glyphs.lisp")
(nyxt::load-lisp "~/.config/nyxt/base/commands.lisp")
(nyxt::load-lisp "~/.config/nyxt/themes/omni.lisp")

(echo "Loaded config.")

