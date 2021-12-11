(scl 4)

(symbols 'ray 'pico)

# Helper functions
(de flt N (list 'cons (car N) -1.0)) # turns  `(flt N) into (cons N -1.0)
(de vec2 NIL (lit '(-1.0 -1.0) )) # turns `(vec2) into '(-1.0 -1.0)
(de bln NIL (lit (list 'F 'B 'n0))) # turns `(bln) into '(F B n0)

#(local clang)
(de clang (Nm L . Lst)
   (out (tmp Nm ".c") (here "/**/"))
   (apply call L "clang" "-o" (tmp Nm)
      "-fPIC" "-O" "-w" "-shared" (tmp Nm ".c"))
   (for L Lst
      (let Ret (cadddr L)
         (def (car L)
            (list
               (cadr L)
               (if (and (pair Ret) (= (cadr Ret) 'F))
                  (cons (cadddr Ret) (list (cons 'native (tmp Nm) (name (caddr L)) (cons 'quote (caddr Ret)) (cddddr L))))
                  (cons 'native (tmp Nm) (name (caddr L)) (cdddr L))))    )
         (when (== '@ (fin (cadr L)))
            (push (cdaar L) 'pass)) ) ))

(clang "raylib-pil" '("-lraylib")

# All the functions that have the symbol below are verified to be working
#{☑}# 
# The commented lines are not implemented yet

#{☑}#   (initWindow (Width Height Title) InitWindow NIL Width Height Title)
#{☑}#   (windowShouldClose NIL WindowShouldClose `(bln))
#{☑}#   (closeWindow NIL CloseWindow)
   (isWindowReady NIL IsWindowReady `(bln))
   (isWindowFullscreen NIL IsWindowFullscreen `(bln))
   (isWindowHidden NIL IsWindowHidden `(bln))
   (isWindowMinimized NIL IsWindowMinimized `(bln))
   (isWindowMaximized NIL IsWindowMaximized `(bln))
   (isWindowFocused NIL IsWindowFocused `(bln))
   (isWindowResized NIL IsWindowResized `(bln))
   (isWindowState (Flag) IsWindowState `(bln) Flag)

   (setWindowState (Flags) SetWindowState NIL Flags)
   (clearWindowState (Flags) ClearWindowState NIL Flags)
   (toggleFullscreen NIL ToggleFullscreen)
   (maximizeWindow NIL MaximizeWindow)
   (minimizeWindow NIL MinimizeWindow)
   (restoreWindow NIL RestoreWindow NIL)
   (setWindowIcon (Image) SetWindowIcon NIL Image)
   (setWindowTitle (Title) SetWindowTitle NIL Title)
   (setWindowPosition (X Y) SetWindowPosition NIL X Y)
   (setWindowMonitor (Monitor) SetWindowMonitor NIL Monitor)
   (setWindowMinSize (Width Height) SetWindowMinSize NIL Width Height)
   (setWindowSize (Width Height) SetWindowSize NIL Width Height)
   (getWindowHandle NIL GetWindowHandle 'P)
   (getScreenWidth NIL GetScreenWidth 'I)
   (getScreenHeight NIL GetScreenHeight 'I)
   (getMonitorCount NIL GetMonitorCount 'I)
   (getCurrentMonitor NIL GetCurrentMonitor 'I)
#  (Vector2 GetMonitorPosition(int monitor))
   (getMonitorWidth (Monitor) GetMonitorWidth 'I Monitor)
   (getMonitorHeight (Monitor) GetMonitorHeight 'I Monitor)
   (getMonitorPhysicalWidth (Monitor) GetMonitorPhysicalWidth 'I Monitor)
   (getMonitorPhysicalHeight (Monitor) GetMonitorPhysicalHeight 'I Monitor)
   (getMonitorRefreshRate (Monitor) GetMonitorRefreshRate 'I Monitor)
#  (Vector2 GetWindowPosition(void))
#  (Vector2 GetWindowScaleDPI(void))
   (getMonitorName (Monitor) GetMonitorName 'S Monitor)
   (setClipboardText (Text) SetClipboardText NIL Text)
   (getClipboardText NIL GetClipboardText 'S)

   (swapScreenBuffer NIL SwapScreenBuffer)
   (pollInputEvents NIL PollInputEvents)
   (waitTime (Ms) WaitTime NIL Ms)

   (showCursor NIL ShowCursor)
   (hideCursor NIL HideCursor)
   (isCursorHidden NIL IsCursorHidden `(bln))
   (enableCursor NIL EnableCursor)
   (disableCursor NIL DisableCursor)
   (isCursorOnScreen NIL IsCursorOnScreen `(bln))

#{☑}#   (clearBackground (Color) ClearBackground NIL Color)
#{☑}#   (beginDrawing NIL BeginDrawing)
#{☑}#   (endDrawing NIL EndDrawing)
#   (void BeginMode2D(Camera2D camera)
   (endMode2D NIL EndMode2D)
#   (void BeginMode3D(Camera3D camera)
   (endMode3D NIL EndMode3D)
#   (void BeginTextureMode(RenderTexture2D target)
   (endTextureMode NIL EndTextureMode)
#   (void BeginShaderMode(Shader shader)
   (endShaderMode NIL EndShaderMode)
   (beginBlendMode (Mode) BeginBlendMode NIL Mode)
   (endBlendMode NIL EndBlendMode)
   (beginScissorMode (X Y Width Height) BeginScissorMode NIL X Y Width Height)
   (endScissorMode NIL EndScissorMode)
#   (void BeginVrStereoMode(VrStereoConfig config)
   (endVrStereoMode NIL EndVrStereoMode)

#   (VrStereoConfig LoadVrStereoConfig(VrDeviceInfo device)
#   (void UnloadVrStereoConfig(VrStereoConfig config)

#   (Shader LoadShader(const char *vsFileName, const char *fsFileName)
#   (Shader LoadShaderFromMemory(const char *vsCode, const char *fsCode)
#   (int GetShaderLocation(Shader shader, const char *uniformName)
#   (int GetShaderLocationAttrib(Shader shader, const char *attribName)
#   (void SetShaderValue(Shader shader, int locIndex, const void *value, int uniformType)
#   (void SetShaderValueV(Shader shader, int locIndex, const void *value, int uniformType, int count)
#   (void SetShaderValueMatrix(Shader shader, int locIndex, Matrix mat)
#   (void SetShaderValueTexture(Shader shader, int locIndex, Texture2D texture)
#   (void UnloadShader(Shader shader)

#   (Ray GetMouseRay(Vector2 mousePosition, Camera camera)
#   (Matrix GetCameraMatrix(Camera camera)
#   (Matrix GetCameraMatrix2D(Camera2D camera)
#   (Vector2 GetWorldToScreen(Vector3 position, Camera camera)
#   (Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int width, int height)
#   (Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera)
#   (Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera)

#{☑}#   (setTargetFPS (Fps) SetTargetFPS NIL Fps)
   (getFPS NIL GetFPS 'I)
   (getFrameTime NIL GetFrameTime -1.0)
   (getTime NIL GetTime 1.0)

   (getRandomValue (Min Max) GetRandomValue 'I Min Max)
   (setRandomSeed (Seed) SetRandomSeed NIL Seed)
   (takeScreenshot (FileName) TakeScreenshot NIL FileName)
   (setConfigFlags (Flags) SetConfigFlags NIL Flags)

   (setTraceLogLevel (LogLevel) SetTraceLogLevel NIL LogLevel)
   (memAlloc (Size) MemAlloc 'P Size)
   (memRealloc (Ptr Size) MemRealloc 'P Ptr Size)
   (memFree (Ptr) MemFree NIL Ptr)

   (setTraceLogCallback (Callback) SetTraceLogCallback NIL Callback)
   (setLoadFileDataCallback (Callback) SetLoadFileDataCallback NIL Callback)
   (setSaveFileDataCallback (Callback) SetSaveFileDataCallback NIL Callback)
   (setLoadFileTextCallback (Callback) SetLoadFileTextCallback NIL Callback)
   (setSaveFileTextCallback (Callback) SetSaveFileTextCallback NIL Callback)

#   (loadFileData (Filename BytesRead) LoadFileData 'P FileName BytesRead)
#   (void UnloadFileData(unsigned char *data)
#   (bool SaveFileData(const char *fileName, void *data, unsigned int bytesToWrite)
   (loadFileText (FileName) LoadFileText 'P FileName)
   (unloadFileText (Text) UnloadFileText NIL Text)
   (saveFileText (FileName Text) SaveFileText `(bln) FileName Text)
   (fileExists (FileName) FileExists `(bln) FileName)
   (directoryExists (DirPath) DirectoryExists `(bln) DirPath)
   (isFileExtension (FileName Ext) IsFileExtension `(bln) FileName Ext)
   (getFileExtension (FileName) GetFileExtension 'S FileName)
   (getFileName (FilePath) GetFileName 'S FilePath)
   (getFileNameWithoutExt (FilePath) GetFileNameWithoutExt 'S FilePath)
   (getDirectoryPath (FilePath) GetDirectoryPath 'S FilePath)
   (getPrevDirectoryPath (DirPath) GetPrevDirectoryPath 'S DirPath)
   (getWorkingDirectory NIL GetWorkingDirectory 'S)
#   (char **GetDirectoryFiles(const char *dirPath, int *count)
   (clearDirectoryFiles NIL ClearDirectoryFiles)
   (ChangeDirectory (Dir) ChangeDirectory `(bln) Dir)
   (isFileDropped NIL IsFileDropped `(bln))
#   (char **GetDroppedFiles(int *count)
   (clearDroppedFiles NIL ClearDroppedFiles)
   (getFileModTime (FileName) GetFileModTime 'N FileName)

#   (unsigned char *CompressData(unsigned char *data, int dataLength, int *compDataLength)
#   (unsigned char *DecompressData(unsigned char *compData, int compDataLength, int *dataLength)
#   (char *EncodeDataBase64(const unsigned char *data, int dataLength, int *outputLength)
#   (unsigned char *DecodeDataBase64(unsigned char *data, int *outputLength)

   (saveStorageValue (Position Value) SaveStorageValue `(bln) Position Value)
   (loadStorageValue (Position) LoadStorageValue 'I Position)

   (openURL (Url) OpenURL NIL Url)

#{☑}#   (isKeyPressed (Key) IsKeyPressed `(bln) Key)
#{☑}#   (isKeyDown (Key) IsKeyDown `(bln) Key)
   (isKeyReleased (Key) IsKeyReleased `(bln) Key)
   (isKeyUp (Key) IsKeyUp `(bln) Key)
   (setExitKey (Key) SetExitKey NIL Key)
   (getKeyPressed NIL GetKeyPressed 'I)
   (getCharPressed NIL GetCharPressed 'I)

   (isGamepadAvailable (Gamepad) IsGamepadAvailable `(bln) Gamepad)
   (getGamepadName (Gamepad) GetGamepadName 'S Gamepad)
   (isGamepadButtonPressed (Gamepad Button) IsGamepadButtonPressed `(bln) Gamepad Button)
   (isGamepadButtonDown (Gamepad Button) IsGamepadButtonDown `(bln) Gamepad Button)
   (isGamepadButtonReleased (Gamepad Button) IsGamepadButtonReleased `(bln) Gamepad Button)
   (isGamepadButtonUp (Gamepad Button) IsGamepadButtonUp `(bln) Gamepad Button)
   (getGamepadButtonPressed NIL GetGamepadButtonPressed 'I)
   (getGamepadAxisCount (Gamepad) GetGamepadAxisCount 'I Gamepad)
   (getGamepadAxisMovement (Gamepad Axis) GetGamepadAxisMovement -1.0 Gamepad Axis)
   (setGamepadMappings (Mappings) SetGamepadMappings 'I Mappings)

#{☑}#   (isMouseButtonPressed (Button) IsMouseButtonPressed `(bln) Button)
   (isMouseButtonDown (Button) IsMouseButtonDown `(bln) Button)
   (isMouseButtonReleased (Button) IsMouseButtonReleased `(bln) Button)
   (isMouseButtonUp (Button) IsMouseButtonUp `(bln) Button)
#{☑}#   (getMouseX NIL GetMouseX 'I)
#{☑}#   (getMouseY NIL GetMouseY 'I)
#   (Vector2 GetMouseDelta(void)
   (setMousePosition (X Y) SetMousePosition NIL X Y)
   (setMouseOffset (OffsetX OffsetY) SetMouseOffset NIL OffsetX OffsetY)
   (setMouseScale (ScaleX ScaleY) SetMouseScale NIL `(flt ScaleX) `(flt ScaleY))
   (getMouseWheelMove NIL GetMouseWheelMove -1.0 )
   (setMouseCursor (Cursor) SetMouseCursor NIL Cursor)

   (getTouchX NIL GetTouchX 'I)
   (getTouchY NIL GetTouchY 'I)
#   (Vector2 GetTouchPosition(int index)
   (getTouchPointId (Index) GetTouchPointId 'I Index)
   (getTouchPointCount NIL GetTouchPointCount 'I)

   (setGesturesEnabled (Flags) SetGesturesEnabled NIL Flags)
   (isGestureDetected (Gesture) IsGestureDetected `(bln) Gesture)
   (getGestureDetected NIL GetGestureDetected 'I)
   (getGestureHoldDuration NIL GetGestureHoldDuration -1.0)
#   (Vector2 GetGestureDragVector(void)
   (getGestureDragAngle NIL GetGestureDragAngle -1.0)
#   (Vector2 GetGesturePinchVector(void)
   (getGesturePinchAngle NIL GetGesturePinchAngle -1.0)

#   (void SetCameraMode(Camera camera, int mode)
#   (void UpdateCamera(Camera *camera)

   (setCameraPanControl (KeyPan) SetCameraPanControl NIL KeyPan)
   (setCameraAltControl (KeyAlt) SetCameraAltControl NIL KeyAlt)
   (setCameraSmoothZoomControl (KeySmoothZoom) SetCameraSmoothZoomControl NIL KeySmoothZoom)
   (setCameraMoveControls (KeyFront KeyBack KeyRight KeyLeft KeyUp KeyDown) SetCameraMoveControls NIL KeyFront KeyBack KeyRight KeyLeft KeyUp KeyDown)

#   (void SetShapesTexture(Texture2D texture, Rectangle source)

   (drawPixel (PosX PosY Color) DrawPixel NIL PosX PosY Color)
#   (void DrawPixelV(Vector2 position, Color color)
   (drawLine (StartPosX StartPosY EndPosX EndPosY Color) DrawLine NIL StartPosX StartPosY EndPosX EndPosY Color)
#   (void DrawLineV(Vector2 startPos, Vector2 endPos, Color color)
#   (void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color)
#   (void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color)
#   (void DrawLineBezierQuad(Vector2 startPos, Vector2 endPos, Vector2 controlPos, float thick, Color color)
#   (void DrawLineBezierCubic(Vector2 startPos, Vector2 endPos, Vector2 startControlPos, Vector2 endControlPos, float thick, Color color)
#   (void DrawLineStrip(Vector2 *points, int pointCount, Color color)
#{☑}#   (drawCircle (CenterX CenterY Radius Color) DrawCircle NIL CenterX CenterY `(flt Radius) Color)
#   (void DrawCircleSector(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color)
#   (void DrawCircleSectorLines(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color)
#{☑}#   (drawCircleGradient (CenterX CenterY Radius Color1 Color2) DrawCircleGradient NIL CenterX CenterY `(flt Radius) Color1 Color2)
#{☑}#   (drawCircleV (Center Radius Color) PilDrawCircleV NIL `(flt (car Center)) `(flt (cadr Center)) `(flt Radius) Color)
   (drawCircleLines (CenterX CenterY Radius Color) DrawCircleLines NIL CenterX CenterY `(flt Radius) Color)
   (drawEllipse (CenterX CenterY RadiusH RadiusV Color) DrawEllipse NIL CenterX CenterY `(flt RadiusH) `(flt RadiusV) Color)
   (drawEllipseLines (CenterX CenterY RadiusH RadiusV Color) DrawEllipseLines NIL CenterX CenterY `(flt RadiusH) `(flt RadiusV) Color)
#   (void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color)
#   (void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color)
#{☑}#   (drawRectangle (PosX PosY Width Height Color) DrawRectangle NIL PosX PosY Width Height Color)
#{☑}#   (drawRectangleV (Position Size Color) PilDrawRectangleV NIL `(flt (car Position)) `(flt (cadr Position)) `(flt (car Size)) `(flt (cadr Size)) Color)
#   (void DrawRectangleRec(Rectangle rec, Color color)
#   (void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color)
#{☑}#   (drawRectangleGradientV (PosX PosY Width Height Color1 Color2) DrawRectangleGradientV NIL PosX PosY Width Height Color1 Color2)
#{☑}#   (drawRectangleGradientH (PosX PosY Width Height Color1 Color2) DrawRectangleGradientH NIL PosX PosY Width Height Color1 Color2)
#   (void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4)
   (drawRectangleLines (PosX PosY Width Height Color) DrawRectangleLines NIL PosX PosY Width Height Color)
#   (void DrawRectangleLinesEx(Rectangle rec, float lineThick, Color color)
#   (void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color)
#   (void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, float lineThick, Color color)
#   (void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color)
#   (void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color)
#   (void DrawTriangleFan(Vector2 *points, int pointCount, Color color)
#   (void DrawTriangleStrip(Vector2 *points, int pointCount, Color color)
#   (void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color)
#   (void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color)
#   (void DrawPolyLinesEx(Vector2 center, int sides, float radius, float rotation, float lineThick, Color color)

#   (bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2)
#   (bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2)
#   (bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec)
#   (bool CheckCollisionPointRec(Vector2 point, Rectangle rec)
#   (bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius)
#   (bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3)
#   (bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint)
#   (bool CheckCollisionPointLine(Vector2 point, Vector2 p1, Vector2 p2, int threshold)
#   (Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2)

#   (Image LoadImage(const char *fileName)
#   (Image LoadImageRaw(const char *fileName, int width, int height, int format, int headerSize)
#   (Image LoadImageAnim(const char *fileName, int *frames)
#   (Image LoadImageFromMemory(const char *fileType, const unsigned char *fileData, int dataSize)
#   (Image LoadImageFromTexture(Texture2D texture)
#   (Image LoadImageFromScreen(void)
#   (void UnloadImage(Image image)
#   (bool ExportImage(Image image, const char *fileName)
#   (bool ExportImageAsCode(Image image, const char *fileName)

#   (Image GenImageColor(int width, int height, Color color)
#   (Image GenImageGradientV(int width, int height, Color top, Color bottom)
#   (Image GenImageGradientH(int width, int height, Color left, Color right)
#   (Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer)
#   (Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2)
#   (Image GenImageWhiteNoise(int width, int height, float factor)
#   (Image GenImageCellular(int width, int height, int tileSize)

#   (Image ImageCopy(Image image)
#   (Image ImageFromImage(Image image, Rectangle rec)
#   (Image ImageText(const char *text, int fontSize, Color color)
#   (Image ImageTextEx(Font font, const char *text, float fontSize, float spacing, Color tint)
#   (void ImageFormat(Image *image, int newFormat)
#   (void ImageToPOT(Image *image, Color fill)
#   (void ImageCrop(Image *image, Rectangle crop)
#   (void ImageAlphaCrop(Image *image, float threshold)
#   (void ImageAlphaClear(Image *image, Color color, float threshold)
#   (void ImageAlphaMask(Image *image, Image alphaMask)
#   (void ImageAlphaPremultiply(Image *image)
#   (void ImageResize(Image *image, int newWidth, int newHeight)
#   (void ImageResizeNN(Image *image, int newWidth,int newHeight)
#   (void ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color fill)
#   (void ImageMipmaps(Image *image)
#   (void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp)
#   (void ImageFlipVertical(Image *image)
#   (void ImageFlipHorizontal(Image *image)
#   (void ImageRotateCW(Image *image)
#   (void ImageRotateCCW(Image *image)
#   (void ImageColorTint(Image *image, Color color)
#   (void ImageColorInvert(Image *image)
#   (void ImageColorGrayscale(Image *image)
#   (void ImageColorContrast(Image *image, float contrast)
#   (void ImageColorBrightness(Image *image, int brightness)
#   (void ImageColorReplace(Image *image, Color color, Color replace)
#   (Color *LoadImageColors(Image image)
#   (Color *LoadImagePalette(Image image, int maxPaletteSize, int *colorCount)
#   (void UnloadImageColors(Color *colors)
#   (void UnloadImagePalette(Color *colors)
#   (Rectangle GetImageAlphaBorder(Image image, float threshold)
#   (Color GetImageColor(Image image, int x, int y)

#   (void ImageClearBackground(Image *dst, Color color)
#   (void ImageDrawPixel(Image *dst, int posX, int posY, Color color)
#   (void ImageDrawPixelV(Image *dst, Vector2 position, Color color)
#   (void ImageDrawLine(Image *dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color)
#   (void ImageDrawLineV(Image *dst, Vector2 start, Vector2 end, Color color)
#   (void ImageDrawCircle(Image *dst, int centerX, int centerY, int radius, Color color)
#   (void ImageDrawCircleV(Image *dst, Vector2 center, int radius, Color color)
#   (void ImageDrawRectangle(Image *dst, int posX, int posY, int width, int height, Color color)
#   (void ImageDrawRectangleV(Image *dst, Vector2 position, Vector2 size, Color color)
#   (void ImageDrawRectangleRec(Image *dst, Rectangle rec, Color color)
#   (void ImageDrawRectangleLines(Image *dst, Rectangle rec, int thick, Color color)
#   (void ImageDraw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint)
#   (void ImageDrawText(Image *dst, const char *text, int posX, int posY, int fontSize, Color color)
#   (void ImageDrawTextEx(Image *dst, Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint)

#   (Texture2D LoadTexture(const char *fileName)
#   (Texture2D LoadTextureFromImage(Image image)
#   (TextureCubemap LoadTextureCubemap(Image image, int layout)
#   (RenderTexture2D LoadRenderTexture(int width, int height)
#   (void UnloadTexture(Texture2D texture)
#   (void UnloadRenderTexture(RenderTexture2D target)
#   (void UpdateTexture(Texture2D texture, const void *pixels)
#   (void UpdateTextureRec(Texture2D texture, Rectangle rec, const void *pixels)
#
#   (void GenTextureMipmaps(Texture2D *texture)
#   (void SetTextureFilter(Texture2D texture, int filter)
#   (void SetTextureWrap(Texture2D texture, int wrap)
#
#   (void DrawTexture(Texture2D texture, int posX, int posY, Color tint)
#   (void DrawTextureV(Texture2D texture, Vector2 position, Color tint)
#   (void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint)
#   (void DrawTextureRec(Texture2D texture, Rectangle source, Vector2 position, Color tint)
#   (void DrawTextureQuad(Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint)
#   (void DrawTextureTiled(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, float scale, Color tint)
#   (void DrawTexturePro(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, Color tint)
#   (void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle dest, Vector2 origin, float rotation, Color tint)
#   (void DrawTexturePoly(Texture2D texture, Vector2 center, Vector2 *points, Vector2 *texcoords, int pointCount, Color tint)
   
   (fade (Color Alpha) Fade 'I Color `(flt Alpha))
   (colorToInt (Color) ColorToInt 'I Color)
#   (Vector4 ColorNormalize(Color color)
#   (Color ColorFromNormalized(Vector4 normalized)
#   (Vector3 ColorToHSV(Color color)
   (colorFromHSV (Hue Saturation Value) ColorFromHSV 'I `(flt Hue) `(flt Saturation) `(flt Value))
   (colorAlpha (Color Alpha) ColorAlpha 'I Color `(flt Alpha))
   (colorAlphaBlend (Dst Src Tint) ColorAlphaBlend 'I Dstr Src Tint)
   (getColor (HexValue) GetColor 'I HexValue)
#   (Color GetPixelColor(void *srcPtr, int format)
#   (void SetPixelColor(void *dstPtr, Color color, int format)
   (getPixelDataSize (Width Height Format) GetPixelDataSize 'I Width Height Format)
   
#   (Font GetFontDefault(void)
#   (Font LoadFont(const char *fileName)
#   (Font LoadFontEx(const char *fileName, int fontSize, int *fontChars, int glyphCount)
#   (Font LoadFontFromImage(Image image, Color key, int firstChar)
#   (Font LoadFontFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int fontSize, int *fontChars, int glyphCount)
#   (GlyphInfo *LoadFontData(const unsigned char *fileData, int dataSize, int fontSize, int *fontChars, int glyphCount, int type)
#   (Image GenImageFontAtlas(const GlyphInfo *chars, Rectangle **recs, int glyphCount, int fontSize, int padding, int packMethod)
#   (void UnloadFontData(GlyphInfo *chars, int glyphCount)
#   (void UnloadFont(Font font)
   
#{☑}#   (drawFPS (PosX PosY) DrawFPS NIL PosX PosY)
#{☑}#   (drawText (Text PosX PosY FontSize Color) DrawText NIL Text PosX PosY FontSize Color)
#   (void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint)
#   (void DrawTextPro(Font font, const char *text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint)
#   (void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float fontSize, Color tint)


   (measureText (Text FontSize) MeasureText 'I Text FontSize)
#   (Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing)
#   (int GetGlyphIndex(Font font, int codepoint)
#   (GlyphInfo GetGlyphInfo(Font font, int codepoint)
#   (Rectangle GetGlyphAtlasRec(Font font, int codepoint)

#   (int *LoadCodepoints(const char *text, int *count)
#   (void UnloadCodepoints(int *codepoints)
   (getCodepointCount (Text) GetCodepointCount 'I Text)
#   (int GetCodepoint(const char *text, int *bytesProcessed)
#   (const char *CodepointToUTF8(int codepoint, int *byteSize)
#   (char *TextCodepointsToUTF8(int *codepoints, int length)

   (textCopy (Dst Src) TextCopy 'I Dst Src)
#{☑}#   (textIsEqual (Text1 Text2) TextIsEqual `(bln) Text1 Text2)
#{☑}#   (textLength (Text) TextLength 'I Text)
#{☑}#   (textSubtext (Text Position Length) TextSubtext 'S Text Position Length)
#{☑}#   (textReplace (Text Replace By) TextReplace 'S Text Replace By)
   (textInsert (Text Insert Position) TextInsert 'S Text Insert Position)
#   (const char *TextJoin(const char **textList, int count, const char *delimiter)
#   (const char **TextSplit(const char *text, char delimiter, int *count)
# position is a pointer   (textAppend (Text Append Position) TextAppend 'NIL Text Append Position)
#{☑}#   (textFindIndex (Text Find) TextFindIndex 'I Text Find)
#{☑}#   (textToUpper (Text) TextToUpper 'S Text)
#{☑}#   (textToLower (Text) TextToLower 'S Text)
#{☑}#   (textToPascal (Text) TextToPascal 'S Text)
#{☑}#   (textToInteger (Text) TextToInteger 'I Text)

#   (void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color)
#   (void DrawPoint3D(Vector3 position, Color color)
#   (void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color)
#   (void DrawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color)
#   (void DrawTriangleStrip3D(Vector3 *points, int pointCount, Color color)
#   (void DrawCube(Vector3 position, float width, float height, float length, Color color)
#   (void DrawCubeV(Vector3 position, Vector3 size, Color color)
#   (void DrawCubeWires(Vector3 position, float width, float height, float length, Color color)
#   (void DrawCubeWiresV(Vector3 position, Vector3 size, Color color)
#   (void DrawCubeTexture(Texture2D texture, Vector3 position, float width, float height, float length, Color color)
#   (void DrawCubeTextureRec(Texture2D texture, Rectangle source, Vector3 position, float width, float height, float length, Color color)
#   (void DrawSphere(Vector3 centerPos, float radius, Color color)
#   (void DrawSphereEx(Vector3 centerPos, float radius, int rings, int slices, Color color)
#   (void DrawSphereWires(Vector3 centerPos, float radius, int rings, int slices, Color color)
#   (void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color)
#   (void DrawCylinderEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color)
#   (void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color)
#   (void DrawCylinderWiresEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color)
#   (void DrawPlane(Vector3 centerPos, Vector2 size, Color color)
#   (void DrawRay(Ray ray, Color color)
   (drawGrid (Slices Spacing) DrawGrid NIL Slices `(flt Spacing))

#   (Model LoadModel(const char *fileName)
#   (Model LoadModelFromMesh(Mesh mesh)
#   (void UnloadModel(Model model)
#   (void UnloadModelKeepMeshes(Model model)
#   (BoundingBox GetModelBoundingBox(Model model)

#   (void DrawModel(Model model, Vector3 position, float scale, Color tint)
#   (void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint)
#   (void DrawModelWires(Model model, Vector3 position, float scale, Color tint)
#   (void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint)
#   (void DrawBoundingBox(BoundingBox box, Color color)
#   (void DrawBillboard(Camera camera, Texture2D texture, Vector3 position, float size, Color tint)
#   (void DrawBillboardRec(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector2 size, Color tint)
#   (void DrawBillboardPro(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, float rotation, Color tint)


#   (void UploadMesh(Mesh *mesh, bool dynamic)
#   (void UpdateMeshBuffer(Mesh mesh, int index, void *data, int dataSize, int offset)
#   (void UnloadMesh(Mesh mesh)
#   (void DrawMesh(Mesh mesh, Material material, Matrix transform)
#   (void DrawMeshInstanced(Mesh mesh, Material material, Matrix *transforms, int instances)
#   (bool ExportMesh(Mesh mesh, const char *fileName)
#   (BoundingBox GetMeshBoundingBox(Mesh mesh)
#   (void GenMeshTangents(Mesh *mesh)
#   (void GenMeshBinormals(Mesh *mesh)

#   (Mesh GenMeshPoly(int sides, float radius)
#   (Mesh GenMeshPlane(float width, float length, int resX, int resZ)
#   (Mesh GenMeshCube(float width, float height, float length)
#   (Mesh GenMeshSphere(float radius, int rings, int slices)
#   (Mesh GenMeshHemiSphere(float radius, int rings, int slices)
#   (Mesh GenMeshCylinder(float radius, float height, int slices)
#   (Mesh GenMeshCone(float radius, float height, int slices)
#   (Mesh GenMeshTorus(float radius, float size, int radSeg, int sides)
#   (Mesh GenMeshKnot(float radius, float size, int radSeg, int sides)
#   (Mesh GenMeshHeightmap(Image heightmap, Vector3 size)
#   (Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize)

#   (Material *LoadMaterials(const char *fileName, int *materialCount)
#   (Material LoadMaterialDefault(void)
#   (void UnloadMaterial(Material material)
#   (void SetMaterialTexture(Material *material, int mapType, Texture2D texture)
#   (void SetModelMeshMaterial(Model *model, int meshId, int materialId)

#   (ModelAnimation *LoadModelAnimations(const char *fileName, unsigned int *animCount)
#   (void UpdateModelAnimation(Model model, ModelAnimation anim, int frame)
#   (void UnloadModelAnimation(ModelAnimation anim)
#   (void UnloadModelAnimations(ModelAnimation* animations, unsigned int count)
#   (bool IsModelAnimationValid(Model model, ModelAnimation anim)

#   (bool CheckCollisionSpheres(Vector3 center1, float radius1, Vector3 center2, float radius2)
#   (bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2)
#   (bool CheckCollisionBoxSphere(BoundingBox box, Vector3 center, float radius)
#   (RayCollision GetRayCollisionSphere(Ray ray, Vector3 center, float radius)
#   (RayCollision GetRayCollisionBox(Ray ray, BoundingBox box)
#   (RayCollision GetRayCollisionModel(Ray ray, Model model)
#   (RayCollision GetRayCollisionMesh(Ray ray, Mesh mesh, Matrix transform)
#   (RayCollision GetRayCollisionTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3)
#   (RayCollision GetRayCollisionQuad(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4)

   (initAudioDevice NIL InitAudioDevice)
   (closeAudioDevice NIL CloseAudioDevice)
   (isAudioDeviceReady NIL IsAudioDeviceReady `(bln))
   (setMasterVolume (Volume) SetMasterVolume NIL `(flt Volume))

#   (Wave LoadWave(const char *fileName)
#   (Wave LoadWaveFromMemory(const char *fileType, const unsigned char *fileData, int dataSize)
#   (Sound LoadSound(const char *fileName)
#   (Sound LoadSoundFromWave(Wave wave)
#   (void UpdateSound(Sound sound, const void *data, int sampleCount)
#   (void UnloadWave(Wave wave)
#   (void UnloadSound(Sound sound)
#   (bool ExportWave(Wave wave, const char *fileName)
#   (bool ExportWaveAsCode(Wave wave, const char *fileName)

#   (void PlaySound(Sound sound)
#   (void StopSound(Sound sound)
#   (void PauseSound(Sound sound)
#   (void ResumeSound(Sound sound)
#   (void PlaySoundMulti(Sound sound)
   (stopSoundMulti NIL StopSoundMulti)
   (getSoundsPlaying NIL GetSoundsPlaying 'I)
#   (bool IsSoundPlaying(Sound sound)
#   (void SetSoundVolume(Sound sound, float volume)
#   (void SetSoundPitch(Sound sound, float pitch)
#   (void WaveFormat(Wave *wave, int sampleRate, int sampleSize, int channels)
#   (Wave WaveCopy(Wave wave)
#   (void WaveCrop(Wave *wave, int initSample, int finalSample)
#   (float *LoadWaveSamples(Wave wave)
#   (void UnloadWaveSamples(float *samples)

#   (Music LoadMusicStream(const char *fileName)
#   (Music LoadMusicStreamFromMemory(const char *fileType, unsigned char *data, int dataSize)
#   (void UnloadMusicStream(Music music)
#   (void PlayMusicStream(Music music)
#   (bool IsMusicStreamPlaying(Music music)
#   (void UpdateMusicStream(Music music)
#   (void StopMusicStream(Music music)
#   (void PauseMusicStream(Music music)
#   (void ResumeMusicStream(Music music)
#   (void SeekMusicStream(Music music, float position)
#   (void SetMusicVolume(Music music, float volume)
#   (void SetMusicPitch(Music music, float pitch)
#   (float GetMusicTimeLength(Music music)
#   (float GetMusicTimePlayed(Music music)

#   (AudioStream LoadAudioStream(unsigned int sampleRate, unsigned int sampleSize, unsigned int channels)
#   (void UnloadAudioStream(AudioStream stream)
#   (void UpdateAudioStream(AudioStream stream, const void *data, int frameCount)
#   (bool IsAudioStreamProcessed(AudioStream stream)
#   (void PlayAudioStream(AudioStream stream)
#   (void PauseAudioStream(AudioStream stream)
#   (void ResumeAudioStream(AudioStream stream)
#   (bool IsAudioStreamPlaying(AudioStream stream)
#   (void StopAudioStream(AudioStream stream)
#   (void SetAudioStreamVolume(AudioStream stream, float volume)
#   (void SetAudioStreamPitch(AudioStream stream, float pitch)
   (setAudioStreamBufferSizeDefault (Size) SetAudioStreamBufferSizeDefault 'NIL Size)

)

#include <raylib.h>

/*-----------------------------

// Vector2, 2 components
typedef struct Vector2 {
    float x;                // Vector x component
    float y;                // Vector y component
} Vector2;

// Vector3, 3 components
typedef struct Vector3 {
    float x;                // Vector x component
    float y;                // Vector y component
    float z;                // Vector z component
} Vector3;

// Vector4, 4 components
typedef struct Vector4 {
    float x;                // Vector x component
    float y;                // Vector y component
    float z;                // Vector z component
    float w;                // Vector w component
} Vector4;

// Quaternion, 4 components (Vector4 alias)
typedef Vector4 Quaternion;

// Matrix, 4x4 components, column major, OpenGL style, right handed
typedef struct Matrix {
    float m0, m4, m8, m12;  // Matrix first row (4 components)
    float m1, m5, m9, m13;  // Matrix second row (4 components)
    float m2, m6, m10, m14; // Matrix third row (4 components)
    float m3, m7, m11, m15; // Matrix fourth row (4 components)
} Matrix;

// Color, 4 components, R8G8B8A8 (32bit)
typedef struct Color {
    unsigned char r;        // Color red value
    unsigned char g;        // Color green value
    unsigned char b;        // Color blue value
    unsigned char a;        // Color alpha value
} Color;

// Rectangle, 4 components
typedef struct Rectangle {
    float x;                // Rectangle top-left corner position x
    float y;                // Rectangle top-left corner position y
    float width;            // Rectangle width
    float height;           // Rectangle height
} Rectangle;

// Image, pixel data stored in CPU memory (RAM)
typedef struct Image {
    void *data;             // Image raw data
    int width;              // Image base width
    int height;             // Image base height
    int mipmaps;            // Mipmap levels, 1 by default
    int format;             // Data format (PixelFormat type)
} Image;

// Texture, tex data stored in GPU memory (VRAM)
typedef struct Texture {
    unsigned int id;        // OpenGL texture id
    int width;              // Texture base width
    int height;             // Texture base height
    int mipmaps;            // Mipmap levels, 1 by default
    int format;             // Data format (PixelFormat type)
} Texture;

// Texture2D, same as Texture
typedef Texture Texture2D;

// TextureCubemap, same as Texture
typedef Texture TextureCubemap;

// RenderTexture, fbo for texture rendering
typedef struct RenderTexture {
    unsigned int id;        // OpenGL framebuffer object id
    Texture texture;        // Color buffer attachment texture
    Texture depth;          // Depth buffer attachment texture
} RenderTexture;

// RenderTexture2D, same as RenderTexture
typedef RenderTexture RenderTexture2D;

// NPatchInfo, n-patch layout info
typedef struct NPatchInfo {
    Rectangle source;       // Texture source rectangle
    int left;               // Left border offset
    int top;                // Top border offset
    int right;              // Right border offset
    int bottom;             // Bottom border offset
    int layout;             // Layout of the n-patch: 3x3, 1x3 or 3x1
} NPatchInfo;

// GlyphInfo, font characters glyphs info
typedef struct GlyphInfo {
    int value;              // Character value (Unicode)
    int offsetX;            // Character offset X when drawing
    int offsetY;            // Character offset Y when drawing
    int advanceX;           // Character advance position X
    Image image;            // Character image data
} GlyphInfo;

// Font, font texture and GlyphInfo array data
typedef struct Font {
    int baseSize;           // Base size (default chars height)
    int glyphCount;         // Number of glyph characters
    int glyphPadding;       // Padding around the glyph characters
    Texture2D texture;      // Texture atlas containing the glyphs
    Rectangle *recs;        // Rectangles in texture for the glyphs
    GlyphInfo *glyphs;      // Glyphs info data
} Font;

// Camera, defines position/orientation in 3d space
typedef struct Camera3D {
    Vector3 position;       // Camera position
    Vector3 target;         // Camera target it looks-at
    Vector3 up;             // Camera up vector (rotation over its axis)
    float fovy;             // Camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in orthographic
    int projection;         // Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
} Camera3D;

typedef Camera3D Camera;    // Camera type fallback, defaults to Camera3D

// Camera2D, defines position/orientation in 2d space
typedef struct Camera2D {
    Vector2 offset;         // Camera offset (displacement from target)
    Vector2 target;         // Camera target (rotation and zoom origin)
    float rotation;         // Camera rotation in degrees
    float zoom;             // Camera zoom (scaling), should be 1.0f by default
} Camera2D;

// Mesh, vertex data and vao/vbo
typedef struct Mesh {
    int vertexCount;        // Number of vertices stored in arrays
    int triangleCount;      // Number of triangles stored (indexed or not)

    // Vertex attributes data
    float *vertices;        // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    float *texcoords;       // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    float *texcoords2;      // Vertex second texture coordinates (useful for lightmaps) (shader-location = 5)
    float *normals;         // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
    float *tangents;        // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
    unsigned char *colors;      // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    unsigned short *indices;    // Vertex indices (in case vertex data comes indexed)

    // Animation vertex data
    float *animVertices;    // Animated vertex positions (after bones transformations)
    float *animNormals;     // Animated normals (after bones transformations)
    unsigned char *boneIds; // Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning)
    float *boneWeights;     // Vertex bone weight, up to 4 bones influence by vertex (skinning)

    // OpenGL identifiers
    unsigned int vaoId;     // OpenGL Vertex Array Object id
    unsigned int *vboId;    // OpenGL Vertex Buffer Objects id (default vertex data)
} Mesh;

// Shader
typedef struct Shader {
    unsigned int id;        // Shader program id
    int *locs;              // Shader locations array (RL_MAX_SHADER_LOCATIONS)
} Shader;

// MaterialMap
typedef struct MaterialMap {
    Texture2D texture;      // Material map texture
    Color color;            // Material map color
    float value;            // Material map value
} MaterialMap;

// Material, includes shader and maps
typedef struct Material {
    Shader shader;          // Material shader
    MaterialMap *maps;      // Material maps array (MAX_MATERIAL_MAPS)
    float params[4];        // Material generic parameters (if required)
} Material;

// Transform, vectex transformation data
typedef struct Transform {
    Vector3 translation;    // Translation
    Quaternion rotation;    // Rotation
    Vector3 scale;          // Scale
} Transform;

// Bone, skeletal animation bone
typedef struct BoneInfo {
    char name[32];          // Bone name
    int parent;             // Bone parent
} BoneInfo;

// Model, meshes, materials and animation data
typedef struct Model {
    Matrix transform;       // Local transform matrix

    int meshCount;          // Number of meshes
    int materialCount;      // Number of materials
    Mesh *meshes;           // Meshes array
    Material *materials;    // Materials array
    int *meshMaterial;      // Mesh material number

    // Animation data
    int boneCount;          // Number of bones
    BoneInfo *bones;        // Bones information (skeleton)
    Transform *bindPose;    // Bones base transformation (pose)
} Model;

// ModelAnimation
typedef struct ModelAnimation {
    int boneCount;          // Number of bones
    int frameCount;         // Number of animation frames
    BoneInfo *bones;        // Bones information (skeleton)
    Transform **framePoses; // Poses array by frame
} ModelAnimation;

// Ray, ray for raycasting
typedef struct Ray {
    Vector3 position;       // Ray position (origin)
    Vector3 direction;      // Ray direction
} Ray;

// RayCollision, ray hit information
typedef struct RayCollision {
    bool hit;               // Did the ray hit something?
    float distance;         // Distance to nearest hit
    Vector3 point;          // Point of nearest hit
    Vector3 normal;         // Surface normal of hit
} RayCollision;

// BoundingBox
typedef struct BoundingBox {
    Vector3 min;            // Minimum vertex box-corner
    Vector3 max;            // Maximum vertex box-corner
} BoundingBox;

// Wave, audio wave data
typedef struct Wave {
    unsigned int frameCount;    // Total number of frames (considering channels)
    unsigned int sampleRate;    // Frequency (samples per second)
    unsigned int sampleSize;    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    unsigned int channels;      // Number of channels (1-mono, 2-stereo, ...)
    void *data;                 // Buffer data pointer
} Wave;

typedef struct rAudioBuffer rAudioBuffer;

// AudioStream, custom audio stream
typedef struct AudioStream {
    rAudioBuffer *buffer;       // Pointer to internal data used by the audio system

    unsigned int sampleRate;    // Frequency (samples per second)
    unsigned int sampleSize;    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    unsigned int channels;      // Number of channels (1-mono, 2-stereo, ...)
} AudioStream;

// Sound
typedef struct Sound {
    AudioStream stream;         // Audio stream
    unsigned int frameCount;    // Total number of frames (considering channels)
} Sound;

// Music, audio stream, anything longer than ~10 seconds should be streamed
typedef struct Music {
    AudioStream stream;         // Audio stream
    unsigned int frameCount;    // Total number of frames (considering channels)
    bool looping;               // Music looping enable

    int ctxType;                // Type of music context (audio filetype)
    void *ctxData;              // Audio context data, depends on type
} Music;

// VrDeviceInfo, Head-Mounted-Display device parameters
typedef struct VrDeviceInfo {
    int hResolution;                // Horizontal resolution in pixels
    int vResolution;                // Vertical resolution in pixels
    float hScreenSize;              // Horizontal size in meters
    float vScreenSize;              // Vertical size in meters
    float vScreenCenter;            // Screen center in meters
    float eyeToScreenDistance;      // Distance between eye and display in meters
    float lensSeparationDistance;   // Lens separation distance in meters
    float interpupillaryDistance;   // IPD (distance between pupils) in meters
    float lensDistortionValues[4];  // Lens distortion constant parameters
    float chromaAbCorrection[4];    // Chromatic aberration correction parameters
} VrDeviceInfo;

// VrStereoConfig, VR stereo rendering configuration for simulator
typedef struct VrStereoConfig {
    Matrix projection[2];           // VR projection matrices (per eye)
    Matrix viewOffset[2];           // VR view offset matrices (per eye)
    float leftLensCenter[2];        // VR left lens center
    float rightLensCenter[2];       // VR right lens center
    float leftScreenCenter[2];      // VR left screen center
    float rightScreenCenter[2];     // VR right screen center
    float scale[2];                 // VR distortion scale
    float scaleIn[2];               // VR distortion scale in
} VrStereoConfig;

-----------------------------*/

void PilDrawCircleV (float x, float y, float r, Color col){
    Vector2 v = {x,y};
    DrawCircleV(v,r,col);
}
void PilDrawRectangleV (float x1, float y1, float x2, float y2, Color col){
    Vector2 v1 = {x1,y1};
    Vector2 v2 = {x2,y2};
    DrawRectangleV(v1,v2,col);
}
Vector2 *PilGetMousePosition(void){
   Vector2 v1 = GetMousePosition();
   Vector2 *v2 = malloc(sizeof(Vector2));
   *v2 = v1;
   return v2;
}


/**/

(setq Lib (tmp "raylib-pil"))

(de getMousePosition NIL 
   (prog1
      (struct (native Lib '"PilGetMousePosition" 'P) (vec2))
      (%@ "free" NIL "PilGetMousePosition") ))

# There were only two functions using ... thus I didn't bother to modify clang.l
(de traceLog (LogLevel Text . @)
   (prog1
      (pass native "libraylib.so" '"TraceLog" NIL)
      (%@ "free" NIL "TraceLog")))

(de textFormat (Text . @)
   (prog1
      (pass native "libraylib.so" '"TextFormat" 'S)
      (%@ "free" NIL "TextFormat")))

(setq
   PI 3.14159265358979323846
   DEG2RAD (*/ PI 1.0 180.0)
   RAD2DEG (*/ 180.0 1.0 PI) 
   
   LIGHTGRAY (hex "ffc8c8c8")
   GRAY      (hex "ff828282")
   DARKGRAY  (hex "ff505050")
   YELLOW    (hex "ff00f9fd")
   GOLD      (hex "ff00cbff")
   ORANGE    (hex "ff00a1ff")
   PINK      (hex "ffc26dff")
   RED       (hex "ff3729e6")
   MAROON    (hex "ff3721be")
   GREEN     (hex "ff30e400")
   LIME      (hex "ff2f9e00")
   DARKGREEN (hex "ff2c7500")
   SKYBLUE   (hex "ffffbf66")
   BLUE      (hex "fff17900")
   DARKBLUE  (hex "ffac5200")
   PURPLE    (hex "ffff7ac8")
   VIOLET    (hex "ffbe3c87")
   DARKPURPL (hex "ff7e1f70")
   BEIGE     (hex "ff83b0d3")
   BROWN     (hex "ff4f6a7f")
   DARKBROWN (hex "ff2f3f4c")
   WHITE     (hex "ffffffff")
   BLACK     (hex "ff000000")
   BLANK     (hex "00000000")
   MAGENTA   (hex "ffff00ff")
   RAYWHITE  (hex "fff5f5f5")
   
   FLAG_VSYNC_HINT         (hex "00040")
   FLAG_FULLSCREEN_MODE    (hex "00002")
   FLAG_WINDOW_RESIZABLE   (hex "00004")
   FLAG_WINDOW_UNDECORATED (hex "00008")
   FLAG_WINDOW_HIDDEN      (hex "00080")
   FLAG_WINDOW_MINIMIZED   (hex "00200")
   FLAG_WINDOW_MAXIMIZED   (hex "00400")
   FLAG_WINDOW_UNFOCUSED   (hex "00800")
   FLAG_WINDOW_TOPMOST     (hex "01000")
   FLAG_WINDOW_ALWAYS_RUN  (hex "00100")
   FLAG_WINDOW_TRANSPARENT (hex "00010")
   FLAG_WINDOW_HIGHDPI     (hex "02000")
   FLAG_MSAA_4X_HINT       (hex "00020")
   FLAG_INTERLACED_HINT    (hex "10000")
   
   LOG_ALL     0
   LOG_TRACE   1
   LOG_DEBUG   2
   LOG_INFO    3
   LOG_WARNING 4
   LOG_ERROR   5
   LOG_FATAL   6
   LOG_NONE    7
   
   KEY_NULL            0
   KEY_APOSTROPHE      39
   KEY_COMMA           44
   KEY_MINUS           45
   KEY_PERIOD          46
   KEY_SLASH           47
   KEY_ZERO            48
   KEY_ONE             49
   KEY_TWO             50
   KEY_THREE           51
   KEY_FOUR            52
   KEY_FIVE            53
   KEY_SIX             54
   KEY_SEVEN           55
   KEY_EIGHT           56
   KEY_NINE            57
   KEY_SEMICOLON       59
   KEY_EQUAL           61
   KEY_A               65
   KEY_B               66
   KEY_C               67
   KEY_D               68
   KEY_E               69
   KEY_F               70
   KEY_G               71
   KEY_H               72
   KEY_I               73
   KEY_J               74
   KEY_K               75
   KEY_L               76
   KEY_M               77
   KEY_N               78
   KEY_O               79
   KEY_P               80
   KEY_Q               81
   KEY_R               82
   KEY_S               83
   KEY_T               84
   KEY_U               85
   KEY_V               86
   KEY_W               87
   KEY_X               88
   KEY_Y               89
   KEY_Z               90
   KEY_LEFT_BRACKET    91
   KEY_BACKSLASH       92
   KEY_RIGHT_BRACKET   93
   KEY_GRAVE           96
   KEY_SPACE           32
   KEY_ESCAPE          256
   KEY_ENTER           257
   KEY_TAB             258
   KEY_BACKSPACE       259
   KEY_INSERT          260
   KEY_DELETE          261
   KEY_RIGHT           262
   KEY_LEFT            263
   KEY_DOWN            264
   KEY_UP              265
   KEY_PAGE_UP         266
   KEY_PAGE_DOWN       267
   KEY_HOME            268
   KEY_END             269
   KEY_CAPS_LOCK       280
   KEY_SCROLL_LOCK     281
   KEY_NUM_LOCK        282
   KEY_PRINT_SCREEN    283
   KEY_PAUSE           284
   KEY_F1              290
   KEY_F2              291
   KEY_F3              292
   KEY_F4              293
   KEY_F5              294
   KEY_F6              295
   KEY_F7              296
   KEY_F8              297
   KEY_F9              298
   KEY_F10             299
   KEY_F11             300
   KEY_F12             301
   KEY_LEFT_SHIFT      340
   KEY_LEFT_CONTROL    341
   KEY_LEFT_ALT        342
   KEY_LEFT_SUPER      343
   KEY_RIGHT_SHIFT     344
   KEY_RIGHT_CONTROL   345
   KEY_RIGHT_ALT       346
   KEY_RIGHT_SUPER     347
   KEY_KB_MENU         348
   KEY_KP_0            320
   KEY_KP_1            321
   KEY_KP_2            322
   KEY_KP_3            323
   KEY_KP_4            324
   KEY_KP_5            325
   KEY_KP_6            326
   KEY_KP_7            327
   KEY_KP_8            328
   KEY_KP_9            329
   KEY_KP_DECIMAL      330
   KEY_KP_DIVIDE       331
   KEY_KP_MULTIPLY     332
   KEY_KP_SUBTRACT     333
   KEY_KP_ADD          334
   KEY_KP_ENTER        335
   KEY_KP_EQUAL        336
   KEY_BACK            4  
   KEY_MENU            82 
   KEY_VOLUME_UP       24 
   KEY_VOLUME_DOWN     25 
   
   MOUSE_BUTTON_LEFT    0 
   MOUSE_BUTTON_RIGHT   1 
   MOUSE_BUTTON_MIDDLE  2 
   MOUSE_BUTTON_SIDE    3 
   MOUSE_BUTTON_EXTRA   4 
   MOUSE_BUTTON_FORWARD 5 
   MOUSE_BUTTON_BACK    6 
   
   MOUSE_LEFT_BUTTON   MOUSE_BUTTON_LEFT
   MOUSE_RIGHT_BUTTON  MOUSE_BUTTON_RIGHT
   MOUSE_MIDDLE_BUTTON MOUSE_BUTTON_MIDDLE

   MOUSE_CURSOR_DEFAULT       0
   MOUSE_CURSOR_ARROW         1
   MOUSE_CURSOR_IBEAM         2
   MOUSE_CURSOR_CROSSHAIR     3
   MOUSE_CURSOR_POINTING_HAND 4
   MOUSE_CURSOR_RESIZE_EW     5
   MOUSE_CURSOR_RESIZE_NS     6
   MOUSE_CURSOR_RESIZE_NWSE   7
   MOUSE_CURSOR_RESIZE_NESW   8
   MOUSE_CURSOR_RESIZE_ALL    9
   MOUSE_CURSOR_NOT_ALLOWED   10

   GAMEPAD_BUTTON_UNKNOWN          0
   GAMEPAD_BUTTON_LEFT_FACE_UP     1
   GAMEPAD_BUTTON_LEFT_FACE_RIGHT  2
   GAMEPAD_BUTTON_LEFT_FACE_DOWN   3
   GAMEPAD_BUTTON_LEFT_FACE_LEFT   4
   GAMEPAD_BUTTON_RIGHT_FACE_UP    5
   GAMEPAD_BUTTON_RIGHT_FACE_RIGHT 6
   GAMEPAD_BUTTON_RIGHT_FACE_DOWN  7
   GAMEPAD_BUTTON_RIGHT_FACE_LEFT  8
   GAMEPAD_BUTTON_LEFT_TRIGGER_1   9
   GAMEPAD_BUTTON_LEFT_TRIGGER_2   10
   GAMEPAD_BUTTON_RIGHT_TRIGGER_1  11
   GAMEPAD_BUTTON_RIGHT_TRIGGER_2  12
   GAMEPAD_BUTTON_MIDDLE_LEFT      13
   GAMEPAD_BUTTON_MIDDLE           14
   GAMEPAD_BUTTON_MIDDLE_RIGHT     15
   GAMEPAD_BUTTON_LEFT_THUMB       16
   GAMEPAD_BUTTON_RIGHT_THUMB      17

   GAMEPAD_AXIS_LEFT_X        0
   GAMEPAD_AXIS_LEFT_Y        1
   GAMEPAD_AXIS_RIGHT_X       2
   GAMEPAD_AXIS_RIGHT_Y       3
   GAMEPAD_AXIS_LEFT_TRIGGER  4
   GAMEPAD_AXIS_RIGHT_TRIGGER 5
   
   MATERIAL_MAP_ALBEDO     0
   MATERIAL_MAP_METALNESS  1
   MATERIAL_MAP_NORMAL     2
   MATERIAL_MAP_ROUGHNESS  3
   MATERIAL_MAP_OCCLUSION  4
   MATERIAL_MAP_EMISSION   5
   MATERIAL_MAP_HEIGHT     6
   MATERIAL_MAP_CUBEMAP    7
   MATERIAL_MAP_IRRADIANCE 8
   MATERIAL_MAP_PREFILTER  9
   MATERIAL_MAP_BRDF       10

   MATERIAL_MAP_DIFFUSE    MATERIAL_MAP_ALBEDO
   MATERIAL_MAP_SPECULAR   MATERIAL_MAP_METALNESS

   SHADER_LOC_VERTEX_POSITION      0
   SHADER_LOC_VERTEX_TEXCOORD01    1
   SHADER_LOC_VERTEX_TEXCOORD02    2
   SHADER_LOC_VERTEX_NORMAL        3
   SHADER_LOC_VERTEX_TANGENT       4
   SHADER_LOC_VERTEX_COLOR         5
   SHADER_LOC_MATRIX_MVP           6
   SHADER_LOC_MATRIX_VIEW          7
   SHADER_LOC_MATRIX_PROJECTION    8
   SHADER_LOC_MATRIX_MODEL         9
   SHADER_LOC_MATRIX_NORMAL        10
   SHADER_LOC_VECTOR_VIEW          11
   SHADER_LOC_COLOR_DIFFUSE        12
   SHADER_LOC_COLOR_SPECULAR       13
   SHADER_LOC_COLOR_AMBIENT        14
   SHADER_LOC_MAP_ALBEDO           15
   SHADER_LOC_MAP_METALNESS        16
   SHADER_LOC_MAP_NORMAL           17
   SHADER_LOC_MAP_ROUGHNESS        18
   SHADER_LOC_MAP_OCCLUSION        19
   SHADER_LOC_MAP_EMISSION         20
   SHADER_LOC_MAP_HEIGHT           21
   SHADER_LOC_MAP_CUBEMAP          22
   SHADER_LOC_MAP_IRRADIANCE       23
   SHADER_LOC_MAP_PREFILTER        24
   SHADER_LOC_MAP_BRDF             25

   SHADER_LOC_MAP_DIFFUSE          SHADER_LOC_MAP_ALBEDO
   SHADER_LOC_MAP_SPECULAR         SHADER_LOC_MAP_METALNESS

   SHADER_UNIFORM_FLOAT     0
   SHADER_UNIFORM_VEC2      1
   SHADER_UNIFORM_VEC3      2
   SHADER_UNIFORM_VEC4      3
   SHADER_UNIFORM_INT       4
   SHADER_UNIFORM_IVEC2     5
   SHADER_UNIFORM_IVEC3     6
   SHADER_UNIFORM_IVEC4     7
   SHADER_UNIFORM_SAMPLER2D 8

   SHADER_ATTRIB_FLOAT 0
   SHADER_ATTRIB_VEC2  1
   SHADER_ATTRIB_VEC3  2
   SHADER_ATTRIB_VEC4  3

   PIXELFORMAT_UNCOMPRESSED_GRAYSCALE    1
   PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA   2
   PIXELFORMAT_UNCOMPRESSED_R5G6B5       3
   PIXELFORMAT_UNCOMPRESSED_R8G8B8       4
   PIXELFORMAT_UNCOMPRESSED_R5G5B5A1     5
   PIXELFORMAT_UNCOMPRESSED_R4G4B4A4     6
   PIXELFORMAT_UNCOMPRESSED_R8G8B8A8     7
   PIXELFORMAT_UNCOMPRESSED_R32          8
   PIXELFORMAT_UNCOMPRESSED_R32G32B32    9
   PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 10
   PIXELFORMAT_COMPRESSED_DXT1_RGB       12
   PIXELFORMAT_COMPRESSED_DXT1_RGBA      13
   PIXELFORMAT_COMPRESSED_DXT3_RGBA      14
   PIXELFORMAT_COMPRESSED_DXT5_RGBA      15
   PIXELFORMAT_COMPRESSED_ETC1_RGB       16
   PIXELFORMAT_COMPRESSED_ETC2_RGB       17
   PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA  18
   PIXELFORMAT_COMPRESSED_PVRT_RGB       19
   PIXELFORMAT_COMPRESSED_PVRT_RGBA      20
   PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA  21
   PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA  22

   TEXTURE_FILTER_POINT           0
   TEXTURE_FILTER_BILINEAR        1
   TEXTURE_FILTER_TRILINEAR       2
   TEXTURE_FILTER_ANISOTROPIC_4X  3
   TEXTURE_FILTER_ANISOTROPIC_8X  4
   TEXTURE_FILTER_ANISOTROPIC_16X 5

   TEXTURE_WRAP_REPEAT        0
   TEXTURE_WRAP_CLAMP         1
   TEXTURE_WRAP_MIRROR_REPEAT 2
   TEXTURE_WRAP_MIRROR_CLAMP  3

   CUBEMAP_LAYOUT_AUTO_DETECT         0
   CUBEMAP_LAYOUT_LINE_VERTICAL       1
   CUBEMAP_LAYOUT_LINE_HORIZONTAL     2
   CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR 3
   CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE 4
   CUBEMAP_LAYOUT_PANORAMA            5

   FONT_DEFAULT 0
   FONT_BITMAP  1
   FONT_SDF     2

   BLEND_ALPHA           0
   BLEND_ADDITIVE        1
   BLEND_MULTIPLIED      2
   BLEND_ADD_COLORS      3
   BLEND_SUBTRACT_COLORS 4
   BLEND_CUSTOM          5

   GESTURE_NONE        0
   GESTURE_TAP         1
   GESTURE_DOUBLETAP   2
   GESTURE_HOLD        4
   GESTURE_DRAG        8
   GESTURE_SWIPE_RIGHT 16
   GESTURE_SWIPE_LEFT  32
   GESTURE_SWIPE_UP    64
   GESTURE_SWIPE_DOWN  128
   GESTURE_PINCH_IN    256
   GESTURE_PINCH_OUT   512

   CAMERA_CUSTOM       0
   CAMERA_FREE         1
   CAMERA_ORBITAL      2
   CAMERA_FIRST_PERSON 3
   CAMERA_THIRD_PERSON 4

   CAMERA_PERSPECTIVE  0
   CAMERA_ORTHOGRAPHIC 1

   NPATCH_NINE_PATCH             0
   NPATCH_THREE_PATCH_VERTICAL   1
   NPATCH_THREE_PATCH_HORIZONTAL 2

)

