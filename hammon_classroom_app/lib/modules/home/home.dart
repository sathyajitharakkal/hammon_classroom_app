import 'package:flutter/material.dart';
import 'package:hammon_classroom_app/modules/home/home_components/classroom/classroom_list.dart';
import 'package:hammon_classroom_app/modules/home/home_components/students/students_list.dart';
import 'package:hammon_classroom_app/modules/home/home_components/subject/subject_list.dart';
import 'package:hammon_classroom_app/utils/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          
          children: [
             Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 237, 235, 235),
                        borderRadius: BorderRadius.circular(4.0)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                      margin: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Search from list", style: AppTheme.of(context).textDark,),
                          Icon(Icons.search, color: Colors.black,),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Students',
                        style: AppTheme.of(context).titleLarge.copyWith(color: Colors.deepPurple)
                      ),
                      SizedBox(height: 8),
                      const SizedBox(
                        height: 90,
                        child: StudentsListWidegt()
                      ),
                       SizedBox(height: 20),
                      Text(
                        'Subjects',
                        style: AppTheme.of(context).titleLarge.copyWith(color: Colors.deepOrange)
                      ),
                      SizedBox(height: 8),
                      SubjectListWidget(), 
                      SizedBox(height: 20),
                      Text(
                        'Classroom',
                        style: AppTheme.of(context).titleLarge.copyWith(color: Colors.teal)
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 160,
                        child: ClassroomListWidget()
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16,)
          ],
        ));
  }
}