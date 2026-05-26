/// Mixin for all printable row types.
///
/// Every row type must implement [toJson] so the printer plugin
/// can serialise it without resorting to dynamic dispatch.
mixin Printable {
  /// Converts this instance to a JSON representation.
  Map<String, dynamic> toJson();
}

/// A class representing a row of text for printing.
class PrintRow with Printable {
  /// Creates a [PrintRow] instance.
  const PrintRow({this.text, this.fontSize, this.position});

  /// Creates a [PrintRow] instance from JSON.
  factory PrintRow.fromJson(Map<String, dynamic> json) {
    return PrintRow(
      text: json['text'] as String?,
      fontSize: json['fontSize'] is int ? json['fontSize'] as int : null,
      position: json['position'] is int ? json['position'] as int : null,
    );
  }

  /// The text content.
  final String? text;

  /// The font size to use.
  final int? fontSize;

  /// The position for text alignment.
  final int? position;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'text',
      'text': text,
      'fontSize': fontSize,
      'position': position,
    };
  }
}

/// A class representing a paper walk command.
class WalkPaper with Printable {
  /// Creates a [WalkPaper] instance.
  const WalkPaper({this.step});

  /// Creates a [WalkPaper] instance from JSON.
  factory WalkPaper.fromJson(Map<String, dynamic> json) {
    return WalkPaper(
      step: json['step'] is int ? json['step'] as int : null,
    );
  }

  /// The number of steps to walk.
  final int? step;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'walkPaper',
      'step': step,
    };
  }
}

/// A class representing a QR code for printing.
class PrintQRCode with Printable {
  /// Creates a [PrintQRCode] instance.
  const PrintQRCode({this.text, this.width, this.height, this.position});

  /// Creates a [PrintQRCode] instance from JSON.
  factory PrintQRCode.fromJson(Map<String, dynamic> json) {
    return PrintQRCode(
      text: json['text'] as String?,
      width: json['width'] is int ? json['width'] as int : null,
      height: json['height'] is int ? json['height'] as int : null,
      position: json['position'] is int ? json['position'] as int : null,
    );
  }

  /// The text content for the QR code.
  final String? text;

  /// The width of the QR code.
  final int? width;

  /// The height of the QR code.
  final int? height;

  /// The position for alignment.
  final int? position;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'qrcode',
      'text': text,
      'width': width,
      'height': height,
      'position': position,
    };
  }
}

/// A class representing an image to be printed from assets.
class PrintAssetImage with Printable {
  /// Creates a [PrintAssetImage] instance.
  const PrintAssetImage({
    this.imagePath,
    this.width,
    this.height,
    this.position,
  });

  /// Creates a [PrintAssetImage] instance from JSON.
  factory PrintAssetImage.fromJson(Map<String, dynamic> json) {
    return PrintAssetImage(
      imagePath: json['image_path'] as String?,
      width: json['width'] is int ? json['width'] as int : null,
      height: json['height'] is int ? json['height'] as int : null,
      position: json['position'] is int ? json['position'] as int : null,
    );
  }

  /// The path to the asset image.
  final String? imagePath;

  /// The width of the image.
  final int? width;

  /// The height of the image.
  final int? height;

  /// The position for alignment.
  final int? position;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'image',
      'image_path': imagePath,
      'width': width,
      'height': height,
      'position': position,
    };
  }
}
