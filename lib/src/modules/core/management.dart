import 'package:raylib_dart/raylib_dart.dart';
import 'package:raylib_dart/src/library.dart';
import 'package:raylib_dart/src/utils/string.dart' as string;

/// Load shader from files and bind default locations.
Shader loadShader(String vsFileName, String fsFileName) {
  return Shader.fromRef(
    library.LoadShader(
      string.toNativeString(vsFileName),
      string.toNativeString(fsFileName),
    ),
  );
}

/// Load shader from code strings and bind default locations.
Shader loadShaderFromMemory(String vsCode, String fsCode) {
  return Shader.fromRef(
    library.LoadShaderFromMemory(
      string.toNativeString(vsCode),
      string.toNativeString(fsCode),
    ),
  );
}

/// Get shader uniform location.
int getShaderLocation(Shader shader, String uniformName) {
  return library.GetShaderLocation(shader.ref, string.toNativeString(uniformName));
}

/// Get shader attribute location.
int getShaderLocationAttrib(Shader shader, String attribName) {
  return library.GetShaderLocationAttrib(
    shader.ref,
    string.toNativeString(attribName),
  );
}

// TODO(wolfen): this
// /// Set shader uniform value.
// void SetShaderValue(
//   Shader shader,
//   int locIndex,
//   const void *value,
//   int uniformType,
// ) {}

// TODO(wolfen): this
// /// Set shader uniform value vector.
// void SetShaderValueV(
//   Shader shader,
//   int locIndex,
//   const void *value,
//   int uniformType,
//   int count,
// ) {}

/// Set shader uniform value (matrix 4x4).
void setShaderValueMatrix(Shader shader, int locIndex, Matrix mat) {
  return library.SetShaderValueMatrix(shader.ref, locIndex, mat.ref);
}

/// Set shader uniform value for texture (sampler2d).
void setShaderValueTexture(Shader shader, int locIndex, Texture2D texture) {
  return library.SetShaderValueTexture(shader.ref, locIndex, texture.ref);
}

/// Unload shader from GPU memory (VRAM).
void unloadShader(Shader shader) {
  return library.UnloadShader(shader.ref);
}
