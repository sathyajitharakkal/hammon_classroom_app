import 'package:flutter/material.dart';

class StudentDetailsPage extends StatefulWidget {
  const StudentDetailsPage({Key? key}) : super(key: key);

  @override
  State<StudentDetailsPage> createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Student Details Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'hammon_classroom_app',
              ),
              Expanded(child:
               Center(child: Text("Student Details"))
              )
            ],
          ),
        ));
  }
}