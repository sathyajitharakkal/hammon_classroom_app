import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hammon_classroom_app/presentation/home/home_cubit.dart';

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
          title: Text("Home Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'hammon_classroom_app',
              ),
              Expanded(child:
               SubjectWidget()
              )
            ],
          ),
        ));
  }
}

class SubjectWidget extends StatefulWidget {
  const SubjectWidget({ Key? key }) : super(key: key);

  @override
  State<SubjectWidget> createState() => _SubjectWidgetState();
}

class _SubjectWidgetState extends State<SubjectWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeCubit>(context).getSubjectList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoaded) {
                      return ListView.builder(
                        itemCount: state.subjetList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.all(12),
                            child: Column(children: [
                              Text("Name : ${state.subjetList[index].name}"),
                              Text("ID : ${state.subjetList[index].id}"),
                              Text("Credits : ${state.subjetList[index].credits}"),
                              Text("Teacher : ${state.subjetList[index].teacher}"),
                            ]),
                          );
                        },
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                );
  }
}