import 'package:doctor_profile_example/models/person.dart';

class Doctor extends Person {
  String branch;

  int patientCount, experience;

  double rating;

  String workingTime;

  Doctor({
    String name,
    String surname,
    String about,
    String profilePhoto,
    this.branch,
    this.patientCount,
    this.experience,
    this.rating,
    this.workingTime,
  }) : super(name, surname, about, profilePhoto);
}
