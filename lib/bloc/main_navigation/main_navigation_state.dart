part of 'main_navigation_bloc.dart';

abstract class MainNavigationState {
  final int index;

  const MainNavigationState(this.index);
}

class MainNavigationInitial extends MainNavigationState {
  const MainNavigationInitial() : super(0);
}

class MainNavigationLoaded extends MainNavigationState {
  const MainNavigationLoaded(int index) : super(index);
}
