
import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_tracking_system/models/student.dart';

void main(){

  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget{
  String banner = "Student Tracker System";
  List<Student> students = [Student(
      "https://www.arkitera.com/wp-content/uploads/2019/12/Orhan-Koluk%C4%B1sa_.jpg.jpeg","Tolga", "Şahan", 25),
    Student(
        "data:image/jpeg;base64,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","Mehmet", "Karaduman", 35),
    Student(
        "data:image/jpeg;base64,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","Cengiz", "Topaloğlu", 65)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(banner),
      ),
      body: buildBody(context)
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(students[index].photo),
                ),
                title: Text(students[index].firstName + " " + students[index].lastName),
                subtitle: Text("Exam Score: "+students[index].grade.toString()+"\t\t["+students[index].getStatus+"]"),
                trailing: buildStatusIcon(students[index].grade),
              );
            })
        ),
        Center(
          child: ElevatedButton(
            child: Text("Sonucu Gör"),
            onPressed: (){

            },
          ),
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if(grade >= 50){
      return Icon(Icons.done);
    }else if(grade >= 40){
      return Icon(Icons.circle);
    }else{
      return Icon(Icons.clear);
    }
  }
}