(scl 4)

(load "@lib/clang.l")

(clang "structs" '("-lraylib")
  (DrawCircleV (pos r col) PilDrawCircleV NIL (cons (car pos) -1.0) (cons (cadr pos) -1.0) (cons r -1.0) col) )

#include <stdio.h>
#include "raylib.h"
void PilDrawCircleV (float x, float y, float r, Color col){
    Vector2 v = {x,y};
    DrawCircleV(v,r,col);
    DrawCircle(x,y,r,col);
}

/**/

(de raylib @ (pass native "libraylib.so"))

(setq screenWidth	800
      screenHeight	450
      KEY_RIGHT         262
      KEY_LEFT          263
      KEY_DOWN          264
      KEY_UP            265
      RAYWHITE      	(hex "FFF5F5F5")
      DARKGRAY      	(hex "FF505050")
      MAROON		(hex "FF3721BE"))

(raylib "InitWindow" NIL screenWidth screenHeight "raylib [core] example - keyboard input")

(setq ballPosition (list (*/ screenWidth 1.0 2) (*/ screenHeight 1.0 2)) )

(raylib "SetTargetFPS" NIL 60)


(while (=0 (raylib "WindowShouldClose" 'B))
  (when (=1 (raylib "IsKeyDown" 'B KEY_RIGHT)) (inc ballPosition 2.))
  (when (=1 (raylib "IsKeyDown" 'B KEY_LEFT)) (dec ballPosition 2.))
  (when (=1 (raylib "IsKeyDown" 'B KEY_UP)) (dec (cdr ballPosition) 2.))
  (when (=1 (raylib "IsKeyDown" 'B KEY_DOWN)) (inc (cdr ballPosition) 2.))

  (raylib "BeginDrawing")
    (raylib "ClearBackground" NIL RAYWHITE )
    (raylib "DrawText" NIL "move the ball with arrow keys" 10 10 20 DARKGRAY)
    (DrawCircleV ballPosition 50.0 MAROON)
  (raylib "EndDrawing")
)

(raylib "CloseWindow")
(bye)


