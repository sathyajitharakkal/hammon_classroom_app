import 'package:api/api.dart';
import 'package:api/responses_model/subjects.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'index_state.dart';

class IndexCubit extends Cubit<IndexState> {
  late Api _clientApi;
  IndexCubit() : super(IndexInitial()){
    _clientApi = Api.debuggable(baseUrl: "https://hamon-interviewapi.herokuapp.com");
  }

  getSubjectList() async {
    emit(IndexLoading());
    List<Subject> subjetList = [];
    Subjects subjects = await _clientApi.getSubjects();
    subjetList = subjects.subjects;
    emit(IndexLoaded(subjetList: subjetList));
  }

}
