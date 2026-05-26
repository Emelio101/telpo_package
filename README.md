# telpo_package

A Flutter plugin for Telpo TPS320 POS devices, handling communication with the built-in thermal printer.

## Installation

Add this package to your `pubspec.yaml` file:

```yaml
dependencies:
  telpo_package:
    git:
      url: https://github.com/Emelio101/telpo_package.git
```

## Features

- **Printer Support:** Communicates with the built-in thermal printer on Telpo TPS320 POS devices.
- **Printing Elements:**
  - `PrintRow`: Print lines of text with customizable font size and alignment.
  - `PrintQRCode`: Print QR codes with specified dimensions and position.
  - `PrintAssetImage`: Print images stored in your project assets.
  - `WalkPaper`: Feed the printer paper by a specific number of steps.

## Usage

```dart
import 'package:telpo_package/flutter_telpo.dart';

final printer = const FlutterTelpo();

// Connect to the printer
printer.connect();

// Print a simple receipt
await printer.print([
  const PrintRow(text: 'TELPO RECEIPT', fontSize: 1, position: 1),
  const PrintRow(text: '----------------', fontSize: 0, position: 1),
  const PrintRow(text: 'Item: Electric Unit', fontSize: 0, position: 0),
  const WalkPaper(step: 10),
]);

// Disconnect when finished
printer.disconnect();
```
