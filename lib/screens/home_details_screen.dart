import 'package:flutter/material.dart';
import 'package:mobile_app_invoice_scanner/models/client_model.dart';

class HomeDetailsScreen extends StatelessWidget {
  final ClientModel clientModel;

  const HomeDetailsScreen({Key key,@required this.clientModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Text("Full Name : ${clientModel.name}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                Text("Address : ${clientModel.adresse}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
              ],
            ),
          ),
        ),
      );
  }
}
