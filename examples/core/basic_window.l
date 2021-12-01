(load "../../lib/raylib-pil.l")
(symbols 'ray 'pico)


(setq screenWidth 800 screenHeight 450)
(initWindow screenWidth screenHeight "raylib [core] example - basic window")

(setTargetFPS 60)

(until (windowShouldClose)
   (beginDrawing)
      (clearBackground RAYWHITE)
      (drawText "Congrats! You created your first window!" 190 200 20 LIGHTGRAY )
   (endDrawing))

(closeWindow)

(bye)
