// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:barcode_scanner/scanbot_barcode_sdk.dart';
import 'package:flutter/material.dart';
import 'package:kasirppta/view/main_navigation.dart';

import 'package:path_provider/path_provider.dart';

bool shouldInitWithEncryption = false;

const BARCODE_SDK_LICENSE_KEY = "";

void main() => runApp(const MyApp());

Future<void> _initScanbotSdk() async {
  Directory? storageDirectory;
  if (Platform.isAndroid) {
    storageDirectory = await getExternalStorageDirectory();
  }
  if (Platform.isIOS) {
    storageDirectory = await getApplicationDocumentsDirectory();
  }

  EncryptionParameters? encryptionParameters;
  if (shouldInitWithEncryption) {
    encryptionParameters = EncryptionParameters(
        password: "password", mode: FileEncryptionMode.AES256);
  }
  var config = ScanbotSdkConfig(
      licenseKey: BARCODE_SDK_LICENSE_KEY,
      encryptionParameters: encryptionParameters,
      loggingEnabled: true,
      // Consider disabling logging in production builds for security and performance reasons.
      storageBaseDirectory:
          "${storageDirectory?.path}/custom-barcode-sdk-storage");

  try {
    config.useCameraX = true;
    await ScanbotBarcodeSdk.initScanbotSdk(config);
  } catch (e) {
    print(e);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  _MyAppState createState() {
    _initScanbotSdk();
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: MyApp.appTitle,
      home: MainNavigation(title: MyApp.appTitle),
    );
  }
}
