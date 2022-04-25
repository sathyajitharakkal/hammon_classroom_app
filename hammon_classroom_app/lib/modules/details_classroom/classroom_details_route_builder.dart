import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hammon_classroom_app/modules/details_classroom/classroom_details.dart';
import 'package:hammon_classroom_app/modules/details_classroom/classroom_details_cubit.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';

class ClassroomDetailsRouteBuilder{
  final ServiceLocator serviceLocator;
  final Map<dynamic, dynamic> navigationArguments;

  ClassroomDetailsRouteBuilder(this.serviceLocator, this.navigationArguments);

  Widget call(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ClassroomDetailsCubit(serviceLocator)),
      ],
      child: MultiRepositoryProvider(providers: [
        RepositoryProvider.value(value: serviceLocator.navigationService),
      ], child: ClassroomDetailsPage(data: navigationArguments)),
    );
  }
}