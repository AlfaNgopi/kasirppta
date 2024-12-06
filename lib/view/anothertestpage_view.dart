// ignore_for_file: prefer_const_constructors

import 'package:barcode_scanner/scanbot_barcode_sdk.dart';
import 'package:flutter/material.dart';
import 'package:kasirppta/view/barcode_scanner_widget.dart';

import 'barcode_preview_widget.dart';

class AnothertestpageView extends StatefulWidget {
  const AnothertestpageView({super.key});

  @override
  State<AnothertestpageView> createState() => _AnothertestpageViewState();
}

class _AnothertestpageViewState extends State<AnothertestpageView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(onPressed: _startBarcodeCustomUIScanner, child: Text(
          'Scan Barcode'
        ),),
      
    );
  }

  Future<void> _startBarcodeCustomUIScanner() async {
    var result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const BarcodeScannerWidget()),
    );
    if (result is BarcodeScanningResult) {
      await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => BarcodesResultPreviewWidget(result)),
      );
    }
  }
}