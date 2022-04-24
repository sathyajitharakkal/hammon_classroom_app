import 'package:api/api.dart';
import 'package:get_it/get_it.dart';
import 'package:hammon_classroom_app/utils/navigation/navigation.dart';

class ServiceLocator {
  final GetIt _registry;
  final String baseUrl;

  ServiceLocator({required this.baseUrl}) : _registry = GetIt.asNewInstance();

  NavigationService get navigationService => _registry.get<NavigationService>();

  Api get api => _registry.get<Api>();

  void config() {
    _registry.registerLazySingleton(
      () => NavigationService(),
    );

    // _registry.registerLazySingleton(
    //   () => Api.debuggable(baseUrl: baseUrl),
    // );

    _registry.registerLazySingleton(
      () => Api.create(baseUrl: baseUrl),
    );
  }

  void reset() {
    _registry.resetLazySingleton(instance: navigationService);
    _registry.resetLazySingleton(instance: api);
  }
}
