(asdf:defsystem :fistmage-game
  :description "FistMage Game"
  :license "MIT"
  :version "1.0.0"
  :author "Elena Voloshina"
  :depends-on (fistmage)
  :serial t
  :components ((:file "packages")
               (:file "utils")
               (:file "states")
			   (:file "game1-states")
               (:file "game")))
