import 'dart:io';

import 'package:citraland/data/model/content_model.dart';
import 'package:citraland/utill/styles.dart';
import 'package:citraland/view/base/primary_button.dart';
import 'package:citraland/view/screens/content/content_screen.dart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentReference _contentCollection;

  Barcode result;
  QRViewController controller;
  ContentModel _contentModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      if (controller != null) controller.pauseCamera();
    } else if (Platform.isIOS) {
      if (controller != null) controller.resumeCamera();
    }
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen(
      (scanData) async {
        controller.stopCamera();
        print('dokumen id >> ${scanData.code}');

        _contentCollection =
            _firestore.collection('content').doc('${scanData.code}');
        _firestore.runTransaction((transaction) async {
          DocumentSnapshot _content = await transaction.get(_contentCollection);
          if (_content.exists) {
            _contentModel = new ContentModel.fromJson(_content.data());
            print(_content.data());
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContentScreen(
                  content: _contentModel,
                ),
              ),
            ).then(
              (value) => controller.resumeCamera(),
            );
          } else {
            return showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Terjadi Kesalahan',
                          style: poppinsMedium.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Kode tidak terdaftar.',
                          style: poppinsRegular.copyWith(fontSize: 14.sp),
                        ),
                        SizedBox(height: 25),
                        PrimaryButton(
                            label: 'Tutup',
                            onTap: () {
                              controller.resumeCamera();
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ),
                );
              },
            );
          }
        });

        // if (scanData.code == '123456') {
        //   await Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => ContentScreen(),
        //     ),
        //   ).then(
        //     (value) => controller.resumeCamera(),
        //   );
        // } else {
        //   return showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return Dialog(
        //         child: Container(
        //           padding: EdgeInsets.all(20),
        //           child: Column(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               Text(
        //                 'Terjadi Kesalahan',
        //                 style: poppinsMedium.copyWith(
        //                   fontSize: 16.sp,
        //                   fontWeight: FontWeight.w600,
        //                 ),
        //               ),
        //               SizedBox(height: 10),
        //               Text(
        //                 'Kode tidak terdaftar.',
        //                 style: poppinsRegular.copyWith(fontSize: 14.sp),
        //               ),
        //               SizedBox(height: 25),
        //               PrimaryButton(
        //                   label: 'Tutup',
        //                   onTap: () {
        //                     controller.resumeCamera();
        //                     Navigator.pop(context);
        //                   })
        //             ],
        //           ),
        //         ),
        //       );
        //     },
        //   );
        // }
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Theme.of(context).primaryColor,
          size: 50,
        ),
      ),
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
