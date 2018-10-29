(cl:in-package :fistmage.game)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut27-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut27-state) (button (eql :space)))
  (fistmage:transition-to 'cut28-state))


(defmethod fistmage:draw ((this cut27-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 1))
  (draw-text *key23* (vec2 40 400)
               :fill-color (vec4 0 0.8 0 1)
               :font *evil-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut28-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut28-state) (button (eql :space)))
  (fistmage:transition-to 'cut29-state))


(defmethod fistmage:draw ((this cut28-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-image (vec2 30 10) :girl)
   
  (draw-text *key24* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut29-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut29-state) (button (eql :space)))
  (fistmage:transition-to 'cut30-state))


(defmethod fistmage:draw ((this cut29-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-image (vec2 30 10) :girl)
   
  (draw-text *key25* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut30-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut30-state) (button (eql :space)))
  (fistmage:transition-to 'cut31-state))


(defmethod fistmage:draw ((this cut30-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-image (vec2 30 10) :girl-angry)
   
  (draw-text *key26* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut31-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut31-state) (button (eql :space)))
  (fistmage:transition-to 'cut32-state))


(defmethod fistmage:draw ((this cut31-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 1))
  (draw-image (vec2 30 10) :girl-angry)
  (draw-text *key27* (vec2 240 650)
             :fill-color (vec4 0 0.8 0 1)
             :font *evil-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut32-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut32-state) (button (eql :space)))
  (fistmage:transition-to 'cut33-state))


(defmethod fistmage:draw ((this cut32-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 1))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(defclass cut33-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:draw ((this cut33-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 1))
  (draw-text "by ishtarborisovna" (vec2 540 50) :fill-color (vec4 0 0.8 0 1) :font *evil-font*)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;










