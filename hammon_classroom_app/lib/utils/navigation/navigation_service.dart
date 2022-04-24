part of 'navigation.dart';

class NavigationService {
  Future<void> openHome(BuildContext context) {
    return Navigator.of(context).popAndPushNamed(_homePageRouteName);
  }

  void back(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
