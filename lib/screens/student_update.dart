import "package:flutter/material.dart";
import 'package:student_tracking_system/models/student.dart';
import 'package:student_tracking_system/validation/student_validator.dart';

class StudentUpdate extends StatefulWidget {
  Student? selectedStudent;
  StudentUpdate(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentUpdateState(selectedStudent!);
  }
}

class _StudentUpdateState extends State with StudentValidationMixin {
  Student? selectedStudent;
  _StudentUpdateState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update "+ selectedStudent!.firstName),
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
      initialValue: selectedStudent!.firstName,
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Tolga",
      ),
      validator: (value) {
        return validateFirstName(value);
      },
      onSaved: (value) {
        selectedStudent!.firstName = value.toString();
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent!.lastName,
      decoration: InputDecoration(
        labelText: "Surname",
        hintText: "Şahan",
      ),
      validator: (value) {
        return validateLastName(value);
      },
      onSaved: (value) {
        selectedStudent!.lastName = value.toString();
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent!.grade.toString(),
      decoration: InputDecoration(
        labelText: "Grade",
        hintText: "100",
      ),
      validator: (value) {
        return validateGrade(value);
      },
      onSaved: (value) {
        selectedStudent!.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Save"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(selectedStudent!.firstName);
    print(selectedStudent!.lastName);
    print(selectedStudent!.grade.toString());
  }
}
