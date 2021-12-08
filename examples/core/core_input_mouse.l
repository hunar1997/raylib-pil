(load "../../lib/raylib-pil.l")
(symbols 'ray 'pico)

(setq screenWidth 800
      screenHeight 450)

(initWindow screenWidth screenHeight "raylib [core] example - mouse input")

(setq ballPosition (-100.0 -100.0 )
      ballColor DARKBLUE)

(setTargetFPS 60)

(until (windowShouldClose)
   (setq ballPosition (getMousePosition))
   #(setq ballPosition (list (* 1.0 (getMouseX)) (* 1.0 (getMouseY))))

   (cond 
      ((isMouseButtonPressed MOUSE_BUTTON_LEFT)    (setq ballColor MAROON))
      ((isMouseButtonPressed MOUSE_BUTTON_MIDDLE)  (setq ballColor LIME))
      ((isMouseButtonPressed MOUSE_BUTTON_RIGHT)   (setq ballColor DARKBLUE))
      ((isMouseButtonPressed MOUSE_BUTTON_SIDE)    (setq ballColor PURPLE))
      ((isMouseButtonPressed MOUSE_BUTTON_EXTRA)   (setq ballColor YELLOW))
      ((isMouseButtonPressed MOUSE_BUTTON_FORWARD) (setq ballColor ORANGE))
      ((isMouseButtonPressed MOUSE_BUTTON_BACK)    (setq ballColor BEIGE)))

   (beginDrawing)
      (clearBackground RAYWHITE)
      (drawCircleV ballPosition 40.0 ballColor)
      (drawText "move ball with mouse and click mouse button to change color" 10 10 20 DARKGRAY)
   (endDrawing)
)

(closeWindow)

(bye)
