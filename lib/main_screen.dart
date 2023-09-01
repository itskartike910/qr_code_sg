import 'package:flutter/material.dart';
import 'package:qr_code_sg/QRgenrator/qr_generator_input_screen.dart';
import 'package:qr_code_sg/QRscanner/qr_scanner.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text("QR Code Generator and Scanner",style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold , fontSize: 22)),
            shadowColor:const Color.fromARGB(255, 249, 23, 23),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            // color: const Color.fromARGB(255, 171, 246, 250),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QRInputScreen()))
                    .then((result) {}),
                child: const Text("QR Code Generator",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0)),),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: ()=> Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const QRScannerPage()))
                .then((result) {}),
              child: const Text("QR Code Scanner",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0)),)
              )
              ],
            ),
          ),
        );

  }
}
