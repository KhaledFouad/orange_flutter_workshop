import 'package:flutter/material.dart';
import 'package:orange_flutter_workshop/presentation/styles/Colors.dart';
import 'package:orange_flutter_workshop/data/models/midtermModel.dart';

class MidtermCard extends StatelessWidget {
  MidtermModel midterm;
  MidtermCard({required this.midterm});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  midterm.title,
                  style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.timer,
                          size: 18,
                          color: AppColor.textColor,
                        ),
                      ),
                      TextSpan(
                        text: " ${midterm.duration}hr",
                        style: TextStyle(
                            color: AppColor.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Exam Date",
                        style: TextStyle(
                            color: AppColor.supWidgetColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.calendar_month,
                              size: 18,
                              color: AppColor.textColor,
                            ),
                          ),
                          TextSpan(
                              text: "${midterm.date}",
                              style: TextStyle(
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Start Time",
                        style: TextStyle(
                            color: AppColor.supWidgetColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    RichText(
                      text: TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(
                              Icons.access_time_filled_rounded,
                              color: Colors.green,
                            ),
                          ),
                          TextSpan(
                              text: "${midterm.startTime}",
                              style: TextStyle(
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("End Time",
                        style: TextStyle(
                            color: AppColor.supWidgetColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    RichText(
                      text: TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(
                              Icons.access_time_filled_rounded,
                              color: Colors.red,
                            ),
                          ),
                          TextSpan(
                              text: "${midterm.endTime}",
                              style: TextStyle(
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
