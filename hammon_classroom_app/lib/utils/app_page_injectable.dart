import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hammon_classroom_app/utils/navigation/navigation.dart';

extension AppPageInjectable on BuildContext {
  NavigationService get navigationService => read<NavigationService>();
}
