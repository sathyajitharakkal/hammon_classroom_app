import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hammon_classroom_app/presentation/details_subject/subject_details.dart';
import 'package:hammon_classroom_app/presentation/details_subject/subject_details_cubit.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';

class SubjectDetailsRouteBuilder{
  final ServiceLocator serviceLocator;
  final Map<dynamic, dynamic> navigationArguments;

  SubjectDetailsRouteBuilder(this.serviceLocator, this.navigationArguments);

  Widget call(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SubjectDetailsCubit(serviceLocator)),
      ],
      child: MultiRepositoryProvider(providers: [
        RepositoryProvider.value(value: serviceLocator.navigationService),
      ], child: SubjectDetailsPage(data: navigationArguments,)),
    );
  }
}