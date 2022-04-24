import 'package:api/api.dart';
import 'package:api/responses_model/classroom.dart';
import 'package:bloc/bloc.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';
import 'package:meta/meta.dart';

part 'classroom_state.dart';

class ClassroomCubit extends Cubit<ClassroomState> {
  final ServiceLocator serviceLocator;
  ClassroomCubit(this.serviceLocator) : super(ClassroomInitial());

  getClassroomList() async {
    emit(ClassroomLoading());
    List<Classroom> classroomList = [];
    Classrooms classrooms = await serviceLocator.api.getClassroom();
    classroomList = classrooms.classrooms;

    emit(ClassroomLoaded(classroomList: classroomList));
  }
}
