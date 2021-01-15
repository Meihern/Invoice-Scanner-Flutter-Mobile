import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_invoice_scanner/models/client_model.dart';
import 'package:mobile_app_invoice_scanner/shared/constants.dart';

import '../blocs/main/main_bloc.dart';

class HomeDetailsScreen extends StatelessWidget {
  final ClientModel clientModel;

  const HomeDetailsScreen({Key key, @required this.clientModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Full Name',
                        style: TextStyle(
                            fontSize: 14,
                            color: themeLightColor,
                            letterSpacing: 2),
                      ),
                      Text(
                        "${clientModel.name}",
                        style: TextStyle(
                            fontSize: 22,
                            color: themeGreyIshColor,
                            letterSpacing: 2
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Address',
                        style: TextStyle(
                            fontSize: 14,
                            color: themeLightColor,
                            letterSpacing: 2),
                      ),
                      Text(
                        "${clientModel.adresse}",
                        style: TextStyle(
                          fontSize: 18,
                          color: themeGreyIshColor,
                        ),
                      ),
                      SizedBox(
                        height: 150,
                      ),
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
                    ]
                )
            )
        )
    );
  }
}
