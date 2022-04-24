part of 'navigation.dart';

abstract class RoutesFactory {
  Route<dynamic> createHomePageRoute();
  Route<dynamic> createDetailsPageRoute(NavigationArguments movie);
}
