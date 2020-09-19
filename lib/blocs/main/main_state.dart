part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainInitialLoadingState extends MainState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class MainInitialLoadedState extends MainState {
  @override
  List<Object> get props => [];
}

class MainResponseState extends MainState{

  final ClientModel client;

  MainResponseState({@required this.client});

  @override
  List<Object> get props => [client];

}

class MainErrorState extends MainState{

  final String error;

  MainErrorState({@required this.error});

  @override
  List<Object> get props => [error];

}
