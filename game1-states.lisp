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
(defparameter *width-paddle* 100)
(defparameter *height-paddle* 10)
(defparameter *height-indent* 5)
(defparameter *x-circle* (+ *x-canvas* (/ *width-canvas* 2)))
(defparameter *y-circle* (+ *y-canvas* (/ *cant* 2) *radius* *height-paddle* *height-indent*))
(defparameter *x-paddle* (- (+ *x-canvas* (/ *width-canvas* 2)) (/ *width-paddle* 2)))
(defparameter *y-paddle* (+ *y-canvas* (/ *cant* 2) *height-indent*))
(defparameter *dx-circle* 4)
(defparameter *dy-circle* 4)
(defparameter *dx-paddle* 50)
(defparameter *width-brick* 80)
(defparameter *height-brick* 30)
(defparameter *width-indent-brick* 13)
(defparameter *height-indent-brick* 12)
(defparameter status-mass (make-array '(20)))
(defparameter *win-game1* 0)


(defmethod initialize-instance :after ((this game1-state) &key)
  (bind-button :A :pressed
               (lambda ()
		 (if (> (- *x-paddle* *dx-paddle*) *x-canvas*)
                     (setf *x-paddle* (- *x-paddle* *dx-paddle*))
                     (setf *x-paddle* (+ *x-canvas* (/ *cant* 2))))
                 (if (and (> *x-circle* *x-paddle*) (< *x-circle* (+ *x-paddle* *width-paddle*)) (< (+ *y-circle* *dy-circle*) (+ *y-canvas* *cant* *height-indent* *height-paddle*)))
                     (and (setf *dy-circle* (* (+ (random 1.0) 0.5) *dy-circle*))
                          (setf *dx-circle* (- *dx-circle* (+ (random 1.0) 0.5)))))
                 ))

  (bind-button :D :pressed
               (lambda ()
		 (if (<= (+ *x-paddle* *dx-paddle* *width-paddle*) (+ *x-canvas* *width-canvas*))
                     (setf *x-paddle* (+ *x-paddle* *dx-paddle*))
                     (setf *x-paddle* (- (+ *x-canvas* *width-canvas* (/ *cant* 2)) *width-paddle*)))
                 (if (and (> *x-circle* *x-paddle*) (< *x-circle* (+ *x-paddle* *width-paddle*)) (< (+ *y-circle* *dy-circle*) (+ *y-canvas* *cant* *height-indent* *height-paddle*)))
                     (and (setf *dy-circle* (* (+ (random 1.0) 0.5) *dy-circle*))
                          (setf *dx-circle* (+ *dx-circle* (+ (random 1.0) 0.5)))))
                 ))


  (bind-button :space :pressed
               (lambda ()
                 (setf *x-circle* (+ *x-canvas* (/ *width-canvas* 2) (/ *cant* 2)))
	         (setf *y-circle* (+ *y-canvas* (/ *cant* 2) *radius* *height-paddle* *height-indent*))
                 (setf *dx-circle* 4)
                 (setf *dy-circle* 4)
                 (setf *x-paddle* (- (+ *x-canvas* (/ *width-canvas* 2) (/ *cant* 2)) (/ *width-paddle* 2)))
                 (setf *y-paddle* (+ *y-canvas* (/ *cant* 2) *height-indent*))
                 (loop for j from 0 upto 19
                       do (progn
                            (setf (aref status-mass j) 1)))
                 ))
  (loop for j from 0 upto 19
        do (progn
             (setf (aref status-mass j) 1)))
  (setf *fade-clarity* 0)
  (setf *win-game1* 0)
  )


(defun circle-move ()
  (if (or (> (+ *x-circle* *dx-circle*) (+ *x-canvas* *width-canvas*))
          (< (+ *x-circle* *dx-circle*) (+ *x-canvas* *cant*)))
      (setf *dx-circle* (* *dx-circle* -1)))
  
  (if (> (+ *y-circle* *dy-circle*) (+ *y-canvas* *height-canvas*))
      (setf *dy-circle* (* *dy-circle* -1)))

  (if (< (+ *y-circle* *dy-circle*) (+ *y-canvas* *cant* *height-indent* *height-paddle*))      
      (if (and (> *x-circle* *x-paddle*) (< *x-circle* (+ *x-paddle* *width-paddle*)))
          (and (setf *dy-circle* (* (+ (random 1.0) 0.5) *dy-circle* -1))
               (setf *dx-circle* (* (+ (random 1.0) 0.5) *dx-circle*)))     
      (and (setf *x-circle* (+ *x-canvas* (/ *width-canvas* 2) (/ *cant* 2)))
           (setf *y-circle* (+ *y-canvas* (/ *cant* 2) *radius* *height-paddle* *height-indent*))
           (setf *dx-circle* 0)
           (setf *dy-circle* 0)
           (setf *x-paddle* (- (+ *x-canvas* (/ *width-canvas* 2) (/ *cant* 2)) (/ *width-paddle* 2)))
           (setf *y-paddle* (+ *y-canvas* (/ *cant* 2) *height-indent*))
           (loop for j from 0 upto 19
                 do (progn
                      (setf (aref status-mass j) 1)))
           )))
  
  (setf *x-circle* (+ *x-circle* *dx-circle*))
  (setf *y-circle* (+ *y-circle* *dy-circle*)))


(defun brick-x (n)
  (+ *x-canvas* *cant* (* *width-indent-brick* (+ n 1)) (* *width-brick* n)))

(defun brick-y (h)
  (- (+ *y-canvas* *height-canvas*) (* (+ *height-brick* *height-indent-brick*) (+ h 1))))

(defun brick-in-world (n h)
  (draw-rect (vec2 (brick-x n) (brick-y h)) *width-brick* *height-brick* :fill-paint (vec4 0.7 0.1 0 (aref status-mass (+ (* h 5) n))) :rounding 5))


(defun draw-bricks ()
  (loop for h from 0 upto 3
        do (progn
             (if (and (> (+ *y-circle* *radius*) (brick-y h)) (< (- *y-circle* *radius*) (+ (brick-y h) *height-brick*)))
                 (loop for n from 0 upto 4
                       do (progn
                            (if (and (> *x-circle* (brick-x n)) (< *x-circle* (+ (brick-x n) *width-brick*)) (= (aref status-mass (+ (* h 5) n)) 1))
                                (and 
                                 (setf (aref status-mass (+ (* h 5) n)) 0)
                                 (setf *dy-circle* (* *dy-circle* -1))
                                 )
                                )
                                (brick-in-world n h)
                                )))
             
             (if (and (> *y-circle* (brick-y h)) (< *y-circle* (+ (brick-y h) *height-brick*)))
                 (loop for n from 0 upto 4
                       do (progn
                            (if (and (> (+ *x-circle* *radius*) (brick-x n)) (< (- *x-circle* *radius*) (+ (brick-x n) *width-brick*)) (= (aref status-mass (+ (* h 5) n)) 1))
                                (and 
                                 (setf (aref status-mass (+ (* h 5) n)) 0)
                                 (setf *dx-circle* (* *dx-circle* -1))
                                 )
                                )
                            (brick-in-world n h)
                            )))

             (if (and (> *y-circle* (+ (- (brick-y h)  (/ *radius* 1.4)) 0)) (< *y-circle* (+ (- (+ (brick-y h) (/ *radius* 1.4)) 0) *height-brick*)))                 
                 (loop for n from 0 upto 4
                       do (progn
                            (if (and (> *x-circle* (+ (- (brick-x n)  (/ *radius* 1.4)) 0)) (< *x-circle* (+ (- (+ (brick-x n) (/ *radius* 1.4)) 0) *width-brick*)) (= (aref status-mass (+ (* h 5) n)) 1))
                                (and 
                                 (setf (aref status-mass (+ (* h 5) n)) 0)
                                 (setf *dx-circle* (* *dx-circle* -1))
                                 (setf *dy-circle* (* *dy-circle* -1))
                                 )
                                )
                            (brick-in-world n h)
                            )))

             
                 (loop for n from 0 upto 4
                       do (progn
                            (brick-in-world n h)
                            )
		       ))))

(defun end-game1 ()
  (if (every #'zerop status-mass)
      (and (setf *t0* (real-time-seconds))
	  (setf *win-game1* 1))
	  ))


(defmethod fistmage:act ((this game1-state))
  (with-slots (started-at) this
    (if (= *win-game1* 1)
    (and (setf *fade-clarity* (/ (- (real-time-seconds) *t0* 5) 1))
    (when (> (- (real-time-seconds) *t0*) 1)
      (fistmage:transition-to 'cut2-state))))))


(defmethod fistmage:draw ((this game1-state))
  (with-slots (started-at) this
    (end-game1)
    (circle-move)
    (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4))
    (draw-image (vec2 70 70) :girl)
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
    (draw-bricks)
    (draw-circle (vec2 *x-circle* *y-circle*) *radius*
                 :fill-paint (vec4 0 0.8 0 0.9))
    (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 *fade-clarity*))
    ))
             

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



