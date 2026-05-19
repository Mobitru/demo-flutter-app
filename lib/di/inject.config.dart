// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_demo_app/repository/biometric_auth_repository.dart'
    as _i22;
import 'package:flutter_demo_app/repository/orders_repository.dart' as _i794;
import 'package:flutter_demo_app/repository/products_repository.dart' as _i666;
import 'package:flutter_demo_app/repository/users_repository.dart' as _i483;
import 'package:flutter_demo_app/state/auth_state.dart' as _i548;
import 'package:flutter_demo_app/state/cart_state.dart' as _i437;
import 'package:flutter_demo_app/state/orders_state.dart' as _i525;
import 'package:flutter_demo_app/state/products_state.dart' as _i64;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    await gh.factoryAsync<_i22.BioAuthRepository>(
      () => _i22.BioAuthRepository.create(),
      preResolve: true,
    );
    await gh.factoryAsync<_i794.OrdersRepository>(
      () => _i794.OrdersRepository.init(),
      preResolve: true,
    );
    await gh.factoryAsync<_i666.ProductsRepository>(
      () => _i666.ProductsRepository.init(),
      preResolve: true,
    );
    await gh.factoryAsync<_i483.UsersRepository>(
      () => _i483.UsersRepository.create(),
      preResolve: true,
    );
    gh.factory<_i64.ProductsState>(
      () => _i64.ProductsState(gh<_i666.ProductsRepository>()),
    );
    gh.factory<_i548.AuthState>(
      () => _i548.AuthState(
        gh<_i483.UsersRepository>(),
        gh<_i22.BioAuthRepository>(),
      ),
    );
    gh.factory<_i437.CartState>(
      () => _i437.CartState(gh<_i483.UsersRepository>()),
    );
    gh.factory<_i525.OrdersState>(
      () => _i525.OrdersState(gh<_i794.OrdersRepository>()),
    );
    return this;
  }
}
