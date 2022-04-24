import 'package:api/responses_model/students.dart';
import 'package:flutter/material.dart';
import 'package:hammon_classroom_app/utils/app_theme.dart';

class StudentDetailsPage extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  const StudentDetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  State<StudentDetailsPage> createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  Student? student;
  @override
  void initState() {
    try {
      student = widget.data["data"] as Student;
    } catch (e) {}
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Student Details"),
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
            Image.asset(
              "assets/student.png",
              height: 180,
              width: 180,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppTheme.colorBlue,
                  borderRadius: BorderRadius.circular(4.0)),
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 3,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Name",
                              style: AppTheme.of(context).textLightLarge,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "Email",
                              style: AppTheme.of(context).textLightLarge,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "Age",
                              style: AppTheme.of(context).textLightLarge,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "ID",
                              style: AppTheme.of(context).textLightLarge,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                          ])),
                  Expanded(
                      flex: 1,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              ":",
                              style: AppTheme.of(context).textLightLarge,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              ":",
                              style: AppTheme.of(context).textLightLarge,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              ":",
                              style: AppTheme.of(context).textLightLarge,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              ":",
                              style: AppTheme.of(context).textLightLarge,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                          ])),
                  Expanded(
                    flex: 8,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            student!.name,
                            style: AppTheme.of(context).textLightLarge,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            student!.email,
                            style: AppTheme.of(context).textLight,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            student!.age.toString(),
                            style: AppTheme.of(context).textLightLarge,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            student!.id.toString(),
                            style: AppTheme.of(context).textLightLarge,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
