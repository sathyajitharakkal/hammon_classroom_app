import 'package:flutter/material.dart';
import 'package:hammon_classroom_app/utils/app_theme.dart';

class ClassroomLayout extends StatelessWidget {
  final int length;
  const ClassroomLayout({ Key? key, required this.length }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.white60,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.all(12),
                        color: Colors.teal,
                        child: Center(
                          child: Text(
                            "Teacher",
                            style: AppTheme.of(context).textLight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          crossAxisSpacing: 50.0,
                          mainAxisSpacing: 10.0,
                          shrinkWrap: true,
                          children: List.generate( length, (int index) {
                            return Container(
                              child: Container(
                                width: 15,
                                height: 15,
                                color: AppTheme.colorOrange,
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                    child: Text(
                                  (index + 1).toString(),
                                  style: AppTheme.of(context).textLight,
                                )),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                );
  }
}

class ConferenceLayout extends StatelessWidget {
  final int length;
  const ConferenceLayout({ Key? key , required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.white60,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 250.0,
                          mainAxisSpacing: 10.0,
                          shrinkWrap: true,
                          children: List.generate( length, (int index) {
                            return Container(
                              child: Container(
                                width: 15,
                                height: 15,
                                color: AppTheme.colorOrange,
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                    child: Text(
                                  (index + 1).toString(),
                                  style: AppTheme.of(context).textLight,
                                )),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                );
              
  }
}
