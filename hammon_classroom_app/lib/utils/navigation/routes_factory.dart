part of 'navigation.dart';

abstract class RoutesFactory {
  Route<dynamic> createHomePageRoute();
  Route<dynamic> createStudentDetailsPageRoute(Map<dynamic, dynamic> navArgs);
  Route<dynamic> createSubjectDetailsPageRoute(Map<dynamic, dynamic> navArgs);
  Route<dynamic> createClassroomDetailsPageRoute(Map<dynamic, dynamic> navArgs);
  // Route<dynamic> createDetailsPageRoute(NavigationArguments navArgs);
}
