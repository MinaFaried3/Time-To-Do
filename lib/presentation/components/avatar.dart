import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, this.radius = 16}) : super(key: key);
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: CircleAvatar(
        backgroundImage: const AssetImage("images/person.jpeg"),
        radius: radius,
      ),
    );
  }
}
