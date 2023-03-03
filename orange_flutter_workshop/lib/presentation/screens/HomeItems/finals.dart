import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:orange_flutter_workshop/presentation/widgets/customText.dart';
import 'package:orange_flutter_workshop/presentation/widgets/cutom_appbar.dart';

class Finals extends StatelessWidget {
  const Finals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: CustomAppBar(title: "Finals")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
              child: CustomText(
            "Finals",
            fontSize: 20,
            fontweight: FontWeight.bold,
          ))
        ],
      ),
    );
  }
}
