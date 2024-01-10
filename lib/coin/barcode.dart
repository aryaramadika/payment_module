import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/home.dart';
import 'package:payment_module/payment/style/styles.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:scan/scan.dart';
import 'package:images_picker/images_picker.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  String? barcodeData;
  QRViewController? controller;
  bool isListening = false;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  String qrcode = 'Unknown';

  Future<void> _scanImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print('file ffile ${pickedFile.path}');
      try {
        String? str = await Scan.parse(pickedFile.path);
        print('str ffile $str');

        if (str != null) {
          setState(() {
            barcodeData = str;
            // widget.handleScannedData(str);
          });
          Navigator.pushNamed(context, "/");
        }
      } catch (e) {
        print('Error decoding QR code: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (barcodeData != null) {
      Navigator.pushNamed(context, "/");
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example, we set the dimensions based on the screen size
    var scanArea = (MediaQuery.of(context).size.width < 500 ||
            MediaQuery.of(context).size.height < 500)
        ? 300.0
        : 300.0;

    return Stack(
      children: <Widget>[
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            cutOutBottomOffset: 10,
            borderColor: Colors.white,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea,
          ),
          onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
        ),
        SafeArea(
            child: Container(
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: whiteColor,
              weight: 2,
            ),
          ),
        )),
        Positioned(
          bottom: 72,
          right: 20,
          child: GestureDetector(
            onTap: _scanImage,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              margin: const EdgeInsets.all(16),
              // height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 1, color: whiteColor),
              ),
              child: Center(
                child: Text(
                  '${barcodeData ?? "Upload"}',
                  style: TextStyle(color: whiteColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      print("scan data from scanner: $scanData");
      print("scan data fromat from scanner: ${scanData.format}");
      print("scan data raw from scanner: ${scanData.rawBytes}");

      print("code");
      print(scanData.code);
      setState(() {
        result = scanData;
        barcodeData = scanData.code;
        // widget.handleScannedData(scanData.code);
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  Future<void> _decodeQRCode(XFile imageFile) async {
    print("Upload path: ${imageFile.path}");

    try {
      String? uploadResult = await Scan.parse(imageFile.path);
      print("Upload result: $uploadResult");

      // If you need to perform additional actions based on the upload result, you can do it here.
    } catch (e) {
      print('Error decoding QR code: $e');
    }
  }
  // Future<void> _decodeQRCode(XFile imageFile) async {

  // try {
  //   // Read the image file as bytes
  //   List<int> bytes = await File(imageFile.path).readAsBytes();

  //   // Decode the QR code from the image
  //   img.Image? image = img.decodeImage(Uint8List.fromList(bytes));

  //   if (controller != null) {
  //     // Get a single result from the stream
  //     result = await controller!.scannedDataStream.first;

  //     if (result != null) {
  //       // Handle the decoded QR code result (e.g., display it, process it, etc.)
  //       print('Decoded QR code: $result');
  //     }
  //   }
  // } catch (e) {
  //   print('Error decoding QR code: $e');
  // }
  // }
  // Future<void> _decodeQRCode(XFile imageFile) async {
  //   print("running decoded qr");
  //   print(
  //     "running image file $imageFile",
  //   );

  //   try {
  //     // Read the image file as bytes
  //     List<int> bytes = await File(imageFile.path).readAsBytes();

  //     // Decode the QR code from the image
  //     img.Image? image = img.decodeImage(Uint8List.fromList(bytes));

  //     print("imager $image");
  //     print("contol $controller");

  //     if (controller != null && image != null) {
  //       // Create a subscription to listen to the stream only once
  //       late StreamSubscription<Barcode> subscription;
  //       result = await controller!.scannedDataStream.first;
  //     }
  //   } catch (e) {
  //     print('Error decoding QR code: $e');
  //   }
  // }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
