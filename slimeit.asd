(asdf:defsystem :slimeit
  :description "Slime It"
  :license "MIT"
  :version "1.0.0"
  :author "Elena Voloshina"
  :depends-on (fistmage)
  :serial t
  :components ((:file "packages")
               (:file "utils")
               (:file "states")
			   (:file "game1-states")
			   (:file "localization")
			   (:file "intrigue")
			   (:file "game-fail")
			   (:file "depressia")
               (:file "game")))
