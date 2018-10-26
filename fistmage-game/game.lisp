(cl:in-package :fistmage.game)


(fistmage:defgame (fistmage-game start-state)
  (:viewport-title "FistMage Example")
  (:viewport-width 1024)
  (:viewport-height 768))


(defun play ()
  (fistmage:start 'fistmage-game))
