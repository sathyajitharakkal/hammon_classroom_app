import 'package:flutter/material.dart';
import 'package:hammon_classroom_app/utils/app_routes_factory.dart';
import 'package:hammon_classroom_app/utils/app_theme.dart';
import 'package:hammon_classroom_app/utils/navigation/navigation.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';


class studentsApp extends StatelessWidget {
  final String initialRoute;
  final ServiceLocator serviceLocator;
  const studentsApp(
      {Key? key, required this.initialRoute, required this.serviceLocator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    return AppTheme(child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Classroom',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0
        )
      ),
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateAppRoute(AppRoutesFactory(serviceLocator)),
    ));

  }
}

Map<String, Color> subjectColors = {
  "History": Colors.brown,
  "Mathematics": Colors.blue,
  "Social Science": Colors.deepPurpleAccent,
  "Chemistry": Colors.red,
  "Biology": Colors.green,
  "Physics": Colors.amber
};

Map<String, Color> classroomColors = {
  "SlateGray": Colors.brown,
  "Brown": Colors.blue,
  "DodgerBlue": Colors.deepPurpleAccent,
  "Chartreuse": Colors.red,
  "OldLace": Colors.green,
  "WhiteSmoke": Colors.amber
};