import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:raylib_dart/raylib_dart.dart';
import 'package:raylib_dart/src/generated_bindings.dart' as raylib;

/// Turn a list of [GlyphInfo] into a pointer.
Pointer<raylib.GlyphInfo> toPointer(List<GlyphInfo> glyphs) {
  final pointer = malloc<raylib.GlyphInfo>(
    sizeOf<raylib.GlyphInfo>() * glyphs.length,
  );
  for (var i = 0; i < glyphs.length; i++) {
    pointer.elementAt(i).ref.value = glyphs[i].value;
    pointer.elementAt(i).ref.offsetX = glyphs[i].offsetX;
    pointer.elementAt(i).ref.offsetY = glyphs[i].offsetY;
    pointer.elementAt(i).ref.advanceX = glyphs[i].advanceX;
    pointer.elementAt(i).ref.image = glyphs[i].image.ref;
  }
  return pointer;
}
