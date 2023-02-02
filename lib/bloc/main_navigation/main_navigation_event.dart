part of 'main_navigation_bloc.dart';

abstract class MainNavigationEvent {}

class LetterScreenEvent extends MainNavigationEvent {
  final int index;
  LetterScreenEvent({this.index = -1});
}

class HomeScreenEvent extends MainNavigationEvent {
  final int index;
  HomeScreenEvent({this.index = 0});
}

class ShopScreenEvent extends MainNavigationEvent {
  final int index;
  ShopScreenEvent({this.index = 1});
}

class NewsScreenEvent extends MainNavigationEvent {
  final int index;
  NewsScreenEvent({this.index = 2});
}

class AccountScreenEvent extends MainNavigationEvent {
  final int index;
  AccountScreenEvent({this.index = 3});
}
