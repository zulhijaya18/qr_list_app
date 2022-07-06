import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_qr_list/src/features/item/presentation/item_add_qr/item_add_qr_controller.dart';
import 'package:flutter_qr_list/src/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AddQRWidget extends ConsumerStatefulWidget {
  const AddQRWidget({Key? key}) : super(key: key);

  @override
  AddQRWidgetState createState() => AddQRWidgetState();
}

class AddQRWidgetState extends ConsumerState<AddQRWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  ItemAddQRController? con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con = ref.read(itemAddQRController);
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      log(scanData.code.toString());
      con?.setItemCode(scanData.code.toString());
      goRouter.go('/add_name');
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(itemAddQRController);
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          // cutOutSize: scanArea,
        ),
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      ),
    );
  }
}
