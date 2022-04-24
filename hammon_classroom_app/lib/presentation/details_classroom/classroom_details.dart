import 'package:flutter/material.dart';

class ClassroomDetailsPage extends StatefulWidget {
  const ClassroomDetailsPage({Key? key}) : super(key: key);

  @override
  State<ClassroomDetailsPage> createState() => _ClassroomDetailsPageState();
}

class _ClassroomDetailsPageState extends State<ClassroomDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Classroom Details Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'hammon_classroom_app',
              ),
              Expanded(child:
               Center(child: Text("Classroom Details"))
              )
            ],
          ),
        ));
  }
}
