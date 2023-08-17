// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_demo_app/repository/biometric_auth_repository.dart'
    as _i3;
import 'package:flutter_demo_app/repository/orders_repository.dart' as _i4;
import 'package:flutter_demo_app/repository/products_repository.dart' as _i6;
import 'package:flutter_demo_app/repository/users_repository.dart' as _i8;
import 'package:flutter_demo_app/state/auth_state.dart' as _i9;
import 'package:flutter_demo_app/state/cart_state.dart' as _i10;
import 'package:flutter_demo_app/state/orders_state.dart' as _i5;
import 'package:flutter_demo_app/state/products_state.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await gh.factoryAsync<_i3.BioAuthRepository>(
      () => _i3.BioAuthRepository.create(),
      preResolve: true,
    );
    await gh.factoryAsync<_i4.OrdersRepository>(
      () => _i4.OrdersRepository.init(),
      preResolve: true,
    );
    gh.factory<_i5.OrdersState>(
        () => _i5.OrdersState(gh<_i4.OrdersRepository>()));
    await gh.factoryAsync<_i6.ProductsRepository>(
      () => _i6.ProductsRepository.init(),
      preResolve: true,
    );
    gh.factory<_i7.ProductsState>(
        () => _i7.ProductsState(gh<_i6.ProductsRepository>()));
    await gh.factoryAsync<_i8.UsersRepository>(
      () => _i8.UsersRepository.create(),
      preResolve: true,
    );
    gh.factory<_i9.AuthState>(() => _i9.AuthState(
          gh<_i8.UsersRepository>(),
          gh<_i3.BioAuthRepository>(),
        ));
    gh.factory<_i10.CartState>(() => _i10.CartState(gh<_i8.UsersRepository>()));
    return this;
  }
}
