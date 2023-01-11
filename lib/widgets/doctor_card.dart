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
    return Hero(
      tag: doctor.name,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  fontSize: smallCard ? 15 : 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(doctor.jobTitle),
            ],
          ),
        ),
      ),
    );
  }
}
