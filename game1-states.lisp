(cl:in-package :fistmage.game)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass game1-state ()
  ((started-at :initform (real-time-seconds))))

(defparameter *radius* 15)
(defparameter *width-canvas* 500)
(defparameter *height-canvas* 500)
(defparameter *cant* 20)
(defparameter *x-canvas* 450)
(defparameter *y-canvas* 50)
(defparameter *width-paddle* 80)
(defparameter *height-paddle* 20)
(defparameter *height-indent* 10)
(defparameter *x-circle* (+ *x-canvas* (/ *width-canvas* 2) (/ *cant* 2)))
(defparameter *y-circle* (+ *y-canvas* (/ *cant* 2) *radius* *height-paddle* *height-indent*))
(defparameter *x-paddle* (- (+ *x-canvas* (/ *width-canvas* 2) (/ *cant* 2)) (/ *width-paddle* 2)))
(defparameter *y-paddle* (+ *y-canvas* (/ *cant* 2) *height-indent*))
(defparameter *dx-circle* 1)
(defparameter *dy-circle* 1)
(defparameter *dx-paddle* 1)

(defun circle-move ()
  (if (or (> (+ *x-circle* *dx-circle*) (+ *x-canvas* *width-canvas* (/ *cant* 2)))
          (< (+ *x-circle* *dx-circle*) (+ *x-canvas* (/ *cant* 2))))
      (setf *dx-circle* (* *dx-circle* -1)))
  
  (if (or (> (+ *y-circle* *dy-circle*) (+ *y-canvas* *height-canvas* (/ *cant* 2)))
          (< (+ *y-circle* *dy-circle*) (+ *y-canvas* (/ *cant* 2))))
      (setf *dy-circle* (* *dy-circle* -1)))
  
  (setf *x-circle* (+ *x-circle* *dx-circle*))
  (setf *y-circle* (+ *y-circle* *dy-circle*))
  )

(defmethod fistmage:draw ((this game1-state))
  (with-slots (started-at) this
    (circle-move)
    (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4))
    (draw-rect (vec2 *x-canvas* *y-canvas*) (+ *width-canvas* *cant*) (+ *height-canvas* *cant*)
               :fill-paint (vec4 1 1 1 1)
               :thickness *cant*
               :rounding 15
               :stroke-paint (vec4 0 0 0 0.5)
               )
    (draw-rect (vec2 *x-paddle* *y-paddle*) *width-paddle* *height-paddle*
               :fill-paint (vec4 0.4 0.2 0.2 0.9)
               :rounding 5
               )
    (draw-circle (vec2 *x-circle* *y-circle*) *radius*
                 :fill-paint (vec4 0 0.8 0 0.9))
    (draw-rect (vec2 (+ *x-canvas* (/ *cant* 2)) (+ *y-canvas* (/ *cant* 2))) 10 10 :fill-paint (vec4 0 0 0 1))
    ))
             

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


