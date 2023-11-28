import 'package:raylib_dart/raylib_dart.dart';
import 'package:raylib_dart/src/generated_bindings.dart' as raylib;
import 'package:raylib_dart/src/utils/native_type.dart';

/// BoundingBox.
class BoundingBox extends NativeClass<raylib.BoundingBox> {
  /// BoundingBox.
  BoundingBox.fromRef(raylib.BoundingBox ref) : super.fromRef(ref);

  /// Minimum vertex box-corner.
  Vector3 get min => Vector3.fromRef(ref.min);

  /// Maximum vertex box-corner.
  Vector3 get max => Vector3.fromRef(ref.max);
}
