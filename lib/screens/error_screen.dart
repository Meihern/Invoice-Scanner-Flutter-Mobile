import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_invoice_scanner/blocs/main/main_bloc.dart';

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
                    child: Text(
                      "error : $error",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Tap to try again ",
                      style: TextStyle(
                          color: Colors.black.withOpacity(.7),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
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
                          color: Colors.white,
                          size: 40,
                        ),
                        label: Text("Back", style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500,fontSize: 30),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.grey.withOpacity(.7),
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ]),
          ),
        );

  }
}
