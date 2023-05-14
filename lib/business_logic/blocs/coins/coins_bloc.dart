import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:tradix/data/models/coins/Coins.dart';
import 'package:tradix/data/repositories/coins_repository.dart';

part 'coins_event.dart';
part 'coins_state.dart';

@injectable
class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  final CoinsRepository _coinsRepository;

  CoinsBloc(this._coinsRepository) : super(CoinsInitial()) {
    on<CoinsFetchEvent>((event, emit) async {
      emit(const CoinsLoading());

      var coins = await _coinsRepository.getCoins();

      if (coins == null) {
        emit(const CoinsError(errorMessage: 'Error fetching coins'));
      } else {
        emit(CoinsLoaded(coins: coins));
      }
    });
  }
}
