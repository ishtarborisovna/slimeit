(cl:in-package :fistmage.game)

(gamekit:register-resource-package
 :keyword
 "c:/portacle/projects/slimeit/art/")

(define-font :fonty "12454.ttf")
(define-font :fonty2 "11185.ttf")
(defparameter *fancy-font* nil)
(defparameter *bubble-font* nil)
(defparameter *t0* 0)
(define-image :girl "girl2_300.png")
(define-image :bubble "bubble2.png")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass start-state ()
  ((started-at :initform (real-time-seconds))))

(defmethod initialize-instance :after ((this start-state) &key)
  (setf *fancy-font* (make-font :fonty 180))
  (setf *bubble-font* (make-font :fonty2 40))
  (setf *t0* (real-time-seconds))
  )


(defmethod fistmage:act ((this start-state))
  (with-slots (started-at) this
    (when (> (- (real-time-seconds) started-at) 6)
      (fistmage:transition-to 'cut1-state))))


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
    (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4))
    (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 *fade-clarity*))
  ))
             

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut1-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut1-state) (button (eql :space)))
  (fistmage:transition-to 'game1-state))


(defun show-fade-off6 ()
  (if (> (- (real-time-seconds) *t0*) 6)
      (setf *fade-clarity* (- 1 (/ (- (real-time-seconds) *t0* 6) 1)))
      (setf *fade-clarity* 1)))

(defmethod fistmage:draw ((this cut1-state))
  (show-fade-off6)
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4))
  (draw-image (vec2 70 70) :girl)
  (draw-image (vec2 370 380) :bubble)
  (draw-text "Привет! Нажми пробел для продолжения." (vec2 420 550)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 *fade-clarity*))
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
