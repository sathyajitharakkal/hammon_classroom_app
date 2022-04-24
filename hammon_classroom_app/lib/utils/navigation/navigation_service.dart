part of 'navigation.dart';

class NavigationService {
  Future<void> openHome(BuildContext context) {
    return Navigator.of(context).popAndPushNamed(_homePageRouteName);
  }

  Future<void> openStudentDetails(BuildContext context) {
    return Navigator.of(context).popAndPushNamed(_studentDetailsPageRouteName);
  }

  Future<void> openSubjectDetails(BuildContext context) {
    return Navigator.of(context).popAndPushNamed(_subjectDetailsPageRouteName);
  }

  Future<void> openClassroomDetails(BuildContext context) {
    return Navigator.of(context).popAndPushNamed(_classroomDetailsPageRouteName);
  }

  void back(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
