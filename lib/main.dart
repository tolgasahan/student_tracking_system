import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_tracking_system/models/student.dart';
import 'package:student_tracking_system/screens/student_add.dart';
import 'package:student_tracking_system/screens/student_update.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String banner = "Student Tracker System";
  Student selectedStudent = Student.withID(0, "", "", "", 0);
  List<Student> students = [
    Student.withID(
        1,
        "https://www.arkitera.com/wp-content/uploads/2019/12/Orhan-Koluk%C4%B1sa_.jpg.jpeg",
        "Tolga",
        "Şahan",
        25),
    Student.withID(
        2,
        "https://cdnuploads.aa.com.tr/uploads/Contents/2019/07/01/thumbs_b_c_91832c8bbc58b90b6d1ef3925cb1c328.jpg",
        "Mehmet",
        "Karaduman",
        45),
    Student.withID(
        3,
        "http://www.muratcangumus.com/wp-content/uploads/2017/04/insan-resimleri-zanzibar-beach-boy-Muratcan-Gumus-www.muratcangumus.com_.jpg",
        "Cengiz",
        "Topaloğlu",
        65)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(banner),
        ),
        body: buildBody(context));
  }

  void showMessage(BuildContext context, String title, String content) {
    var alert = AlertDialog(
      title: Text(title),
      content: Text(content),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
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
                        selectedStudent = students[index];
                      });
                      ;
                    },
                  );
                })),
        Text("Selected Student: " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey, // Background color
                ),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text("Add")
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentAdd(students)))
                      .then((value) => setState(() {selectedStudent = Student.withID(0, "", "", "", 0);}));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent, // Background color
                ),
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text("Update")
                  ],
                ),
                onPressed: () {
                  if (selectedStudent.id == 0) {
                    showMessage(
                        context, "Error", "You should select a student");
                  } else {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    StudentUpdate(selectedStudent)))
                        .then((value) => setState(() {selectedStudent = Student.withID(0, "", "", "", 0);}));
                  }
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey, // Background color
                ),
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text("Delete")
                  ],
                ),
                onPressed: () {
                  if (selectedStudent.id == 0) {
                    showMessage(context, "Error", "Select a student");
                  } else if (students.isEmpty == true) {
                    showMessage(context, "Error", "Student not found");
                  } else {
                    setState(() {
                      students.remove(selectedStudent);
                      showMessage(context, "Delete",
                          selectedStudent.firstName + " successful deleted");
                      selectedStudent = Student.withID(0, "", "", "", 0);
                    });
                  }
                },
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
