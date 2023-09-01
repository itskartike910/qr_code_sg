import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<StatefulWidget> createState() => QRScannerPageState();
}

class QRScannerPageState extends State<QRScannerPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('QR Code Scanner',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold , fontSize: 22)),
        shadowColor:const Color.fromARGB(255, 249, 23, 23),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 100,),
          Center(
            child: Container(height: 350,width: 350,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const Center(child:  Text("Scan QR",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
          const Icon(Icons.copy),
          if (result != null)
            // const Center(child:  Text("Your Scanned Data",style: TextStyle(fontSize: 10),)),
            Center(
              child: Text(
                  result!.code.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
