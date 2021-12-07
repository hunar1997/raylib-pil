(load "../../lib/raylib-pil.l")
(symbols 'ray 'pico)

(de raylib @ (pass native "libraylib.so"))

(setq screenWidth  800
      screenHeight 450
      KEY_RIGHT    262
      KEY_LEFT     263
      KEY_DOWN     264
      KEY_UP       265
      RAYWHITE     (hex "FFF5F5F5")
      DARKGRAY     (hex "FF505050")
      MAROON       (hex "FF3721BE"))

(initWindow screenWidth screenHeight "raylib [core] example - keyboard input")

(setq ballPosition (list (*/ screenWidth 1.0 2) (*/ screenHeight 1.0 2)) )

(setTargetFPS 60)

(until (windowShouldClose)
   (when (isKeyDown KEY_RIGHT) (inc ballPosition 2.))
   (when (isKeyDown KEY_LEFT) (dec ballPosition 2.))
   (when (isKeyDown KEY_UP) (dec (cdr ballPosition) 2.))
   (when (isKeyDown KEY_DOWN) (inc (cdr ballPosition) 2.))

   (beginDrawing)
      (clearBackground RAYWHITE )
      (drawText "move the ball with arrow keys" 10 10 20 DARKGRAY)
      (drawCircleV ballPosition 50.0 MAROON)
      (drawRectangleV (100.0 100.0) (30.0 50.0) RED)
   (endDrawing)
)

(closeWindow)

(bye)


