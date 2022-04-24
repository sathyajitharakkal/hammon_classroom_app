import 'package:flutter/material.dart';

class SubjectDetailsPage extends StatefulWidget {
  const SubjectDetailsPage({Key? key}) : super(key: key);

  @override
  State<SubjectDetailsPage> createState() => _SubjectDetailsPageState();
}

class _SubjectDetailsPageState extends State<SubjectDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Subject Details Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'hammon_classroom_app',
              ),
              Expanded(child:
               Center(child: Text("Subject details"))
              )
            ],
          ),
        ));
  }
}
