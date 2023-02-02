import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_navigation_event.dart';
part 'main_navigation_state.dart';

class MainNavigationBloc
    extends Bloc<MainNavigationEvent, MainNavigationState> {
  MainNavigationBloc() : super(const MainNavigationInitial()) {
    on<LetterScreenEvent>((event, emit) {
      emit(MainNavigationLoaded(event.index));
    });
    on<HomeScreenEvent>((event, emit) {
      emit(MainNavigationLoaded(event.index));
    });
    on<ShopScreenEvent>((event, emit) {
      emit(MainNavigationLoaded(event.index));
    });
    on<NewsScreenEvent>((event, emit) {
      emit(MainNavigationLoaded(event.index));
    });
    on<AccountScreenEvent>((event, emit) {
      emit(MainNavigationLoaded(event.index));
    });
  }
}
