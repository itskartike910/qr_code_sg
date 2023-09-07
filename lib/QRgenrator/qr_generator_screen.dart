import 'package:custom_qr_generator/custom_qr_generator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QRCodeGenScreen extends StatefulWidget {
  String inputText;
  QRCodeGenScreen({super.key, required this.inputText});

  @override
  State<StatefulWidget> createState() => QRCodeGenScreenState();
}

// ignore: must_be_immutable
class QRCodeGenScreenState extends State<QRCodeGenScreen> {
  String txt = "";

  @override
  void initState() {
    super.initState();
    txt = widget.inputText;
    if (txt.isEmpty) {
      txt = "Made With ❤️ by Kartik Kumar";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold , fontSize: 22)),
        shadowColor:const Color.fromARGB(255, 249, 23, 23),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromARGB(255, 171, 246, 250),
          child: Center(
            child: CustomPaint(
              painter: QrPainter(
                  data: txt, //input data or url
                  options: const QrOptions(
                      shapes: QrShapes(
                          darkPixel: QrPixelShapeRoundCorners(cornerFraction: .5),
                          frame: QrFrameShapeRoundCorners(cornerFraction: .25),
                          ball: QrBallShapeRoundCorners(cornerFraction: .25)),
                      colors: QrColors(
                          dark: QrColorLinearGradient(colors: [
                            Color.fromARGB(255, 255, 0, 0),
                            Color.fromARGB(255, 0, 0, 255)
                          ], orientation: GradientOrientation.leftDiagonal),
                          ball: QrColorRadialGradient(colors: [
                            Color.fromARGB(255, 255, 0, 0),
                            Color.fromARGB(255, 0, 0, 255)
                          ], ),
                          background:
                              QrColorSolid(Color.fromARGB(255, 255, 242, 217)),
                          frame: QrColorLinearGradient(colors: [
                            Color.fromARGB(255, 255, 0, 0),
                            Color.fromARGB(255, 0, 0, 255)
                          ], orientation: GradientOrientation.rightDiagonal)
                          ))),
              size: const Size(350, 350),
            ),
          ),
        ),
      ),
    );
  }
}
