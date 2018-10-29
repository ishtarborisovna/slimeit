(cl:in-package :fistmage.game)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass fail1-state ()
  ((started-at :initform (real-time-seconds))))

(defparameter *radius* 15)
(defparameter *width-canvas* 500)
(defparameter *height-canvas* 500)
(defparameter *cant* 20)
(defparameter *x-canvas* 450)
(defparameter *y-canvas* 50)
(defparameter *width-paddle* 100)
(defparameter *height-paddle* 10)
(defparameter *height-indent* 5)
(defparameter *x-circle* (+ *x-canvas* (/ *width-canvas* 2) (/ *cant* 2)))
(defparameter *y-circle* (+ *y-canvas* (/ *cant* 2) *radius* *height-paddle* *height-indent*))
(defparameter *x-paddle* (- (+ *x-canvas* (/ *width-canvas* 2) (/ *cant* 2)) (/ *width-paddle* 2)))
(defparameter *y-paddle* (+ *y-canvas* (/ *cant* 2) *height-indent*))
(defparameter *dx-circle* 0)
(defparameter *dy-circle* 0)
(defparameter *dx-paddle* 50)
(defparameter *width-brick* 80)
(defparameter *height-brick* 30)
(defparameter *width-indent-brick* 13)
(defparameter *height-indent-brick* 12)
(defparameter status-mass (make-array '(20)))
(defparameter *win-game1* 0)
(defparameter *pozition-big-girl* 30)
(defparameter *pozitionx-dead-girl* -70)
(defparameter *pozitiony-dead-girl* -70)
(defparameter *caunter* 0)
(defparameter *stroka-fail* "...")


(defmethod initialize-instance :after ((this fail1-state) &key)
  (bind-button :space :pressed
               (lambda ()
                 (if (= *caunter* 0)
                     (and (setf *stroka-fail* *key6*)
                          (setf *caunter* 1)))
                 (if (= *caunter* 1)
                     (and (setf *dx-circle* 1)
                          (setf *dy-circle* 1)
                          (setf *stroka-fail* "...")
                          (setf *pozition-big-girl* -250)
			  (setf *caunter* 2)))

                 ))
  
  (loop for j from 0 upto 19
        do (progn
             (setf (aref status-mass j) 1)))
  (setf *fade-clarity* 0)
  (setf *win-game1* 0)
  (setf *stroka-fail* *key5*)
  )


(defun circle-move-fail ()
  (if (or (> (+ *x-circle* *dx-circle*) (+ *x-canvas* *width-canvas*))
          (< (+ *x-circle* *dx-circle*) (+ *x-canvas* *cant*)))
      (and (setf *dx-circle* 0)
           (setf *dy-circle* 0)
           (setf *pozitionx-dead-girl* (- *x-circle* 12))
           (setf *pozitiony-dead-girl* *y-circle*)
           (setf *radius* -100)
           ))
  (setf *x-circle* (+ *x-circle* *dx-circle*))
  (setf *y-circle* (+ *y-circle* *dy-circle*))
  (if (>= *pozitiony-dead-girl* *y-canvas*)
      (setf *pozitiony-dead-girl* (- *pozitiony-dead-girl* 1))
      ) )


(defun brick-x (n)
  (+ *x-canvas* *cant* (* *width-indent-brick* (+ n 1)) (* *width-brick* n)))

(defun brick-y (h)
  (- (+ *y-canvas* *height-canvas*) (* (+ *height-brick* *height-indent-brick*) (+ h 1))))

(defun brick-in-world (n h)
  (draw-rect (vec2 (brick-x n) (brick-y h)) *width-brick* *height-brick* :fill-paint (vec4 0.7 0.1 0 (aref status-mass (+ (* h 5) n))) :rounding 5))


(defun draw-bricks-fail ()
  (loop for h from 0 upto 3
        do (progn        
                 (loop for n from 0 upto 4
                       do (progn
                            (brick-in-world n h)
                            )
		       ))))


(defmethod fistmage:act ((this fail1-state))
  (with-slots (started-at) this
    (if (= *pozitiony-dead-girl* *y-canvas*)
        (fistmage:transition-to 'cut9-state))))


(defmethod fistmage:draw ((this fail1-state))
  (with-slots (started-at) this
    (circle-move-fail)
    (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
    (draw-image (vec2 *pozition-big-girl* 10) :girl-look)
    (draw-rect (vec2 *x-canvas* *y-canvas*) (+ *width-canvas* *cant*) (+ *height-canvas* *cant*)
               :fill-paint (vec4 1 1 1 0.5)
               :thickness *cant*
               :rounding 15
               :stroke-paint (vec4 0.6 0.5 0.5 1)
               )
    (draw-rect (vec2 *x-paddle* *y-paddle*) *width-paddle* *height-paddle*
               :fill-paint (vec4 0.4 0.2 0.2 0.9)
               :rounding 5
               )
    (draw-bricks-fail)
    (draw-text *stroka-fail* (vec2 40 680)
               :fill-color (vec4 0.4 0.2 0.2 1)
               :font *bubble-font*
               )
    (draw-image (vec2 (- *x-circle*  *radius* 3) (- *y-circle*  *radius* 4)) :girl-mini)
    (draw-image (vec2 *pozitionx-dead-girl* *pozitiony-dead-girl*) :girl-mini-dead)
    (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 *fade-clarity*))
    ))
             

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



