part of 'coins_bloc.dart';

@immutable
abstract class CoinsEvent extends Equatable {}

class CoinsFetchEvent extends CoinsEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
