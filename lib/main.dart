import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_tracking_system/models/student.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String banner = "Student Tracker System";

  List<Student> students = [
    Student(
        "https://www.arkitera.com/wp-content/uploads/2019/12/Orhan-Koluk%C4%B1sa_.jpg.jpeg",
        "Tolga",
        "Şahan",
        25),
    Student(
        "https://cdnuploads.aa.com.tr/uploads/Contents/2019/07/01/thumbs_b_c_91832c8bbc58b90b6d1ef3925cb1c328.jpg",
        "Mehmet",
        "Karaduman",
        45),
    Student(
        "http://www.muratcangumus.com/wp-content/uploads/2017/04/insan-resimleri-zanzibar-beach-boy-Muratcan-Gumus-www.muratcangumus.com_.jpg",
        "Cengiz",
        "Topaloğlu",
        65)
  ];

  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(banner),
        ),
        body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(students[index].photo),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Exam Score: " +
                        students[index].grade.toString() +
                        "\t\t[" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        name = students[index].firstName +
                            " " +
                            students[index].lastName;
                      });
                      ;
                    },
                  );
                })),
        Text("Selected Student: " + name),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                child: Text("New Student"),
                onPressed: () {},
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                child: Text("Update"),
                onPressed: () {},
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                child: Text("Delete"),
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.circle);
    } else {
      return Icon(Icons.clear);
    }
  }
}
