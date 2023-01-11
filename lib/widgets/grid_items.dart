import 'package:flutter/material.dart';

import '../data/data.dart';

class GridItems extends StatefulWidget {
  const GridItems({Key? key}) : super(key: key);

  @override
  State<GridItems> createState() => _GridItemsState();
}

class _GridItemsState extends State<GridItems> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: doctors.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(doctors[index].imgUrl),
                radius: 50,
              ),
              const SizedBox(height: 10),
              Text(
                doctors[index].name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(doctors[index].jobTitle),
            ],
          ),
        ),
      ),
    );
  }
}
