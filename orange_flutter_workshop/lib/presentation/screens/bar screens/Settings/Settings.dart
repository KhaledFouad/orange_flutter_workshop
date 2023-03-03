import 'package:flutter/material.dart';
import 'package:orange_flutter_workshop/presentation/screens/SettingScreens/FAQ.dart';
import 'package:orange_flutter_workshop/presentation/screens/SettingScreens/Partenrs.dart';
import 'package:orange_flutter_workshop/presentation/screens/SettingScreens/Support.dart';
import 'package:orange_flutter_workshop/presentation/screens/SettingScreens/Terms.dart';
import 'package:orange_flutter_workshop/presentation/screens/login/LogInScreen.dart';
import 'package:orange_flutter_workshop/presentation/views/MyCardSettings.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Flexible(
                  child: ListView(children: [
                MyCardSettings(
                    text: "FAQ",
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const FAQ()));
                    }),
                MyCardSettings(
                  text: "Terms & Conditions",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Terms()));
                  },
                ),
                MyCardSettings(
                    text: "Our Partenrs",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Partenrs()));
                    }),
                MyCardSettings(
                    text: "Support",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Support()));
                    }),
                MyCardSettings(
                    text: "Log out",
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text('LogOut'),
                                content: const Text('Are you sure?'),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      minimumSize: const Size(125, 40),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                      );
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        width: 2,
                                        color: Colors.orange,
                                      ),
                                      foregroundColor: Colors.orange,
                                      shadowColor: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      minimumSize: const Size(125, 40),
                                    ),
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LogInScreen(),
                                          ),
                                          (route) => false);
                                    },
                                    child: const Text(
                                      "Sure",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  )
                                ],
                              ));
                    }),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
