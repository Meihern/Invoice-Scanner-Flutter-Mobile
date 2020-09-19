import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_invoice_scanner/blocs/main/main_bloc.dart';

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Ink(
        child: RaisedButton.icon(
          onPressed: () => showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context){
              return AlertDialog(
                title: Text("Invoice Scanner"),
                content: Text("Choose a source option"),
                actions: [
                  FlatButton(
                    child: Text("Camera"),
                    onPressed: () => BlocProvider.of<MainBloc>(context).add(MainAppSendImageEvent(imageSource: "Camera")),
                  ),
                  FlatButton(
                    child: Text("Gallery"),
                    onPressed: () => BlocProvider.of<MainBloc>(context).add(MainAppSendImageEvent(imageSource: "Gallery")),
                  )
                ],
              );
            }
          ),
          icon: Icon(
            Icons.camera_alt,
            color: Colors.black.withOpacity(.7),
          ),
          label: Text("Upload Image ", style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600,fontSize: 20),),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: Colors.grey.withOpacity(.7),
        ),
      ),
      alignment: Alignment.center,
    );
  }
}

