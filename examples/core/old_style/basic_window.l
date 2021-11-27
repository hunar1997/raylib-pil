(de raylib @ (pass native "libraylib.so"))

(setq screenWidth 800 screenHeight 450)
(raylib "InitWindow" NIL screenWidth screenHeight "raylib [core] example - basic window")

(raylib "SetTargetFPS" NIL 60)

(while (=0 (raylib "WindowShouldClose" 'B))
 (raylib "BeginDrawing")                 BBGGRR
 (raylib "ClearBackground" NIL (hex "FFF5F5F5") )
 (raylib "DrawText" NIL "Congrats! You created your first window!" 190 200 20 (hex "ffc8c8c8") )	
 (raylib "EndDrawing")
 )
(raylib "CloseWindow")
(bye)
