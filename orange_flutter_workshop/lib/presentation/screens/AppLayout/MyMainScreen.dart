import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:orange_flutter_workshop/presentation/screens/bar%20screens/Settings/Settings.dart';
import 'package:orange_flutter_workshop/presentation/screens/bar%20screens/News/News.dart';
import 'package:orange_flutter_workshop/presentation/screens/bar%20screens/home/home.dart';

class MyMainScreen extends StatefulWidget {
  const MyMainScreen({super.key});

  @override
  State<MyMainScreen> createState() => _MyMainScreenState();
}

class _MyMainScreenState extends State<MyMainScreen> {
  static const List<Widget> screens = <Widget>[Home(), News(), Settings()];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: screens.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavyBar(
                selectedIndex: _selectedIndex,
                showElevation: true,
                itemCornerRadius: 24,
                curve: Curves.easeIn,
                onItemSelected: (index) =>
                    setState(() => _selectedIndex = index),
                items: <BottomNavyBarItem>[
                  BottomNavyBarItem(
                      icon: const Icon(Icons.home_outlined),
                      title: const Text('Home'),
                      activeColor: Colors.orange,
                      textAlign: TextAlign.start,
                      inactiveColor: Colors.black),
                  BottomNavyBarItem(
                      icon: const Icon(Icons.newspaper_outlined),
                      title: const Text('News'),
                      activeColor: Colors.orange,
                      textAlign: TextAlign.center,
                      inactiveColor: Colors.black),
                  BottomNavyBarItem(
                      icon: const Icon(Icons.settings_outlined),
                      title: const Text('Settings'),
                      activeColor: Colors.orange,
                      textAlign: TextAlign.center,
                      inactiveColor: Colors.black)
                ])));
  }
}
