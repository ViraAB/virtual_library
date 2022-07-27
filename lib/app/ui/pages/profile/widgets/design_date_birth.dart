import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/get_user_information.dart';

class BoxDesignDateBirth extends StatelessWidget {
  const BoxDesignDateBirth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int yearOld =
        DateTime.now().difference(UserInfo.dateOfBirth!).inDays ~/ 365;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.5.h),
        Row(
          children: [
            SizedBox(
              width: 7.w,
              child: const Icon(Icons.star),
            ),
            Expanded(
              child: Text(
                "Nacimiento",
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
            Expanded(
              child: Text(
                "Años",
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 2.w),
                height: 5.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.w),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${UserInfo.dateOfBirth!.day} -'
                    '${UserInfo.dateOfBirth!.month}-'
                    '${UserInfo.dateOfBirth!.year}',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
              ),
            ),
            SizedBox(width: 5.w),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 2.w),
                height: 5.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.w),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "$yearOld",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
