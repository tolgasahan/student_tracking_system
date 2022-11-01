import '../models/student.dart';

class StudentValidationMixin {
  var student = Student.withoutInfo();

  String? validateFirstName(String? value) {
    if (value!.isEmpty) {
      return "Name can't be empty";
    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Only characters";
    } else if (value.length < 3) {
      return "Name should be more then 3 character";
    } else {
      return null;
    }
  }

  String? validateLastName(String? value) {
    if (value!.isEmpty) {
      return "Surname can't be empty";
    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Only characters";
    } else if (value.length < 3) {
      return "Name should be more then 3 character";
    } else {
      return null;
    }
    null;
  }
}

String? validateGrade(String? value) {
  if (value!.isEmpty) {
    return "Grade can't be empty";
  } else if (!RegExp(r"[0-9]$").hasMatch(value)) {
    return "Only numbers";
  } else {
    var grade = int.parse(value);
    if (grade < 0 || grade > 100) {
      return "Grade should be between 0-100";
    } else {
      return null;
    }
  }
}
