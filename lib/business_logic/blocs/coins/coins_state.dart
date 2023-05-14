part of 'coins_bloc.dart';

@immutable
abstract class CoinsState extends Equatable {
  final Coins? coins;
  final String? errorMessage;
  final bool isLoading;

  const CoinsState({
    this.coins,
    this.errorMessage,
    this.isLoading = false,
  });
}

class CoinsInitial extends CoinsState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CoinsLoading extends CoinsState {
  const CoinsLoading() : super(isLoading: true);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class CoinsLoaded extends CoinsState {
  const CoinsLoaded({required Coins coins}) : super(coins: coins, isLoading: false);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class CoinsError extends CoinsState {
  const CoinsError({required String errorMessage}) : super(errorMessage: errorMessage, isLoading: false);

  @override
  List<Object?> get props => throw UnimplementedError();
}
