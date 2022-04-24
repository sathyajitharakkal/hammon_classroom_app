
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hammon_classroom_app/presentation/home/home_cubit.dart';
import 'package:hammon_classroom_app/utils/app_theme.dart';

class StudentsListWidegt extends StatelessWidget {
  const StudentsListWidegt({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoaded) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.subjetList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: AppTheme.colorBlue,
                              borderRadius: BorderRadius.circular(4.0)
                            ),
                            padding: const EdgeInsets.symmetric(horizontal :12.0),
                            margin: const EdgeInsets.only(right: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text(state.studentList[index].name, style: AppTheme.of(context).textLightLarge,),
                              Text(state.studentList[index].email, style: AppTheme.of(context).textLight,),
                            ]),
                          );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                );
  }
}