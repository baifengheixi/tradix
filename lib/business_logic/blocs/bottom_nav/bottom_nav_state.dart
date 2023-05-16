part of 'bottom_nav_bloc.dart';

@immutable
abstract class BottomNavState {
  final int index;

  const BottomNavState({
    this.index = 0,
  });
}

class BottomNavInitial extends BottomNavState {}

class BottomNavUpdateIndex extends BottomNavState {
  const BottomNavUpdateIndex({required int index}) : super(index: index);
}
