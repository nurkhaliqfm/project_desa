part of 'home_navigation_bloc.dart';

abstract class HomeNavigationEvent {}

class ProfilHomeScreen extends HomeNavigationEvent {
  final int index;
  ProfilHomeScreen({this.index = 0});
}

class LayananSuratHomeScreen extends HomeNavigationEvent {
  final int index;
  LayananSuratHomeScreen({this.index = 1});
}

class KemajuanDesaHomeScreen extends HomeNavigationEvent {
  final int index;
  KemajuanDesaHomeScreen({this.index = 2});
}

class NoTeleponPentingHomeScreen extends HomeNavigationEvent {
  final int index;
  NoTeleponPentingHomeScreen({this.index = 3});
}

class PenggunaanAnggaranHomeScreen extends HomeNavigationEvent {
  final int index;
  PenggunaanAnggaranHomeScreen({this.index = 4});
}

class CekDptHomeScreen extends HomeNavigationEvent {
  final int index;
  CekDptHomeScreen({this.index = 5});
}

class CekBansosHomeScreen extends HomeNavigationEvent {
  final int index;
  CekBansosHomeScreen({this.index = 6});
}

class CekBantuanUmkmHomeScreen extends HomeNavigationEvent {
  final int index;
  CekBantuanUmkmHomeScreen({this.index = 7});
}
