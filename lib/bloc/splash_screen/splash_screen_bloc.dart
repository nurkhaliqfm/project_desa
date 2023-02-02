import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenEvent>((event, emit) async {
      if (event is NavigateToHomeScreenEvent) {
        emit(SplashScreenLoading());
        await Future.delayed(const Duration(seconds: 4));
        emit(SplashScreenLoaded());
      }
    });
  }
}
