import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_invoice_scanner/blocs/main/main_bloc.dart';
import 'package:mobile_app_invoice_scanner/shared/constants.dart';

class ErrorScreen extends StatelessWidget {
  final String error;

  const ErrorScreen({Key key,@required this.error}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/error.png",
                    height: size.height * 0.5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: Text(
                        "error : $error",
                        style: TextStyle(
                            color: themeLightColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: Ink(
                      child: RaisedButton.icon(
                        onPressed:() => BlocProvider.of<MainBloc>(context)..add(MainAppStartedEvent()),
                        icon: Icon(
                          Icons.arrow_back,
                          color: themeGreyIshColor,
                          size: 20,
                        ),
                        label: Text("GO BACK", style: TextStyle(
                            color: themeGreyIshColor, fontWeight: FontWeight.w500,fontSize: 20),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: themeDarkColor,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ]),
          ),
        );

  }
}
