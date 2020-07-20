import 'package:doctor_profile_example/components/profile_photo.dart';
import 'package:doctor_profile_example/models/doctor.dart';
import 'package:doctor_profile_example/providers/doctor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DoctorProfileScreen extends StatefulWidget {
  DoctorProfileScreen({Key key}) : super(key: key);

  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  Doctor doctor = DoctorProvider().currentDoctor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            buildSliverAppBar(),
            buildSliverList(),
          ],
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white10,
      expandedHeight: 220.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: <Widget>[
            buildProfileImage(),
            buildDoctorNameAndBranch(),
          ],
        ),
      ),
      actions: buildActions(),
    );
  }

  List<Widget> buildActions() {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
        tooltip: 'Add new entry',
        onPressed: () {/* ... */},
      ),
    ];
  }

  Center buildProfileImage() {
    return Center(
        child: ProfilePhoto(
          image: Image.network(
            doctor.profilePhoto,
            width: 100,
            height: 100,
          ),
      ),
    );
  }

  SliverList buildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          buildInfoCards(),
          SizedBox(height: 10),
          buildBottomCard([
            buildCardItem(
              "About Doctor",
              buildCardItemSecondaryText(doctor.about),
            ),
            SizedBox(height: 30),
            buildCardItem(
              "Working time",
              buildCardItemSecondaryText(doctor.workingTime),
            ),
            SizedBox(height: 30),
            buildCardItem(
              "Communication",
              buildCommunicationList(),
            ),
            SizedBox(height: 50),
            buildBottomButton()
          ]),
        ],
      ),
    );
  }

  SizedBox buildBottomButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.grey.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: Text(
            "Book Appointment",
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Column buildCommunicationList() {
    return Column(
      children: <Widget>[
        buildCommunicationItem(
          "Messaging",
          "Chat me up, share photos.",
          Icon(Icons.message, color: Colors.grey),
          Colors.green.withOpacity(0.3),
        ),
        SizedBox(height: 10),
        buildCommunicationItem(
          "Audio Call",
          "Call your doctor directly.",
          Icon(Icons.phone, color: Colors.blue),
          Colors.grey.withOpacity(0.3),
        ),
        SizedBox(height: 10),
        buildCommunicationItem(
          "Video Call",
          "See you doctor live.",
          Icon(Icons.video_call, color: Colors.orange),
          Colors.orange.withOpacity(0.2),
        )
      ],
    );
  }

  Row buildCommunicationItem(
    String title,
    String subTitle,
    Icon icon,
    Color color,
  ) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ColoredBox(
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.7),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              subTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.4),
                fontSize: 15,
              ),
            ),
          ],
        )
      ],
    );
  }

  Column buildCardItem(String title, Widget child) {
    return Column(
      children: <Widget>[
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
        SizedBox(height: 10),
        Align(alignment: Alignment.topLeft, child: child),
      ],
    );
  }

  Text buildCardItemSecondaryText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(1),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Card buildBottomCard(List<Widget> list) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: list,
        ),
      ),
    );
  }

  Widget buildInfoCards() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildInfoCard(
            Icon(Icons.people, color: Colors.blue),
            Colors.blue.withOpacity(0.1),
            doctor.patientCount.toString() + "+",
            "Patients",
          ),
          buildInfoCard(
            Icon(Icons.stars, color: Colors.black.withOpacity(0.3)),
            Colors.green.withOpacity(0.1),
            doctor.experience.toString() + " Yrs",
            "Experience",
          ),
          buildInfoCard(
            Icon(Icons.star_border, color: Colors.orange.withOpacity(0.6)),
            Colors.orange.withOpacity(0.1),
            doctor.rating.toString(),
            "Ratings",
          ),
        ],
      ),
    );
  }

  Column buildDoctorNameAndBranch() {
    return Column(
      children: <Widget>[
        Text(
          "Dr " + doctor.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        Text(
          doctor.branch,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.6),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget buildInfoCard(
    Icon icon,
    Color color,
    String primaryText,
    String secondaryText,
  ) {
    return SizedBox(
      width: 120,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            buildInfoCardTopIcon(icon, color),
            SizedBox(height: 15),
            Text(
              primaryText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              secondaryText,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  ClipRRect buildInfoCardTopIcon(Icon icon, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      child: ColoredBox(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              icon,
            ],
          ),
        ),
      ),
    );
  }
}
