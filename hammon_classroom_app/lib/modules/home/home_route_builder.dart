import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hammon_classroom_app/modules/home/home.dart';
import 'package:hammon_classroom_app/modules/home/home_components/classroom/classroom_cubit.dart';
import 'package:hammon_classroom_app/modules/home/home_components/students/students_cubit.dart';
import 'package:hammon_classroom_app/modules/home/home_components/subject/subject_cubit.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';

class HomeRouteBuilder{
  final ServiceLocator serviceLocator;

  HomeRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StudentsCubit(serviceLocator)),
        BlocProvider(create: (context) => SubjectCubit(serviceLocator)),
        BlocProvider(create: (context) => ClassroomCubit(serviceLocator)),
      ],
      child: MultiRepositoryProvider(providers: [
        RepositoryProvider.value(value: serviceLocator.navigationService),
      ], child: HomePage()),
    );
  }
}