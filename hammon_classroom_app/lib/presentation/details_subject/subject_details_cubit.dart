import 'package:api/responses_model/subjects.dart';
import 'package:bloc/bloc.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';
import 'package:meta/meta.dart';

part 'subject_details_state.dart';

class SubjectDetailsCubit extends Cubit<SubjectDetailsState> {
  final ServiceLocator serviceLocator;
  SubjectDetailsCubit(this.serviceLocator) : super(SubjectDetailsInitial());

  
}
