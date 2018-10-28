(cl:in-package :fistmage.game)


(fistmage:defgame (slimeit start-state)
  (:viewport-title "FistMage Example")
  (:viewport-width 1024)
  (:viewport-height 768))


(defun play ()
  (fistmage:start 'slimeit))
