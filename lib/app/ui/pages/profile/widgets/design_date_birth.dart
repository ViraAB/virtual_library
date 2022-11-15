import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../../lang/translations.g.dart';
import '../../../utils/get_user_information.dart';

class BoxDesignDateBirth extends StatelessWidget {
  const BoxDesignDateBirth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int yearOld = 0;
    String dateOfBirth = '';

    if (UserInfo.dateOfBirth != null) {
      yearOld = DateTime.now().difference(UserInfo.dateOfBirth!).inDays ~/ 365;
      dateOfBirth = DateFormat.yMd().format(UserInfo.dateOfBirth!);
    }

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
                t.profile_page.birth,
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
            Expanded(
              child: Text(
                t.profile_page.years,
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
                    dateOfBirth,
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
