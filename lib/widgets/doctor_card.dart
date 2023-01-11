import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';

import '../model/data.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
    required this.doctor,
    this.smallCard = false,
  }) : super(key: key);
  final Doctor doctor;
  final bool smallCard;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding:  EdgeInsets.all(smallCard ? 5.0: 8.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(doctor.imgUrl),
              radius: smallCard ? 20 : 50,
            ),
            const SizedBox(height: 10),
            Text(
              doctor.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: smallCard ? 10 : 20,
              ),
            ),
             SizedBox(height:smallCard? 0: 10),
            Text(doctor.jobTitle) ,
          ],
        ),
      ),
    );
  }
}
