import 'package:flutter/material.dart';
import 'package:hammon_classroom_app/presentation/home/home_route_builder.dart';
import 'package:hammon_classroom_app/utils/navigation/navigation.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';

class AppRoutesFactory extends RoutesFactory {
  final ServiceLocator _serviceLocator;
  AppRoutesFactory(this._serviceLocator);

  @override
  Route<dynamic> createHomePageRoute() {
    return MaterialPageRoute(builder: HomeRouteBuilder(_serviceLocator));
  }

  @override
  Route createDetailsPageRoute(NavigationArguments movie) {
    // TODO: implement createDetailsPageRoute
    throw UnimplementedError();
  }

}
