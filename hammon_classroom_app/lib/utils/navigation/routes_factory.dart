part of 'navigation.dart';

abstract class RoutesFactory {
  Route<dynamic> createHomePageRoute();
  Route<dynamic> createStudentDetailsPageRoute();
  Route<dynamic> createSubjectDetailsPageRoute();
  Route<dynamic> createClassroomDetailsPageRoute();
  // Route<dynamic> createDetailsPageRoute(NavigationArguments navArgs);
}
