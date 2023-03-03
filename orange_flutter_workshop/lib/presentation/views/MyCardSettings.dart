// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyCardSettings extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const MyCardSettings({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        onTap: onTap,
        title: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        trailing: const Icon(
          Icons.navigate_next,
        ),
      ),
    );
  }
}
