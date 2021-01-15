import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_invoice_scanner/blocs/main/main_bloc.dart';
import 'package:mobile_app_invoice_scanner/providers/invoice_scanner_provider.dart';
import 'package:mobile_app_invoice_scanner/screens/error_screen.dart';
import 'package:mobile_app_invoice_scanner/screens/home_details_screen.dart';
import 'package:mobile_app_invoice_scanner/screens/home_screen.dart';

void main() {
  runApp(
    BlocProvider<MainBloc>(
      create: (context) => MainBloc(invoiceScannerProvider: InvoiceScannerProvider())..add(MainAppStartedEvent()),
      child: MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invoice Scanner App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Invoice Scanner"),
        ),
        body: BlocBuilder<MainBloc, MainState>(
          builder: (BuildContext context, MainState state) {
            if (state is MainInitialLoadedState) {
              return HomeInitialScreen();
            }

            if (state is MainErrorState){
              return ErrorScreen(error: state.error,);
            }

            if (state is MainResponseState){
              return HomeDetailsScreen(clientModel: state.client,);
            }

            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          }
        ),
      )
    );
  }
}


