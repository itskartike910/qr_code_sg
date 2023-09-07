import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<StatefulWidget> createState() => QRScannerPageState();
}

class QRScannerPageState extends State<QRScannerPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void copyToClipboard(String textToCopy, BuildContext context) {
    Clipboard.setData(ClipboardData(text: textToCopy)).then((presult) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Copied to clipboard'),
        ),
      );
    });
  }

  int i = 1;
  Future<void> vibratePhone() async {
    if (await Vibrate.canVibrate) {
      if (i > 0) {
        Vibrate.feedback(FeedbackType.heavy);
        i--;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 22)),
        shadowColor: const Color.fromARGB(255, 249, 23, 23),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 171, 246, 250),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                height: 350,
                width: 350,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: onQRViewCreated,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
                child: Text(
              "Scan QR",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
            if (result != null)
              Container(
                height: 100,
                width: 300,
                color: const Color.fromARGB(255, 135, 243, 255),
                child: Center(
                  child: Text(
                    " Your QR data:\n${result!.code}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            const SizedBox(height: 8,),
            if (result != null)
              const Text("Copy to Clipboard ↙",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            if (result != null)
              InkWell(
                  onTap: () {
                    copyToClipboard(result!.code.toString(), context);
                  },
                  child: const Icon(Icons.copy)),
          ],
        ),
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        vibratePhone();
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
