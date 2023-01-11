import 'package:avatar_anime/widgets/grid_items.dart';
import 'package:flutter/material.dart';
import 'constants/color.dart';
import 'package:local_hero/local_hero.dart';

import 'model/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: primaryColor,
          child: const Icon(Icons.info),
        ),
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage('imgs/doctor.jpg'),
              ),
              SizedBox(width: 10),
              Text('Doctors SideKick'),
            ],
          ),
        ),
        body: const LocalHeroScope(
            duration: Duration(seconds: 1),
            curve: Curves.easeIn,
            child: GridItems()));
  }
}
