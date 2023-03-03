import 'package:flutter/material.dart';
import 'package:orange_flutter_workshop/data/models/HomeCardModel.dart';
import 'package:orange_flutter_workshop/presentation/screens/HomeItems/events.dart';
import 'package:orange_flutter_workshop/presentation/screens/HomeItems/finals.dart';
import 'package:orange_flutter_workshop/presentation/screens/HomeItems/lecture.dart';
import 'package:orange_flutter_workshop/presentation/screens/HomeItems/midterms.dart';
import 'package:orange_flutter_workshop/presentation/screens/HomeItems/sections.dart';

import 'package:orange_flutter_workshop/presentation/screens/HomeItems/notes/notes.dart';
import 'package:orange_flutter_workshop/presentation/views/customCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<HomeCardModel> homeCardModelDummyDataList = [
    HomeCardModel(
        title: 'Lectures', icon: Icons.book, screen: const Lectures()),
    HomeCardModel(
        title: 'Sections', icon: Icons.people, screen: const Sections()),
    HomeCardModel(
        title: 'Midterms',
        icon: Icons.menu_book_sharp,
        screen: const Midterms()),
    HomeCardModel(
        title: 'Finals', icon: Icons.note_alt, screen: const Finals()),
    HomeCardModel(title: 'Events', icon: Icons.event, screen: const Events()),
    HomeCardModel(title: 'Notes', icon: Icons.note, screen: const Notes()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                const Text(
                  "Orange ",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Digital center",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Home",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Flexible(
              flex: 4,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: homeCardModelDummyDataList.length,
                itemBuilder: (context, index) => CustomCard(
                  homeCardModel: homeCardModelDummyDataList[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
