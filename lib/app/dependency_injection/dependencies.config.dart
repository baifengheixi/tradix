// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tradix/app/dependency_injection/third_party.dart' as _i11;
import 'package:tradix/app/routes/router.dart' as _i3;
import 'package:tradix/business_logic/blocs/bottom_nav/bottom_nav_bloc.dart'
    as _i4;
import 'package:tradix/business_logic/cubit/user_message/user_message_cubit.dart'
    as _i9;
import 'package:tradix/data/data_providers/coins_provider.dart' as _i6;
import 'package:tradix/data/repositories/chat_openai_repository.dart' as _i5;
import 'package:tradix/data/repositories/coins_repository.dart' as _i7;
import 'package:tradix/presentation/screens/chat/bloc/ai_message/ai_message_bloc.dart'
    as _i10;
import 'package:tradix/presentation/screens/chat/cubit/history_message/history_message_cubit.dart'
    as _i8;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.AppRouter>(() => registerModule.appRouter);
    gh.factory<_i4.BottomNavBloc>(() => _i4.BottomNavBloc());
    gh.factory<_i5.ChatOpenAIRepository>(() => _i5.ChatOpenAIRepository());
    gh.factory<_i6.CoinsProvider>(() => _i6.CoinsProvider());
    gh.factory<_i7.CoinsRepository>(
        () => _i7.CoinsRepository(gh<_i6.CoinsProvider>()));
    gh.factory<_i8.HistoryMessageCubit>(() => _i8.HistoryMessageCubit());
    gh.factory<_i9.UserMessageCubit>(() => _i9.UserMessageCubit());
    gh.factory<_i10.AIMessageBloc>(
        () => _i10.AIMessageBloc(gh<_i5.ChatOpenAIRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
