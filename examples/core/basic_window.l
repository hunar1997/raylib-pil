(load "../../lib/raylib-pil.l")
(symbols 'ray 'pico)

(de raylib @ (pass native "libraylib.so"))

(setq screenWidth 800 screenHeight 450)
(initWindow screenWidth screenHeight "raylib [core] example - basic window")

(setTargetFPS 60)

(until (windowShouldClose)
 (beginDrawing)
 (clearBackground RAYWHITE)
 (raylib "DrawText" NIL "Congrats! You created your first window!" 190 200 20 LIGHTGRAY )
 (endDrawing))

(closeWindow)

(bye)
