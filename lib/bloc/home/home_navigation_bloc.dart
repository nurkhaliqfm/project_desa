import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_navigation_event.dart';
part 'home_navigation_state.dart';

class HomeNavigationBloc
    extends Bloc<HomeNavigationEvent, HomeNavigationState> {
  HomeNavigationBloc() : super(const HomeNavigationInitial()) {
    on<ProfilHomeScreen>((event, emit) {
      emit(HomeNavigationLoaded(event.index));
    });
    on<LayananSuratHomeScreen>((event, emit) {
      emit(HomeNavigationLoaded(event.index));
    });
    on<KemajuanDesaHomeScreen>((event, emit) {
      emit(HomeNavigationLoaded(event.index));
    });
    on<NoTeleponPentingHomeScreen>((event, emit) {
      emit(HomeNavigationLoaded(event.index));
    });
    on<PenggunaanAnggaranHomeScreen>((event, emit) {
      emit(HomeNavigationLoaded(event.index));
    });
    on<CekDptHomeScreen>((event, emit) {
      emit(HomeNavigationLoaded(event.index));
    });
    on<CekBansosHomeScreen>((event, emit) {
      emit(HomeNavigationLoaded(event.index));
    });
    on<CekBantuanUmkmHomeScreen>((event, emit) {
      emit(HomeNavigationLoaded(event.index));
    });
  }
}
