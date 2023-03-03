import 'package:flutter/material.dart';
import 'package:orange_flutter_workshop/presentation/widgets/customText.dart';

import '../../data/models/HomeCardModel.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.homeCardModel,
    Key? key,
  }) : super(key: key);

  HomeCardModel homeCardModel;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => homeCardModel.screen,
              ));
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  maxRadius: 30,
                  backgroundColor: Color.fromARGB(255, 227, 227, 227),
                  child: Icon(
                    homeCardModel.icon,
                    color: Colors.orange,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  homeCardModel.title,
                  fontSize: 20,
                  fontweight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
