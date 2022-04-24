part of 'navigation.dart';

Route<dynamic>? Function(RouteSettings settings) onGenerateAppRoute(
    RoutesFactory routesFactory) {
  return (RouteSettings settings) {
    switch (settings.name) {
      case _homePageRouteName:
        return routesFactory.createHomePageRoute();

      case _detailsRouteName:
        final args = settings.arguments as NavigationArguments;
        return routesFactory.createDetailsPageRoute(args);

      default:
        return routesFactory.createHomePageRoute();
    }
  };
}
