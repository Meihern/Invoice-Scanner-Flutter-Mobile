import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile_app_invoice_scanner/models/client_model.dart';
import 'package:mobile_app_invoice_scanner/providers/invoice_scanner_provider.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  final InvoiceScannerProvider invoiceScannerProvider;

  MainBloc({@required this.invoiceScannerProvider}) : super(MainInitialLoadingState());

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is MainAppStartedEvent){
      yield MainInitialLoadingState();
      yield MainInitialLoadedState();
    }
    if (event is MainAppSendImageEvent){
      yield MainInitialLoadingState();
      try{
        File imageFile = await invoiceScannerProvider.pickAndPrepareImage(event.imageSource);
        ClientModel clientModel = await invoiceScannerProvider.recognizeClientDetailFromImage(imageFile);
        yield MainResponseState(client: clientModel);
      }catch(error){
        yield MainErrorState(error: error.toString());
      }
    }
  }
}
