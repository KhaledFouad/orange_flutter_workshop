import 'package:flutter/material.dart';
import 'package:orange_flutter_workshop/presentation/widgets/customText.dart';
import 'package:sizer/sizer.dart';

class NewsCardItem extends StatelessWidget {
  const NewsCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(3.sp),
            child: CircleAvatar(
              radius: 30.sp,
              backgroundImage: const NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png',
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const CustomText('title'),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 1.5.h),
                  child: CustomText(
                    fontSize: 8.sp,
                    'title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title itle title title title title title title title ',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
