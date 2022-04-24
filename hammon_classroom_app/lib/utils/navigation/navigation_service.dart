part of 'navigation.dart';

class NavigationService {
  Future<void> openHome(BuildContext context) {
    return Navigator.of(context).popAndPushNamed(_homePageRouteName);
  }

  Future<void> openStudentDetails(BuildContext context, Map<String, Object> navArgs) {
    return Navigator.of(context).pushNamed(_studentDetailsPageRouteName, arguments: navArgs);
  }

  Future<void> openSubjectDetails(BuildContext context, Map<String, Object> navArgs) {
    return Navigator.of(context).pushNamed(_subjectDetailsPageRouteName, arguments: navArgs);
  }

  Future<void> openClassroomDetails(BuildContext context, Map<String, Object> navArgs) {
    return Navigator.of(context).pushNamed(_classroomDetailsPageRouteName, arguments: navArgs);
  }

  void back(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
