import 'package:api/api.dart';
import 'package:api/responses_model/students.dart';
import 'package:bloc/bloc.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';
import 'package:meta/meta.dart';

part 'students_state.dart';

class StudentsCubit extends Cubit<StudentsState> {
  final ServiceLocator serviceLocator;
  StudentsCubit(this.serviceLocator) : super(StudentsInitial());

  getStudentsList() async {
    emit(StudentsLoading());

    List<Student> studentList = [];
    Students students = await serviceLocator.api.getStudents();
    studentList = students.students;

    emit(StudentsLoaded(studentList: studentList));
  }

}
