import 'package:flutter/material.dart';
import 'package:qr_code_sg/QRgenrator/qr_generator_screen.dart';
import 'package:qr_code_sg/QRscanner/qr_scanner.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Qr Code Generator and Scanner",style: TextStyle(color: Color.fromARGB(255, 17, 45, 255),fontWeight: FontWeight.w400,),),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Color.fromARGB(255, 94, 236, 243),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QRCodeGenerator()))
                    .then((result) {}),
                child: const Text("QR Code Generator")
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: ()=> Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => QRScannerPage()))
                .then((result) {}),
              child: const Text("QR Code Scanner")
              )
              ],
            ),
          ),
        );

  }
}
