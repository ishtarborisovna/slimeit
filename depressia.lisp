(cl:in-package :fistmage.game)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut9-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut9-state) (button (eql :space)))
  (fistmage:transition-to 'cut10-state))


(defmethod fistmage:draw ((this cut9-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-image (vec2 30 10) :girl)
   
  (draw-text *key7* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut10-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut10-state) (button (eql :space)))
  (fistmage:transition-to 'cut11-state))


(defmethod fistmage:draw ((this cut10-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-image (vec2 30 10) :girl)
   
  (draw-text *key8* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut11-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut11-state) (button (eql :space)))
  (fistmage:transition-to 'cut12-state))


(defmethod fistmage:draw ((this cut11-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 0.4))
  (draw-image (vec2 30 10) :girl)
   
  (draw-text *key9* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut12-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut12-state) (button (eql :space)))
  (fistmage:transition-to 'cut13-state))


(defmethod fistmage:draw ((this cut12-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 0.4))
  (draw-image (vec2 30 10) :girl)
   
  (draw-text *key10* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut13-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut13-state) (button (eql :space)))
  (fistmage:transition-to 'cut14-state))


(defmethod fistmage:draw ((this cut13-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 0.4))
  (draw-image (vec2 30 10) :girl)
   
  (draw-text *key11* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut14-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut14-state) (button (eql :space)))
  (fistmage:transition-to 'cut15-state))


(defmethod fistmage:draw ((this cut14-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 0.4))
  (draw-image (vec2 30 10) :girl)
  (draw-image (vec2 530 200) :cat)
   
  (draw-text *key12* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut15-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut15-state) (button (eql :space)))
  (fistmage:transition-to 'cut16-state))


(defmethod fistmage:draw ((this cut15-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 0.4))
  (draw-image (vec2 30 10) :girl)
  (draw-image (vec2 530 200) :cat)
   
  (draw-text *key13* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut16-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut16-state) (button (eql :space)))
  (fistmage:transition-to 'cut17-state))


(defmethod fistmage:draw ((this cut16-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0.3 1 0 0.4) :thickness 20 :stroke-paint (vec4 0.6 0.7 0.5 1))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 0.4))
  (draw-image (vec2 30 10) :girl)
  (draw-image (vec2 630 160) :vasa)
   
  (draw-text *key14* (vec2 40 650)
             :fill-color (vec4 0.4 0.2 0.2 1)
             :font *bubble-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut17-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut17-state) (button (eql :space)))
  (fistmage:transition-to 'game1-state))


(defmethod fistmage:draw ((this cut17-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 1))
  (draw-text *key15* (vec2 40 400)
               :fill-color (vec4 0 0.8 0 1)
               :font *evil-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defclass cut22-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod fistmage:button-pressed ((this cut22-state) (button (eql :space)))
  (fistmage:transition-to 'game2-state))


(defmethod fistmage:draw ((this cut22-state))
  (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 1))
  (draw-text *key19* (vec2 40 400)
               :fill-color (vec4 0 0.8 0 1)
               :font *evil-font*
             )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;























