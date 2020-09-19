import 'package:flutter/material.dart';
import 'package:mobile_app_invoice_scanner/widgets/camera_button.dart';

class HomeInitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: CameraButton(),
      ),
    );
  }
}
