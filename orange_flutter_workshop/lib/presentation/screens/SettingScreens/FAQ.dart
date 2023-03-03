import 'package:flutter/material.dart';
import 'package:orange_flutter_workshop/presentation/widgets/cutom_appbar.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: CustomAppBar(title: "FAQ")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10,
              child: const ExpansionTile(
                title: Text(
                  'Q1 : How many palapalplalalaal',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                children: <Widget>[
                  ListTile(
                      title: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '16 Country',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
