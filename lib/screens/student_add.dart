import "package:flutter/material.dart";
import 'package:student_tracking_system/models/student.dart';
import 'package:student_tracking_system/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add a new student"),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton()
              ],
            ),
          ),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Tolga",
      ),
      validator: (value) {return validateFirstName(value);},
      onSaved: (value) {student.firstName = value.toString();},
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Surname",
        hintText: "Şahan",
      ),
      validator: (value) {return validateLastName(value);},
      onSaved: (value) {student.lastName = value.toString();},
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Grade",
        hintText: "100",
      ),
      validator: (value) {return validateGrade(value);},
      onSaved: (value) {student.grade = int.parse(value!);},
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Save"),
      onPressed: () {
       if(formKey.currentState!.validate()){
         formKey.currentState!.save();
         saveStudent();
       }
      },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade.toString());
  }
}
