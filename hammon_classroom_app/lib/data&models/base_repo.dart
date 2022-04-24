import 'package:api/responses_model/classroom.dart';
import 'package:api/responses_model/students.dart';
import 'package:api/responses_model/subjects.dart';

class BaseRepo {
  static final BaseRepo repo = BaseRepo._();

  BaseRepo._();
  factory BaseRepo() {
    return repo;
  }

  Subjects? subjects;
  Students? students;
  Classrooms? classrooms; 

  setClassRooms(Classrooms _classrooms){
    classrooms = _classrooms;
  }

  setSubjects(Subjects _subjects){
    subjects = _subjects;
  }

  setStudents(Students _students){
    students = _students;
  }

  Classrooms? getClassRooms(){
    return classrooms;
  }

  Subjects? getSubjects(){
    return subjects;
  }

  Students? getStudents(){
    return students;
  }
}