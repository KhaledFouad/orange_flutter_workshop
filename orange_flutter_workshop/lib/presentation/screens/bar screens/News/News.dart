import 'package:flutter/material.dart';
import 'package:orange_flutter_workshop/presentation/views/NewCardItem.dart';
import 'package:orange_flutter_workshop/presentation/widgets/cutom_appbar.dart';
import 'package:sizer/sizer.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),

        /// TODO: Get data form API.
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => const NewsCardItem(),
        ),
      ),
    );
  }
}
