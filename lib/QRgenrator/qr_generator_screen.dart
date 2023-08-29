import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const QRCodeGeneratorApp());
}

class QRCodeGeneratorApp extends StatelessWidget {
  const QRCodeGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QR Code Generator'),
        ),
        body: const QRCodeGenerator(),
      ),
    );
  }
}

class QRCodeGenerator extends StatefulWidget {
  const QRCodeGenerator({super.key});

  @override
  _QRCodeGeneratorState createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  final TextEditingController _textController = TextEditingController();
  String _qrCodeData = "";
  Uint8List qrImage = Uint8List(8);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'Enter String or Link',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _qrCodeData = _textController.text;
              });
            },
            child: const Text('Generate QR Code'),
          ),
          const SizedBox(height: 16),
          // _qrCodeData.isNotEmpty
          //     ? Container(
          //         child: Image.memory(
          //           QrImage(
          //             data: _qrCodeData,
          //             version: QrVersions.auto,
          //             size: 200.0,
          //           ), // Convert QR code to bytes
          //         ),
          //       )
          //     : Container(),

          //  Container(
          //   height: 30,width: 30,
          //   child:  QrImage(
          //     data: _qrCodeData,
          //     version: QrVersions.auto,
          //     size: 200.0,
          //   ),
          //  ): Container(),
        ],
      ),
    );
  }
}
