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
import 'package:tradix/app/dependency_injection/third_party.dart' as _i7;
import 'package:tradix/app/routes/router.dart' as _i3;
import 'package:tradix/business_logic/blocs/coins/coins_bloc.dart' as _i6;
import 'package:tradix/data/data_providers/coins_provider.dart' as _i4;
import 'package:tradix/data/repositories/coins_repository.dart' as _i5;

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
    gh.factory<_i4.CoinsProvider>(() => _i4.CoinsProvider());
    gh.factory<_i5.CoinsRepository>(
        () => _i5.CoinsRepository(gh<_i4.CoinsProvider>()));
    gh.factory<_i6.CoinsBloc>(() => _i6.CoinsBloc(gh<_i5.CoinsRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}