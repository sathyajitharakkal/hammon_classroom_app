import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hammon_classroom_app/modules/details_student/student_details.dart';
import 'package:hammon_classroom_app/modules/details_student/student_details_cubit.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';

class StudentDetailsRouteBuilder{
  final ServiceLocator serviceLocator;
  final Map<dynamic, dynamic> navigationArguments;

  StudentDetailsRouteBuilder(this.serviceLocator, this.navigationArguments);

  Widget call(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StudentDetailsCubit(serviceLocator)),
      ],
      child: MultiRepositoryProvider(providers: [
        RepositoryProvider.value(value: serviceLocator.navigationService),
      ], child: StudentDetailsPage(data: navigationArguments,)),
    );
  }
}