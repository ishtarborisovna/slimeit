(cl:in-package :fistmage.game)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass game2-state ()
  ((started-at :initform (real-time-seconds))))

  
(defparameter *stroka2* nil)
(defparameter status-mass2 (make-array '(25)))

(defmethod initialize-instance :after ((this game2-state) &key)
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
                 (if (= *win-game1* 0)
				 (and (setf *x-circle* (+ *x-canvas* (/ *width-canvas* 2) (/ *cant* 2)))
           (setf *y-circle* (+ *y-canvas* (/ *cant* 2) *radius* *height-paddle* *height-indent*))
                 (setf *dx-circle* 4)
                 (setf *dy-circle* 4)
                 (setf *x-paddle* (- (+ *x-canvas* (/ *width-canvas* 2) (/ *cant* 2)) (/ *width-paddle* 2)))
           (setf *y-paddle* (+ *y-canvas* (/ *cant* 2) *height-indent*))
                 (loop for j from 0 upto 24
                       do (progn
                            (setf (aref status-mass2 j) 1)))
							(setf *stroka2* "...")
				  ))
				  (if (= *win-game1* 1)
				  (and (setf *win-game1* 2)
				  (setf *t0* (real-time-seconds))))
                 ))
  (setf *radius* 15)
   (setf *x-circle* (+ *x-canvas* (/ *width-canvas* 2)))
(setf *y-circle* (+ *y-canvas* (/ *cant* 2) *radius* *height-paddle* *height-indent*))
(setf *dx-circle* 0)
(setf *dy-circle* 0)
  (loop for j from 0 upto 24
        do (progn
             (setf (aref status-mass2 j) 1)))
  (setf *fade-clarity* 0)
  (setf *win-game1* 0)
  (setf *stroka2* *key20*)
  (setf *pozitionx-girl* -70)
  (setf *pozitiony-girl* -70)
  )


(defun circle-move2()
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
           (loop for j from 0 upto 24
                 do (progn
                      (setf (aref status-mass2 j) 1)))
					  (setf *stroka2* *key21*)
           )))
  
  (setf *x-circle* (+ *x-circle* *dx-circle*))
  (setf *y-circle* (+ *y-circle* *dy-circle*)))

(defun brick2-x (n)
  (+ *x-canvas* *cant* (* *width-indent-brick* (+ n 1)) (* *width-brick* n)))

(defun brick2-y (h)
  (- (+ *y-canvas* *height-canvas*) (* (+ *height-brick* *height-indent-brick*) (+ h 1))))

(defun brick2-in-world (n h)
  (draw-rect (vec2 (brick2-x n) (brick2-y h)) *width-brick* *height-brick* :fill-paint (vec4 0.7 0.1 0 (aref status-mass2 (+ (* h 5) n))) :rounding 5))
 
  
(defun draw-bricks2 ()
  (loop for h from 0 upto 4
        do (progn
             (if (and (> (+ *y-circle* *radius*) (brick2-y h)) (< (- *y-circle* *radius*) (+ (brick2-y h) *height-brick*)))
                 (loop for n from 0 upto 4
                       do (progn
                            (if (and (> *x-circle* (brick2-x n)) (< *x-circle* (+ (brick2-x n) *width-brick*)) (= (aref status-mass2 (+ (* h 5) n)) 1))
                                (and 
                                 (setf (aref status-mass2 (+ (* h 5) n)) 0)
                                 (setf *dy-circle* (* *dy-circle* -1))
                                 )
                                )
                                (brick2-in-world n h)
                                )))
             
             (if (and (> *y-circle* (brick2-y h)) (< *y-circle* (+ (brick2-y h) *height-brick*)))
                 (loop for n from 0 upto 4
                       do (progn
                            (if (and (> (+ *x-circle* *radius*) (brick2-x n)) (< (- *x-circle* *radius*) (+ (brick2-x n) *width-brick*)) (= (aref status-mass2 (+ (* h 5) n)) 1))
                                (and 
                                 (setf (aref status-mass2 (+ (* h 5) n)) 0)
                                 (setf *dx-circle* (* *dx-circle* -1))
                                 )
                                )
                            (brick2-in-world n h)
                            )))

             (if (and (> *y-circle* (+ (- (brick2-y h)  (/ *radius* 1.4)) 0)) (< *y-circle* (+ (- (+ (brick2-y h) (/ *radius* 1.4)) 0) *height-brick*)))                 
                 (loop for n from 0 upto 4
                       do (progn
                            (if (and (> *x-circle* (+ (- (brick2-x n)  (/ *radius* 1.4)) 0)) (< *x-circle* (+ (- (+ (brick2-x n) (/ *radius* 1.4)) 0) *width-brick*)) (= (aref status-mass2 (+ (* h 5) n)) 1))
                                (and 
                                 (setf (aref status-mass2 (+ (* h 5) n)) 0)
                                 (setf *dx-circle* (* *dx-circle* -1))
                                 (setf *dy-circle* (* *dy-circle* -1))
                                 )
                                )
                            (brick2-in-world n h)
                            )))

             
                 (loop for n from 0 upto 4
                       do (progn
                            (brick2-in-world n h)
                            )
		       ))))

(defun end-game2 ()
  (if (every #'zerop status-mass2)
	  (and (setf *win-game1* 1)
	  (setf *stroka2* *key22*)
	  (setf *x-paddle* (- (+ *x-canvas* (/ *width-canvas* 2) (/ *cant* 2)) (/ *width-paddle* 2)))
      (setf *y-paddle* (+ *y-canvas* (/ *cant* 2) *height-indent*))
	  (setf *dx-circle* 0)
      (setf *dy-circle* 0)
	  (setf *pozitionx-girl* (- (+ *x-canvas* (/ *width-canvas* 2)) *radius* 3))
      (setf *pozitiony-girl* (- (+ *y-canvas* (/ *cant* 2) *radius* *height-paddle* *height-indent*) *radius* 4))
	  (setf *x-circle* -100)
      (setf *y-circle* -100)
	  )))


(defmethod fistmage:act ((this game2-state))
  (with-slots (started-at) this
    (if (= *win-game1* 2)
        (when (> (- (real-time-seconds) *t0*) 1)
          (fistmage:transition-to 'cut27-state)))))


(defmethod fistmage:draw ((this game2-state))
  (with-slots (started-at) this
    (end-game2)
    (circle-move)
    (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
    (draw-image (vec2 30 10) :girl-look)
	(draw-text *stroka2* (vec2 40 680)
               :fill-color (vec4 0.4 0.2 0.2 1)
               :font *bubble-font*
               )
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
    (draw-bricks2)
    (draw-circle (vec2 *x-circle* *y-circle*) *radius*
                 :fill-paint (vec4 0 0.8 0 0.9))
	(draw-image (vec2 *pozitionx-girl* *pozitiony-girl*) :girl-mini)
	(draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 *fade-clarity*))
    ))
             

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


