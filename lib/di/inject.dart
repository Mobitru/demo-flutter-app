import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_demo_app/di/inject.config.dart';

@InjectableInit()
Future<void> configureDependencies() async => GetIt.instance.init();
