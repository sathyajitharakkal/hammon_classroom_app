import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hammon_classroom_app/presentation/index/index_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
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
          )),
    );
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
    BlocProvider.of<IndexCubit>(context).getSubjectList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexCubit, IndexState>(
                  builder: (context, state) {
                    if (state is IndexLoaded) {
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