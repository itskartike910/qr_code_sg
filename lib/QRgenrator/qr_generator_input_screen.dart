import 'package:flutter/material.dart';
import 'package:qr_code_sg/QRgenrator/qr_generator_screen.dart';

// class QRGenInputScreen extends StatelessWidget {
//   const QRGenInputScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: QRInputScreen(),
//     );
//   }
// }

class QRInputScreen extends StatefulWidget {
  const QRInputScreen({super.key});

  @override
  QRInputScreenState createState() => QRInputScreenState();
}

class QRInputScreenState extends State<QRInputScreen> {
  String inputText = "";

  void _storeInput(String text) {
    setState(() {
      inputText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 22)),
        shadowColor: const Color.fromARGB(255, 249, 23, 23),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 171, 246, 250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: (text) {
                _storeInput(text);
              },
              decoration: const InputDecoration(
                labelText: 'Enter Text or URL',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QRCodeGenScreen(
                              inputText: inputText,
                            ))).then((result) {});
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromARGB(255, 54, 114, 255)),
                fixedSize: MaterialStatePropertyAll<Size>(Size(150, 40)),
              ),
              child: const Text(
                'Generate QR',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            inputText == ""
                ? const SizedBox(
                    height: 0,
                    width: 0,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
