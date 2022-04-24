import 'dart:convert';

import 'package:api/responses_model/students.dart';
import 'package:api/responses_model/subjects.dart';

Classrooms classroomsFromJson(String str) => Classrooms.fromJson(json.decode(str));

String classroomsToJson(Classrooms data) => json.encode(data.toJson());

class Classrooms {
    Classrooms({
        required this.classrooms,
    });

    List<Classroom> classrooms;

    factory Classrooms.fromJson(Map<String, dynamic> json) => Classrooms(
        classrooms: List<Classroom>.from(json["classrooms"].map((x) => Classroom.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "classrooms": List<dynamic>.from(classrooms.map((x) => x.toJson())),
    };
}

class Classroom {
    Classroom({
        required this.id,
        required this.layout,
        required this.name,
        required this.size,
        this.subject = 0,
        this.studentList = const []
    });

    int id;
    String layout;
    String name;
    int size;
    int subject;
    List<Student> studentList;

    factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
        id: json["id"],
        layout: json["layout"],
        name: json["name"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "layout": layout,
        "name": name,
        "size": size,
    };
}
