import 'package:raylib_dart/raylib_dart.dart';
import 'package:raylib_dart/src/enums/font_type.dart';
import 'package:raylib_dart/src/library.dart';
import 'package:raylib_dart/src/utils/glyph_info.dart' as glyph_info;
import 'package:raylib_dart/src/utils/integer.dart' as integer;
import 'package:raylib_dart/src/utils/string.dart' as string;

/// Get the default Font.
Font getFontDefault() {
  return Font.fromRef(library.GetFontDefault());
}

/// Load font from file into GPU memory (VRAM).
Font loadFont(String fileName) {
  return Font.fromRef(library.LoadFont(string.toNativeString(fileName)));
}

/// Load font from file with extended parameters.
Font loadFontEx(
  String fileName,
  int fontSize,
  List<int> fontChars,
  int glyphCount,
) {
  return Font.fromRef(
    library.LoadFontEx(
      string.toNativeString(fileName),
      fontSize,
      integer.toIntPointer(fontChars),
      glyphCount,
    ),
  );
}

/// Load font from Image (XNA style).
Font loadFontFromImage(Image image, Color key, int firstChar) {
  return Font.fromRef(
    library.LoadFontFromImage(
      image.ref,
      key.ref,
      firstChar,
    ),
  );
}

/// Load font from memory buffer, fileType refers to extension: i.e. '.ttf'.
Font loadFontFromMemory(
  String fileType,
  String fileData,
  int dataSize,
  int fontSize,
  List<int> fontChars,
  int glyphCount,
) {
  return Font.fromRef(
    library.LoadFontFromMemory(
      string.toNativeString(fileType),
      string.toNativeUnsignedChar(fileData),
      dataSize,
      fontSize,
      integer.toIntPointer(fontChars),
      glyphCount,
    ),
  );
}

/// Load font data for further use.
GlyphInfo loadFontData(
  String fileData,
  int dataSize,
  int fontSize,
  List<int> fontChars,
  int glyphCount,
  FontType type,
) {
  return GlyphInfo.fromPointer(
    library.LoadFontData(
      string.toNativeUnsignedChar(fileData),
      dataSize,
      fontSize,
      integer.toIntPointer(fontChars),
      glyphCount,
      fontTypeToNative(type),
    ),
  );
}

// TODO(wolfen): this, fix recs
// /// Generate image font atlas using chars info.
// Image genImageFontAtlas(
//   List<GlyphInfo> chars,
//   List<List<Rectangle>> recs,
//   int glyphCount,
//   int fontSize,
//   int padding,
//   int packMethod,
// ) {
//   return Image.fromRef(
//     library.GenImageFontAtlas(
//       glyph_info.toPointer(chars),
//       recs,
//       glyphCount,
//       fontSize,
//       padding,
//       packMethod,
//     ),
//   );
// }

/// Unload font chars info data (RAM).
void unloadFontData(List<GlyphInfo> chars, int glyphCount) {
  return library.UnloadFontData(glyph_info.toPointer(chars), glyphCount);
}

/// Unload Font from GPU memory (VRAM).
void unloadFont(Font font) {
  return library.UnloadFont(font.ref);
}
