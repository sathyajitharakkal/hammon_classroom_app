import 'package:flutter/material.dart';
import 'package:hammon_classroom_app/presentation/details_classroom/classroom_details_route_builder.dart';
import 'package:hammon_classroom_app/presentation/details_student/student_details_route_builder.dart';
import 'package:hammon_classroom_app/presentation/details_subject/subject_details_route_builder.dart';
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
  Route createClassroomDetailsPageRoute(Map<dynamic, dynamic> navigationArguments) {
    return MaterialPageRoute(builder: ClassroomDetailsRouteBuilder(_serviceLocator, navigationArguments));
  }

  @override
  Route createStudentDetailsPageRoute(Map<dynamic, dynamic> navigationArguments) {
    return MaterialPageRoute(builder: StudentDetailsRouteBuilder(_serviceLocator, navigationArguments));
  }

  @override
  Route createSubjectDetailsPageRoute(Map<dynamic, dynamic> navigationArguments) {
    return MaterialPageRoute(builder: SubjectDetailsRouteBuilder(_serviceLocator, navigationArguments));
  }

  // @override
  // Route createDetailsPageRoute(NavigationArguments navArgs) {
  //   // TODO: implement createDetailsPageRoute
  //   throw UnimplementedError();
  // }

}
