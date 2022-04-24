
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hammon_classroom_app/presentation/home/home_components/subject/subject_cubit.dart';
import 'package:hammon_classroom_app/students_app.dart';
import 'package:hammon_classroom_app/utils/app_page_injectable.dart';
import 'package:hammon_classroom_app/utils/app_theme.dart';

class SubjectListWidget extends StatefulWidget {
  const SubjectListWidget({ Key? key }) : super(key: key);

  @override
  State<SubjectListWidget> createState() => _SubjectListWidgetState();
}

class _SubjectListWidgetState extends State<SubjectListWidget> {

  @override
  void initState() {
    BlocProvider.of<SubjectCubit>(context).getSubjectList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectCubit, SubjectState>(
                  builder: (context, state) {
                    if (state is SubjectLoaded) {
                      return GridView.count(
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: (3/2),
                        children: List.generate(
                          state.subjectList.length, 
                          (index) {
                            return GestureDetector(
                              onTap: () {
                              context.navigationService.openSubjectDetails(context, {"data": state.subjectList[index]});
                            },
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: subjectColors[state.subjectList[index].name],
                                borderRadius: BorderRadius.circular(4.0)
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                      subjectIcons[state.subjectList[index].name]??"",
                                      fit: BoxFit.fill,
                                      color: Colors.white.withOpacity(0.3),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Text(state.subjectList[index].name, style: AppTheme.of(context).header5,),
                                    Text(state.subjectList[index].teacher, style: AppTheme.of(context).textLight,),
                                  ]),
                                ],
                              ),
                                                      ),
                            );
                          }
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                );
  }
}