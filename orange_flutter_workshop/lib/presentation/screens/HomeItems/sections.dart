import 'package:flutter/material.dart';
import 'package:orange_flutter_workshop/presentation/widgets/customText.dart';
import 'package:orange_flutter_workshop/presentation/widgets/cutom_appbar.dart';

class Sections extends StatelessWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: CustomAppBar(title: "Sections")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
              child: CustomText(
            "Sections",
            fontSize: 20,
            fontweight: FontWeight.bold,
          ))
        ],
      ),
    );
  }
}
