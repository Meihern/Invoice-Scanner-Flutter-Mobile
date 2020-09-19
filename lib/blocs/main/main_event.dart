part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainAppStartedEvent extends MainEvent{
  @override
  List<Object> get props => [];

}

class MainAppSendImageEvent extends MainEvent{

  final String imageSource;

  MainAppSendImageEvent({@required this.imageSource});

  @override
  List<Object> get props => [imageSource];

}
