(load "../../lib/raylib-pil.l")
(symbols 'ray 'pico)

(setq screenWidth 800
   screenHeight   450
   framesCounter  0
   currentScreen  'LOGO
   BREAK          NIL)

(initWindow screenWidth screenHeight "raylib [core] example - basic screen manager")

(setTargetFPS 60)

(until (or (windowShouldClose) BREAK)
   (case currentScreen
      (LOGO
         (inc 'framesCounter)
         (when (> framesCounter 120) (setq currentScreen 'TITLE)))
      (TITLE
         (when (or (isKeyPressed KEY_ENTER) (isGestureDetected GESTURE_TAP)) (setq currentScreen 'GAMEPLAY)))
      (GAMEPLAY
         (when (or (isKeyPressed KEY_ENTER) (isGestureDetected GESTURE_TAP)) (setq currentScreen 'ENDING)))
      (ENDING
         (when (or (isKeyPressed KEY_ENTER) (isGestureDetected GESTURE_TAP)) (setq currentScreen 'TITLE)))
      (T (on BREAK)))

   (beginDrawing)
      (clearBackground RAYWHITE)
      (case currentScreen
         (LOGO
            (drawText "LOGO SCREEN" 20 20 40 LIGHTGRAY)
            (drawText "WAIT for 2 SECONDS..." 290 220 20 GRAY))
         (TITLE
            (drawRectangle 0 0 screenWidth screenHeight GREEN)
            (drawText "TITLE SCREEN" 20 20 40 DARKGREEN)
            (drawText "PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN" 120 220 20 DARKGREEN))
         (GAMEPLAY
            (drawRectangle 0 0 screenWidth screenHeight PURPLE)
            (drawText "GAMEPLAY SCREEN" 20 20 40 MAROON)
            (drawText "PRESS ENTER or TAP to JUMP to ENDING SCREEN" 120 220 20 MAROON))
         (ENDING
            (drawRectangle 0 0 screenWidth screenHeight BLUE)
            (drawText "ENDING SCREEN" 20 20 40 DARKBLUE)
            (drawText "PRESS ENTER or TAP to JUMP to TITLE SCREEN" 120 220 20 DARKBLUE))
         (T (on BREAK)))
   (endDrawing))

(closeWindow)

(bye)

