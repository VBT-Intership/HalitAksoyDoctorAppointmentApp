import 'package:doctor_profile_example/models/doctor.dart';

class DoctorProvider {
  List<Doctor> doctors = [testDoctor];

  Doctor get currentDoctor => doctors.first;

  static final DoctorProvider _doctorProvider = DoctorProvider._internal();

  factory DoctorProvider() {
    return _doctorProvider;
  }

  DoctorProvider._internal();
}

const String lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
    "Phasellus sapien ligula, fermentum id tempus ac, fermentum"
    " condimentum risus. Nullam condimentum at arcu eget luctus. "
    "Duis bibendum at lectus interdum faucibus. Nunc dui enim,"
    " dignissim id ullamcorper nec, cursus non mi. "
    "Ut ut interdum enim. Nullam posuere varius justo, "
    "eget venenatis mi porttitor quis.";

final Doctor testDoctor = Doctor(
  name: "Bellamy Nicholas",
  surname: "",
  about: lorem,
  branch: "Viralogist",
  experience: 10,
  patientCount: 1000,
  profilePhoto: "",
  rating: 4.5,
  workingTime: "Mon - Sat (08:30 AM - 09:00 PM)",
);
