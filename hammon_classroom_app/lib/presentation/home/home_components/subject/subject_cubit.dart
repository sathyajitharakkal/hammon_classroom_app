import 'package:api/api.dart';
import 'package:api/responses_model/subjects.dart';
import 'package:bloc/bloc.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';
import 'package:meta/meta.dart';

part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  final ServiceLocator serviceLocator;
  SubjectCubit(this.serviceLocator) : super(SubjectInitial());

    getSubjectList() async {
    emit(SubjectLoading());

    List<Subject> subjectList = [];
    Subjects subjects = await serviceLocator.api.getSubjects();
    subjectList = subjects.subjects;

    emit(SubjectLoaded(subjectList: subjectList));
  }
}
