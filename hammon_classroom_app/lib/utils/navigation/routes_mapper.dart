part of 'navigation.dart';

Route<dynamic>? Function(RouteSettings settings) onGenerateAppRoute(
    RoutesFactory routesFactory) {
  return (RouteSettings settings) {
    switch (settings.name) {
      case _homePageRouteName:
        return routesFactory.createHomePageRoute();
      case _studentDetailsPageRouteName: 
        final args = settings.arguments as Map<dynamic, dynamic>;
        return routesFactory.createStudentDetailsPageRoute(args);
      case _subjectDetailsPageRouteName: 
        final args = settings.arguments as Map<dynamic, dynamic>;
        return routesFactory.createSubjectDetailsPageRoute(args);
      case _classroomDetailsPageRouteName: 
        final args = settings.arguments as Map<dynamic, dynamic>;
        return routesFactory.createClassroomDetailsPageRoute(args);

      // case _detailsRouteName:
      //   final args = settings.arguments as NavigationArguments;
      //   return routesFactory.createDetailsPageRoute(args);

      default:
        return routesFactory.createHomePageRoute();
    }
  };
}
