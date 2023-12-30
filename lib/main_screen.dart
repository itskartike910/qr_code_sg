import 'package:flutter/material.dart';
import 'package:qr_code_sg/QRgenrator/qr_generator_input_screen.dart';
import 'package:qr_code_sg/QRscanner/qr_scanner.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Generator and Scanner",
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 360,
              height: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/qrcodesgnormal.png"),
                // image: AssetImage("assets/qrcodesgtransparent.png"),
                fit: BoxFit.fill,
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              width: 360,
              height: 120,
              child: Text(
                "Welcome to the QR code Scanner and Generator App. This app can generate QR code based on the input given, the input string may be some text or URL. This app also scans the QR code and displays the URL or text and make it copied to clipboard.",
                style: TextStyle(
                  color: Color.fromARGB(255, 147, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QRInputScreen()))
                  .then((result) {}),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromARGB(255, 54, 114, 255)),
                fixedSize: MaterialStatePropertyAll<Size>(Size(250, 50)),
              ),
              child: const Text(
                "QR Code Generator",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QRScannerPage()))
                    .then((result) {}),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 54, 114, 255)),
                  fixedSize: MaterialStatePropertyAll<Size>(Size(250, 50)),
                ),
                child: const Text(
                  "QR Code Scanner",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ))
          ],
        ),
      ),
    );
  }
}
