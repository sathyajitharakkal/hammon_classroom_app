import 'package:bloc/bloc.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ServiceLocator serviceLocator;
  HomeCubit(this.serviceLocator) : super(HomeInitial());

}
