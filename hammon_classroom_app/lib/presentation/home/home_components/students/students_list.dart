
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hammon_classroom_app/presentation/home/home_components/students/students_cubit.dart';
import 'package:hammon_classroom_app/utils/app_page_injectable.dart';
import 'package:hammon_classroom_app/utils/app_theme.dart';
import 'package:hammon_classroom_app/utils/navigation/navigation.dart';

class StudentsListWidegt extends StatefulWidget {
  const StudentsListWidegt({ Key? key }) : super(key: key);

  @override
  State<StudentsListWidegt> createState() => _StudentsListWidegtState();
}

class _StudentsListWidegtState extends State<StudentsListWidegt> {
  
  @override
  void initState() {
    BlocProvider.of<StudentsCubit>(context).getStudentsList();
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsCubit, StudentsState>(
                  builder: (context, state) {
                    if (state is StudentsLoaded) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.studentList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.navigationService.openStudentDetails(context, {"data": state.studentList[index]});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.colorBlue,
                                borderRadius: BorderRadius.circular(4.0)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal :12.0),
                              margin: const EdgeInsets.only(right: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset("assets/student.png", height: 30, width: 30,),
                                  SizedBox(width: 12,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Text(state.studentList[index].name, style: AppTheme.of(context).textLightLarge,),
                                    Text(state.studentList[index].email, style: AppTheme.of(context).textLight,),
                                  ]),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                );
  }
}