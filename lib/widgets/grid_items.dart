import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';

import '../constants/color.dart';
import '../data/data.dart';
import '../model/data.dart';
import 'doctor_card.dart';

class GridItems extends StatefulWidget {
  const GridItems({Key? key}) : super(key: key);

  @override
  State<GridItems> createState() => _GridItemsState();
}

class _GridItemsState extends State<GridItems> {
  List<Doctor> favDoctors = [];

  addToFav(Doctor doctor) {
    if (!favDoctors.contains(doctor)) {
      setState(() {
        favDoctors.insert(0, doctor);
        doctors.remove(doctor);
      });
    }
  }

  removeFromFav(Doctor doctor) {
    setState(() {
      favDoctors.remove(doctor);
      doctors.add(doctor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: doctors.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => addToFav(doctors[index]),
              child: DoctorCard(doctor: doctors[index]),
            ),
          ),
        ),
        Visibility(
          visible: favDoctors.isNotEmpty,
          child: Container(
            color: litePrimary,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'Favorite Doctors',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: favDoctors.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => removeFromFav(favDoctors[index]),
                        child: DoctorCard(
                          doctor: favDoctors[index],
                          smallCard: true,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
