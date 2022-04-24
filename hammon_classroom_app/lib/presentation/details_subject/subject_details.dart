import 'package:api/responses_model/subjects.dart';
import 'package:flutter/material.dart';
import 'package:hammon_classroom_app/utils/app_theme.dart';

class SubjectDetailsPage extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  const SubjectDetailsPage({Key? key, required this.data }) : super(key: key);

  @override
  State<SubjectDetailsPage> createState() => _SubjectDetailsPageState();
}

class _SubjectDetailsPageState extends State<SubjectDetailsPage> {
  late Subject subject;
  @override
  void initState() {
     try {
      subject = widget.data["data"] as Subject;
    } catch (e) {}
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Subject Details"),
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
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
                              "Teacher",
                              style: AppTheme.of(context).textLightLarge,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "Credits",
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
                            subject.name,
                            style: AppTheme.of(context).textLightLarge,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            subject.teacher,
                            style: AppTheme.of(context).textLightLarge,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            subject.credits.toString(),
                            style: AppTheme.of(context).textLightLarge,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            subject.id.toString(),
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
