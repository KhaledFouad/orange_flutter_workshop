import 'package:flutter/material.dart';
import 'package:orange_flutter_workshop/presentation/styles/Colors.dart';
import 'package:orange_flutter_workshop/data/models/midtermModel.dart';
import 'package:orange_flutter_workshop/presentation/views/MidtermCard.dart';
import 'package:orange_flutter_workshop/presentation/widgets/cutom_appbar.dart';

class Midterms extends StatelessWidget {
  const Midterms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: CustomAppBar(title: "Midterms")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: MidtermCard(
            midterm: MidtermModel(
                title: "Flutter",
                duration: "2",
                date: "2022-08-18",
                startTime: "12:00pm",
                endTime: "2:00pm")),
      ),
    );
  }
}
