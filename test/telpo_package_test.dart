import 'package:telpo_package/model/row.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('PrintRow', () {
    test('fromJson and toJson', () {
      final json = {
        'type': 'text',
        'text': 'Hello',
        'fontSize': 1,
        'position': 0,
      };
      final row = PrintRow.fromJson(json);
      expect(row.text, 'Hello');
      expect(row.fontSize, 1);
      expect(row.position, 0);
      expect(row.toJson(), json);
    });
  });

  group('WalkPaper', () {
    test('fromJson and toJson', () {
      final json = {'type': 'walkPaper', 'step': 10};
      final walk = WalkPaper.fromJson(json);
      expect(walk.step, 10);
      expect(walk.toJson(), json);
    });
  });

  group('PrintQRCode', () {
    test('fromJson and toJson', () {
      final json = {
        'type': 'qrcode',
        'text': '123',
        'width': 100,
        'height': 100,
        'position': 1,
      };
      final qr = PrintQRCode.fromJson(json);
      expect(qr.text, '123');
      expect(qr.width, 100);
      expect(qr.height, 100);
      expect(qr.position, 1);
      expect(qr.toJson(), json);
    });
  });

  group('PrintAssetImage', () {
    test('fromJson and toJson', () {
      final json = {
        'type': 'image',
        'image_path': 'assets/test.png',
        'width': 50,
        'height': 50,
        'position': 1,
      };
      final image = PrintAssetImage.fromJson(json);
      expect(image.imagePath, 'assets/test.png');
      expect(image.width, 50);
      expect(image.height, 50);
      expect(image.position, 1);
      expect(image.toJson(), json);
    });
  });
}
