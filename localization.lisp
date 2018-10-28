(cl:in-package :fistmage.game)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass language-state ()
  ((started-at :initform (real-time-seconds))))


(defmethod initialize-instance :after ((this game1-state) &key)
  (bind-button :R :pressed
               (lambda ()
		 (setf *language* 1)
                 ))
  (bind-button :E :pressed
               (lambda ()
		 (setf *language* 2)
                 ))
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *key1* nil)
(defparameter *key2* nil)
(defparameter *key3* nil)
(defparameter *key4* nil)
(defparameter *key5* nil)
(defparameter *key6* nil)
(defparameter *key7* nil)
(defparameter *key8* nil)
(defparameter *key9* nil)
(defparameter *key10* nil)
(defparameter *key11* nil)
(defparameter *key12* nil)
(defparameter *key13* nil)
(defparameter *key14* nil)
(defparameter *key15* nil)
(defparameter *key16* nil)
(defparameter *key17* nil)
(defparameter *key18* nil)
(defparameter *key19* nil)
(defparameter *key20* nil)
(defparameter *key21* nil)
(defparameter *key22* nil)
(defparameter *key23* nil)
(defparameter *key24* nil)
(defparameter *key25* nil)
(defparameter *key26* nil)
(defparameter *key27* nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun localization ()
  (if (= *language* 1)
      (and 
	     (setf *key1* "Ты тут впервые? Нажми на пробел, и ты впутаешься в эту историю.")
		 (setf *key2* "Меня зовут Кошка. И у меня есть проблема.")
		 (setf *key3* "Ты мог этого не заметить, но... Я немного слизень.")
		 (setf *key4* "Проблема же заключается... Ну... Просто посмотри на эту игру.")
		 (setf *key5* "Это я полгода назад. Ты же знаешь как в это играть? Нажми на пробел, и шарик (это я) под углом полетит вверх и, когда столкнется с красным прямоугольником, уничтожит его.")
		 (setf *key6* "Ну, такова теория. Давай, нажми на пробел, а я отойду... Не хочу на это смотреть.")
		 (setf *key7* "Теперь ты понимаешь? Я просто не могла это сделать. Я ПРИЛИПАЛА каждый раз.")
		 (setf *key8* "Снова и снова. Каждый раз. Постоянно.")
		 (setf *key9* "И вот тогда я поняла, что мечта моя недостижима.")
		 (setf *key10* "Я начала искать... утешение. Хотя тогда я еще не знала, что вообще что-то ищу.")
		 (setf *key11* "И в тот момент, когда тьма уже окружила меня, явилась она.")
		 (setf *key12* "Изящной тенью с божественной грацией она прошла мимо.")
		 (setf *key13* "Кошка вскочила на столик и улеглась и круглую стеклянную вазу.")
		 (setf *key14* "В этот же момент мне стал очевиден тезис, что кошки - это жидкость.")
		 (setf *key15* "Кажется, я нашла решение моей проблемы.")
		 (setf *key16* "Ты же все еще помнишь, как в это играть? Управляй платформой клавишами A и D, не дай шарику (это обновленная я!) упасть.")
		 (setf *key17* "Попробуй еще раз, это несложно!")
		 (setf *key18* "Наконец-то я сделала это. Но после выигрыша я опять вернулась в свою невзрачную форму. Моя кошка кончилась.")
		 (setf *key19* "Пришлось найти еще одну.")
		 (setf *key20* "Вторая кошка тоже мне помогла. Хотя я ее уже почти не помню.")
		 (setf *key21* "Ну же, сыграй еще раз.")
		 (setf *key22* "Кажется, кошки становятся моим личным сортом героина.")
		 (setf *key23* "663 кошки спустя...")
		 (setf *key24* "В какой-то момент я поняла, что кошки становятся моей сущностью. 'Ты то, что ты ешь.' Это абсолютная правда.")
		 (setf *key25* "Я взяла себе это имя. Кошка. Думаю, я заслужила его.")
		 (setf *key26* "Теперь ты знаешь мою историю и должен понять, что я не могу тебя отпустить...")
		 (setf *key27* "Котик...")
	  ))
	  (if (= *language* 2)
      (and 
	     (setf *key1* "First time around? Press space and drown into the story.")
		 (setf *key2* "I'm Cat. I'm in little trouble.")
		 (setf *key3* "Maybe you haven't notice, but I'm a little bit a... slime.")
		 (setf *key4* "The problem is... Well... Look yourself at this game.")
		 (setf *key5* "This is me half year ago. Do you know how to play? Press space to shoot the ball up (it's actually me). It will flight in slight angle. Ball will destroy red rectangular when hits it.")
		 (setf *key6* "That's the story. Go on, press space. But first I'll turn away, I don't want to watch this again.")
		 (setf *key7* "Do you get it now? I couldn't do it! I stuck every time.")
		 (setf *key8* "Again and again. Every time. Always.")
		 (setf *key9* "It's become clear for me, my dream will never come true.")
		 (setf *key10* "I've started to look something. I didn't knew what exactly i was looking. A relief? Maybe...")
		 (setf *key11* "When the darkness surrounded me she appeared infront of me.")
		 (setf *key12* "She passed by with a grace. She walked subtly like a shadow.")
		 (setf *key13* "Cat jumped up on the table and lay down in the round vase.")
		 (setf *key14* "It become clear for me. Cats ARE liquid.")
		 (setf *key15* "I think I found a solution of my problem.")
		 (setf *key16* "Do you still remember how to play? Move platform with A and D keys. Don't let the ball (it's renewed me) fall.")
		 (setf *key17* "Try one more time. It's not that hard!")
		 (setf *key18* "Finally I made it! After victory i've returned to my old pale state. I ran out of my cat.")
		 (setf *key19* "Had to find one more.")
		 (setf *key20* "Second cat helped me a lot. But I don't really remember it.")
		 (setf *key21* "Come on! Play one more time!")
		 (setf *key22* "Cats become my own kind of drug.")
		 (setf *key23* "663 cats later...")
		 (setf *key24* "At a moment i've realised. Cats become a part of me. You are what you eat.")
		 (setf *key25* "I took the name Cat. I think, I've owned it.")
		 (setf *key26* "Now when you know my story, you must understand, I can't let you go.")
		 (setf *key27* "Kitty")
	  )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod fistmage:act ((this language-state))
  (with-slots (started-at) this
  (if (or (= *language* 1) (= *language* 2))
      (fistmage:transition-to 'cut2-state)
      )
  ))


(defmethod fistmage:draw ((this language-state))
  (with-slots (started-at) this
    (localization)
    (draw-rect (vec2 0 0) 1024 768 :fill-paint (vec4 0 0 0 1))
    (draw-text "Press E for English or R for Russian" (vec2 170 400)
               :fill-color (vec4 0.5 0 0.5 1)
               :font *language-font*
               )
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

