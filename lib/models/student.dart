class Student {
  int id = 0;
  String photo = "";
  String firstName = "";
  String lastName = "";
  int grade = 0;
  String _status = "";

  Student(String photo, String firstName, String lastName, int grade) {
    this.photo = photo;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  Student.withID(int id, String photo, String firstName, String lastName, int grade) {
    this.id = id;
    this.photo = photo;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withoutInfo(){

  }

  String get getStatus {
    if (this.grade >= 50) {
      return "Successful";
    } else if (this.grade >= 40) {
      return "Make-up Exam";
    } else {
      return "Fail";
    }
  }
}
