import 'dart:ffi';

import 'package:api/responses_model/classroom.dart';
import 'package:api/responses_model/students.dart';
import 'package:api/responses_model/subjects.dart';
import 'package:flutter/material.dart';
import 'package:hammon_classroom_app/data&models/base_repo.dart';
import 'package:hammon_classroom_app/presentation/details_classroom/classroom_layouts.dart';
import 'package:hammon_classroom_app/students_app.dart';
import 'package:hammon_classroom_app/utils/app_theme.dart';

class ClassroomDetailsPage extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  const ClassroomDetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  State<ClassroomDetailsPage> createState() => _ClassroomDetailsPageState();
}

class _ClassroomDetailsPageState extends State<ClassroomDetailsPage> {
  late Classroom classroom;
  late List<Subject> subjectList;
  late List<String> dropDownList;
  late List<String> subjects;
  late List<Student> studentList;

  List<Classroom> classrooms = BaseRepo.repo.getClassRooms()!.classrooms;
  int subject = 0;
  int student = 0;

  @override
  void initState() {
    try {
      classroom = widget.data["data"] as Classroom;
      subject = classroom.subject;
      studentList = classroom.studentList;
    } catch (e) {}
    setState(() {});
    subjectList = BaseRepo.repo.getSubjects()!.subjects;
    subjects = List.generate(subjectList.length + 1, (index) {
      return index == 0 ? "Select Subject" : subjectList[index - 1].name;
    });
    super.initState();
  }

  updateClassRoom(Classroom room) {
    for (var i = 0; i < classrooms.length; i++) {
      if (classrooms[i].id == room.id) {
        classrooms[i] == room;
        BaseRepo.repo.classrooms!.classrooms = classrooms;
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Classroom Details"),
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (classroom.layout == "classroom")
                ClassroomLayout(length: classroom.size),
              if (classroom.layout != "classroom")
                ConferenceLayout(length: classroom.size),
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
                                "Layout",
                                style: AppTheme.of(context).textLightLarge,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "Size",
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
                              classroom.name,
                              style: AppTheme.of(context).textLightLarge,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              classroom.layout,
                              style: AppTheme.of(context).textLightLarge,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              classroom.size.toString(),
                              style: AppTheme.of(context).textLightLarge,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              classroom.id.toString(),
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
              Container(
                margin: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(4.0)),
                child: DropdownButton(
                    isExpanded: true,
                    hint: Text(
                      "Select Subject",
                      style: AppTheme.of(context).textLight,
                    ),
                    value: subject,
                    dropdownColor: Colors.teal,
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: RotatedBox(
                          quarterTurns: 3,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    ),
                    items: List.generate(subjects.length, (index) {
                      return DropdownMenuItem(
                          value: index,
                          child: Container(
                            color: Colors.teal,
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              subjects[index],
                              style: AppTheme.of(context).textLight,
                            ),
                          ));
                    }),
                    onChanged: (val) {
                      setState(() {
                        subject = val as int;
                        classroom.subject = subject;
                        updateClassRoom(classroom);
                      });
                    }),
              ),
              GestureDetector(
                onTap: () {
                  if (subject != 0) {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0)),
                            height: 350,
                            child: AddStudents(
                                selectedStudents: (studentsList) {
                                  print("selected students : $studentList");
                                }),
                          );
                        });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: subject != 0 ? Colors.teal : Colors.grey,
                      borderRadius: BorderRadius.circular(4.0)),
                  padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Add Student",
                          style: AppTheme.of(context).textLight),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class AddStudents extends StatefulWidget {
  final Function(List<int>) selectedStudents;
  const AddStudents({Key? key, required this.selectedStudents})
      : super(key: key);

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  List<Student> students = BaseRepo().students!.students;
  List<int> selectedStudents= [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Add Students from below list",
              style: AppTheme.of(context).textDarkLarge,
            )),
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if(selectedStudents.contains(index)){
                      selectedStudents.remove(index);
                    }else{
                      selectedStudents.add(index);
                    }
                    setState(() {
                      
                    });
                    print(selectedStudents);
                    widget.selectedStudents(selectedStudents);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: selectedStudents.contains(index)? Colors.amber : Colors.blue,
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name : " + students[index].name,
                              style: AppTheme.of(context).textLight,
                            ),
                            Text("ID : " + students[index].id.toString(),
                                style: AppTheme.of(context).textLight),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
