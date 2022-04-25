import 'package:api/responses_model/students.dart';
import 'package:bloc/bloc.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';
import 'package:meta/meta.dart';

part 'student_details_state.dart';

class StudentDetailsCubit extends Cubit<StudentDetailsState> {
  final ServiceLocator serviceLocator;
  StudentDetailsCubit(this.serviceLocator) : super(StudentDetailsInitial());

}
