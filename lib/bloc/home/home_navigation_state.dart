part of 'home_navigation_bloc.dart';

abstract class HomeNavigationState {
  final int index;

  const HomeNavigationState(this.index);
}

class HomeNavigationInitial extends HomeNavigationState {
  const HomeNavigationInitial() : super(0);
}

class HomeNavigationLoaded extends HomeNavigationState {
  const HomeNavigationLoaded(int index) : super(index);
}
