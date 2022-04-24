
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hammon_classroom_app/presentation/home/home_cubit.dart';
import 'package:hammon_classroom_app/students_app.dart';
import 'package:hammon_classroom_app/utils/app_theme.dart';

class ClassroomListWidget extends StatelessWidget {
  const ClassroomListWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoaded) {
                      return GridView.count(
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: (3/2),
                        children: List.generate(
                          state.classroomList.length, 
                          (index) {
                            return Container(
                              padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: classroomColors[state.classroomList[index].name],
                              borderRadius: BorderRadius.circular(4.0)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text(state.classroomList[index].name, style: AppTheme.of(context).header5,),
                              Text(state.classroomList[index].layout, style: AppTheme.of(context).textLight,),
                            ]),
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