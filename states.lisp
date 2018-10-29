(cl:in-package :fistmage.game)

(gamekit:register-resource-package
 :keyword
 "c:/portacle/projects/slimeit/art/")

(define-font :fonty "12454.ttf")
(define-font :fonty2 "12420.ttf")
(define-font :fonty3 "11618.ttf")
(defparameter *fancy-font* nil)
(defparameter *bubble-font* nil)
(defparameter *language-font* nil)
(defparameter *evil-font* nil)
(defparameter *t0* 0)
(define-image :girl "slima2.png")
(define-image :girl-look "slima-look.png")
(define-image :girl-angry "slima-angry.png")
(define-image :girl-mini "girl2_mini.png")
(define-image :girl-mini-dead "girl2_mini_dead.png")
(define-image :cat "cat.png")
(define-image :vasa "vasa.png")
(defparameter *language* 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass start-state ()
  ((started-at :initform (real-time-seconds))))

(defmethod initialize-instance :after ((this start-state) &key)
  (setf *fancy-font* (make-font :fonty 180))
  (setf *bubble-font* (make-font :fonty2 28))
  (setf *language-font* (make-font :fonty 60))
  (setf *evil-font* (make-font :fonty3 66))
  (setf *t0* (real-time-seconds))
  )


(defmethod fistmage:act ((this start-state))
  (with-slots (started-at) this
    (when (> (- (real-time-seconds) started-at) 6)
      (fistmage:transition-to 'language-state))))


(defparameter *fade-clarity* 0)

(defun show-fade5 ()
  (if (> (- (real-time-seconds) *t0*) 5)
    (setf *fade-clarity* (/ (- (real-time-seconds) *t0* 5) 1))
    (setf *fade-clarity* 0)))


(defmethod fistmage:draw ((this start-state))
  (with-slots (started-at) this
    (show-fade5)
    (draw-text "SLIME IT" (vec2 280 330)
             :fill-color (vec4 0.5 0 0.5 (/ (- (real-time-seconds) started-at) 4))
             :font *fancy-font*
             )
    (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
    (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 *fade-clarity*))
  ))
             

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


