import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {

  final BorderRadius borderRadius = BorderRadius.circular(50);

  final Image image;

  ProfilePhoto({
    Key key,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      color: Colors.amber,
      child: ClipRRect(
          borderRadius: borderRadius,
          child: image),
    );
  }
}
