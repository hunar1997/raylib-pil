(de raylib @ (pass native "libraylib.so"))

(setq KEY_ENTER     257
      GESTURE_TAP   1
      RAYWHITE      (hex "FFF5F5F5")
      LIGHTGRAY     (hex "FFC8C8C8")
      GRAY          (hex "FF828282")
      GREEN         (hex "FF30E400")
      DARKGREEN     (hex "FF752C00")
      PURPLE        (hex "FFFF7AC8")
      MAROON        (hex "FF3721BE")
      BLUE          (hex "FFF17900")
      DARKBLUE      (hex "FFAC5200"))

(setq screenWidth	800
      screenHeight	450
      framesCounter	0
      currentScreen	'LOGO
      BREAK		NIL)

(raylib "InitWindow" NIL screenWidth screenHeight "raylib [core] example - basic screen manager")

(raylib "SetTargetFPS" NIL 60)

(while (and (=0 (raylib "WindowShouldClose" 'B)) (not BREAK))
  (case currentScreen
    (LOGO
      (inc 'framesCounter)
      (when (> framesCounter 120) (setq currentScreen 'TITLE)))
    (TITLE
      (when (or (=1 (raylib "IsKeyPressed" 'B KEY_ENTER)) (=1 (raylib "IsGestureDetected" 'B GESTURE_TAP))) (setq currentScreen 'GAMEPLAY)))
    (GAMEPLAY
      (when (or (=1 (raylib "IsKeyPressed" 'B KEY_ENTER)) (=1 (raylib "IsGestureDetected" 'B GESTURE_TAP))) (setq currentScreen 'ENDING)))
    (ENDING
      (when (or (=1 (raylib "IsKeyPressed" 'B KEY_ENTER)) (=1 (raylib "IsGestureDetected" 'B GESTURE_TAP))) (setq currentScreen 'TITLE)))
    (T (on BREAK)))

  (raylib "BeginDrawing")
    (raylib "ClearBackground" NIL RAYWHITE )
    (case currentScreen
      (LOGO
        (raylib "DrawText" NIL "LOGO SCREEN" 20 20 40 LIGHTGRAY)
        (raylib "DrawText" NIL "WAIT for 2 SECONDS..." 290 220 20 GRAY))
      (TITLE
        (raylib "DrawRectangle" NIL 0 0 screenWidth screenHeight GREEN)
        (raylib "DrawText" NIL "TITLE SCREEN" 20 20 40 DARKGREEN)
        (raylib "DrawText" NIL "PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN" 120 220 20 DARKGREEN))
      (GAMEPLAY
        (raylib "DrawRectangle" NIL 0 0 screenWidth screenHeight PURPLE)
        (raylib "DrawText" NIL "GAMEPLAY SCREEN" 20 20 40 MAROON)
        (raylib "DrawText" NIL "PRESS ENTER or TAP to JUMP to ENDING SCREEN" 120 220 20 MAROON))
      (ENDING
        (raylib "DrawRectangle" NIL 0 0 screenWidth screenHeight BLUE)
        (raylib "DrawText" NIL "ENDING SCREEN" 20 20 40 DARKBLUE)
        (raylib "DrawText" NIL "PRESS ENTER or TAP to JUMP to TITLE SCREEN" 120 220 20 DARKBLUE))
      (T (on BREAK)))
  (raylib "EndDrawing")
)
(raylib "CloseWindow")
(bye)

