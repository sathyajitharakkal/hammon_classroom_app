import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hammon_classroom_app/students_app.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';

void main() {
  const environment = String.fromEnvironment('FLAVOR', defaultValue: 'staging');
  const baseUrl = String.fromEnvironment('BASE_URL',
      defaultValue:'https://hamon-interviewapi.herokuapp.com');//Api.debuggable(baseUrl: "https://hamon-interviewapi.herokuapp.com");

  const initialRoute =
      String.fromEnvironment('INITIAL_ROUTE', defaultValue: '/home');


  ServiceLocator locator = ServiceLocator(baseUrl: baseUrl)..config();
  HttpOverrides.global = MyHttpOverrides();
  
  runApp(
    studentsApp(
    initialRoute: initialRoute,
    serviceLocator: locator
  ));
}

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}