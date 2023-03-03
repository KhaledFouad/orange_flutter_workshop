// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_flutter_workshop/presentation/styles/Colors.dart';
import 'package:orange_flutter_workshop/presentation/widgets/customText.dart';
import 'package:orange_flutter_workshop/presentation/widgets/cutom_appbar.dart';
import 'package:sizer/sizer.dart';

//This screen is details of note
class DetailsOfNoteScreen extends StatelessWidget {
  String? description;
  String? title;
  var date;

  DetailsOfNoteScreen({
    super.key,
    required this.description,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(55),
            child: CustomAppBar(title: "Note")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              //Title
              SizedBox(height: 10.h),
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: CustomText(
                  '$title',
                  textColor: Colors.black,
                  fontSize: 15.sp,
                ),
              ),

              //Date
              Container(
                margin: EdgeInsets.only(left: 30),
                child: CustomText(
                  '$date',
                  textColor: Colors.black,
                  fontSize: 15.sp,
                ),
              ),

              //Description
              SizedBox(height: 5.h),
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Text("${description}",
                    style: TextStyle(
                      fontSize: 15.sp,
                    )),
              ),
            ],
          ),
        ));
  }
}
