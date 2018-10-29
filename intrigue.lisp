(cl:in-package :fistmage.game)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut2-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut2-state) (button (eql :space)))
  (fistmage:transition-to 'cut3-state))


(defun show-fade-off6 ()
  (if (> (- (real-time-seconds) *t0*) 6)
      (setf *fade-clarity* (- 1 (/ (- (real-time-seconds) *t0* 6) 1)))
      (setf *fade-clarity* 1)))

(defmethod fistmage:draw ((this cut2-state))
  (show-fade-off6)
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-image (vec2 30 10) :girl)
  (draw-text *key1* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 *fade-clarity*))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut3-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut3-state) (button (eql :space)))
  (fistmage:transition-to 'cut4-state))


(defmethod fistmage:draw ((this cut3-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-image (vec2 30 10) :girl)
   
  (draw-text *key2* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut4-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut4-state) (button (eql :space)))
  (fistmage:transition-to 'cut5-state))


(defmethod fistmage:draw ((this cut4-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-image (vec2 30 10) :girl)
   
  (draw-text *key3* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut5-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut5-state) (button (eql :space)))
  (fistmage:transition-to 'fail1-state))


(defmethod fistmage:draw ((this cut5-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-image (vec2 30 10) :girl)
   
  (draw-text *key4* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





