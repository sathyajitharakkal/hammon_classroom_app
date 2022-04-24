import 'package:api/api.dart';
import 'package:api/responses_model/subjects.dart';
import 'package:bloc/bloc.dart';
import 'package:hammon_classroom_app/utils/services/service_locator.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ServiceLocator serviceLocator;
  HomeCubit(this.serviceLocator) : super(HomeInitial()){
    // _clientApi = Api.debuggable(baseUrl: "https://hamon-interviewapi.herokuapp.com");
  }

  getSubjectList() async {
    emit(HomeLoading());
    List<Subject> subjetList = [];
    Subjects subjects = await serviceLocator.api.getSubjects();
    subjetList = subjects.subjects;
    emit(HomeLoaded(subjetList: subjetList));
  }

}
