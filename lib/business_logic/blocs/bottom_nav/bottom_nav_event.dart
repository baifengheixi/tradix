part of 'bottom_nav_bloc.dart';

@immutable
abstract class BottomNavEvent {
  final int index;

  const BottomNavEvent({
    this.index = 0,
  });
}

class BottomNavUpdateIndexEvent extends BottomNavEvent {
  const BottomNavUpdateIndexEvent({required int index}) : super(index: index);
}
