import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hammon_classroom_app/presentation/home/home.dart';
import 'package:hammon_classroom_app/presentation/home/home_cubit.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';

class HomeRouteBuilder{
  final ServiceLocator serviceLocator;

  HomeRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit(serviceLocator)),
      ],
      child: MultiRepositoryProvider(providers: [
        RepositoryProvider.value(value: serviceLocator.navigationService),
      ], child: HomePage()),
    );
  }
}