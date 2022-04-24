import 'package:flutter/material.dart';

class AppTheme extends InheritedWidget {
  final TextStyle header1;
  final TextStyle header2;
  final TextStyle header3;
  final TextStyle header4;
  final TextStyle header5;
  final TextStyle textAccent;
  final TextStyle textLight;
  final TextStyle textLightLarge;
  final TextStyle textDark;

  static const Color colorRed = Color.fromARGB(255, 255, 7, 7);
  static const Color colorGreen = Color.fromARGB(255, 25, 193, 125);
  static const Color colorWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color colorBlack = Color.fromARGB(255, 22, 22, 22);
  static const Color colorBlue = Color.fromRGBO(5, 99, 245, 1);
  static const Color colorOrange = Color.fromRGBO(246, 135, 34, 1);
  static const Color colorLightOrange = Color.fromRGBO(255, 246, 231, 1);
  static const Color colorGrey = Color.fromRGBO(121, 121, 121, 1.0);


  const AppTheme({Key? key, required Widget child})
      : header1 = const TextStyle(
            fontSize: 25.0,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: 'OpenSans'),
        header2 = const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontFamily: 'OpenSans'),
        header3 = const TextStyle(
            fontSize: 14.0,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: 'OpenSans'),
        header4 = const TextStyle(
          fontSize: 12,
          color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: 'OpenSans'
        ),
        header5 = const TextStyle(
            fontSize: 20,
            letterSpacing: 2,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontFamily: 'OpenSans'
        ),
        textAccent = const TextStyle(
            fontSize: 14.0,
            color: Color.fromRGBO(5, 99, 245, 1),
            fontWeight: FontWeight.w400,
            fontFamily: 'OpenSans'),
        textLight = const TextStyle(
            fontSize: 14.0,
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontFamily: 'OpenSans'),
        textLightLarge = const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'OpenSans'),
        textDark = const TextStyle(
            fontSize: 14.0,
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontFamily: 'OpenSans'),
        super(key: key, child: child);

  static AppTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}