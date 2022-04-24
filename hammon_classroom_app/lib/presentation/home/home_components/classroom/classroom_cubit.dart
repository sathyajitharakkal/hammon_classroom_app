import 'package:api/api.dart';
import 'package:api/responses_model/classroom.dart';
import 'package:bloc/bloc.dart';
import 'package:hammon_classroom_app/data&models/base_repo.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';
import 'package:meta/meta.dart';

part 'classroom_state.dart';

class ClassroomCubit extends Cubit<ClassroomState> {
  final ServiceLocator serviceLocator;
  ClassroomCubit(this.serviceLocator) : super(ClassroomInitial());

  getClassroomList() async {
    emit(ClassroomLoading());
    List<Classroom> classroomList = [];
    if (BaseRepo.repo.students != null) {
      emit(ClassroomLoaded(classroomList: BaseRepo.repo.classrooms!.classrooms));
      return;
    }
    Classrooms classrooms = await serviceLocator.api.getClassroom();
    BaseRepo.repo.setClassRooms(classrooms);
    classroomList = classrooms.classrooms;

    emit(ClassroomLoaded(classroomList: classroomList));
  }
}
