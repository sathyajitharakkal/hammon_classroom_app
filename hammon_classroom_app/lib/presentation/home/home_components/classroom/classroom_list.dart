
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hammon_classroom_app/presentation/home/home_components/classroom/classroom_cubit.dart';
import 'package:hammon_classroom_app/utils/app_page_injectable.dart';
import 'package:hammon_classroom_app/utils/app_theme.dart';

class ClassroomListWidget extends StatefulWidget {
  const ClassroomListWidget({ Key? key }) : super(key: key);

  @override
  State<ClassroomListWidget> createState() => ClassroomListWidgetState();
}

class ClassroomListWidgetState extends State<ClassroomListWidget> {

  @override
  void initState() {
    BlocProvider.of<ClassroomCubit>(context).getClassroomList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassroomCubit, ClassroomState>(
                  builder: (context, state) {
                    if (state is ClassroomLoaded) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.classroomList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.navigationService.openClassroomDetails(context, {"data": state.classroomList[index]});
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 12),
                                padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: classroomColors[state.classroomList[index].name],
                                borderRadius: BorderRadius.circular(4.0)
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                      classroomICons[state.classroomList[index].layout]??"",
                                      fit: BoxFit.fill,
                                      color: Colors.black.withOpacity(0.08),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Text(state.classroomList[index].name, style: AppTheme.of(context).header5,),
                                    Text(state.classroomList[index].layout, style: AppTheme.of(context).textLight,),
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