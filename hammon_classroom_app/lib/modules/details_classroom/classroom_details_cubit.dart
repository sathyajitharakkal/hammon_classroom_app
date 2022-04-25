import 'package:api/responses_model/classroom.dart';
import 'package:bloc/bloc.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';
import 'package:meta/meta.dart';

part 'classroom_details_state.dart';

class ClassroomDetailsCubit extends Cubit<ClassroomDetailsState> {
  final ServiceLocator serviceLocator;
  ClassroomDetailsCubit(this.serviceLocator) : super(ClassroomDetailsInitial());
  
}
