import 'dart:async';
import 'package:flutter/services.dart';
import 'package:telpo_package/model/row.dart';

export 'package:telpo_package/model/row.dart';

/// Flutter plugin for the Telpo thermal printer.
///
/// Communicates with the native Android side via a [MethodChannel].
/// Obtain an instance with `const FlutterTelpo()` and call [connect]
/// before printing.
class FlutterTelpo {
  /// Creates a constant [FlutterTelpo] instance.
  const FlutterTelpo();

  static const MethodChannel _platform = MethodChannel(
    'com.efikas.app/printer',
  );

  /// Returns `true` when the printer is connected and ready.
  Future<bool?> isConnected() {
    return _platform.invokeMethod<bool>('isConnected');
  }

  /// Prints a list of [Printable] rows in order.
  ///
  /// Accepted types: [PrintRow], [PrintQRCode], [WalkPaper],
  /// [PrintAssetImage].
  ///
  /// ```dart
  /// await printer.print([
  ///   PrintRow(text: 'Hello', fontSize: 1, position: 1),
  ///   PrintQRCode(text: 'https://example.com', width: 200, height: 200),
  ///   WalkPaper(step: 3),
  /// ]);
  /// ```
  Future<void> print(List<Printable> rows) async {
    final printableRows = rows.map((row) => row.toJson()).toList();

    await _platform.invokeMethod<void>('printDocument', {
      'details': printableRows,
    });
  }

  /// Feeds one blank line through the printer.
  Future<void> printNewLine() async {
    await _platform.invokeMethod<void>('printNewLine');
  }

  /// Prints [text] with the given [fontSize] and [position].
  ///
  /// - [fontSize]: 0 (small) → 3 (large)
  /// - [position]: 0 = left, 1 = centre, 2 = right
  Future<void> printCustom(String text, int fontSize, int position) async {
    await _platform.invokeMethod<void>('printCustom', {
      'text': text,
      'fontSize': fontSize,
      'position': position,
    });
  }

  /// Prints a QR code encoding [text].
  ///
  /// [position] is currently accepted by the API but not forwarded to the
  /// native layer — pass 0 for left, 1 for centre, 2 for right when the
  /// native side is updated to support it.
  Future<void> printQRCode(
    String text,
    int height,
    int width,
    int position,
  ) async {
    await _platform.invokeMethod<void>('printQRCode', {
      'text': text,
      'height': height,
      'width': width,
    });
  }

  /// Advances the paper by [length] steps.
  Future<void> paperWalk(int length) async {
    await _platform.invokeMethod<void>('walkPaper', {'length': length});
  }

  /// Disconnects from the printer.
  Future<void> disconnect() async {
    await _platform.invokeMethod<void>('disconnect');
  }

  /// Connects to the printer.
  ///
  /// Call this once before any print operations and check [isConnected]
  /// to confirm the printer is ready.
  Future<void> connect() async {
    await _platform.invokeMethod<void>('connect');
  }
}
