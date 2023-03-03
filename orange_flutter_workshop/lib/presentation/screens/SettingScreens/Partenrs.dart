import 'package:flutter/material.dart';
import 'package:orange_flutter_workshop/presentation/widgets/cutom_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class Partenrs extends StatefulWidget {
  const Partenrs({super.key});

  @override
  State<Partenrs> createState() => _PartenrsState();
}

class _PartenrsState extends State<Partenrs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: CustomAppBar(title: "Our Partners")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InkWell(
              onTap: _launchURL,
              child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey,
                        Colors.white,
                        Colors.grey,
                      ],
                    ),
                  ),
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        text: 'Orange',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Digital',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: ' center',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.orangedigitalcenters.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
