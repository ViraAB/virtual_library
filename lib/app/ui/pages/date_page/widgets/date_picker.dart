import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../../../lang/translations.g.dart';

// ignore: must_be_immutable
class DatePickerItem extends StatefulWidget {
  DatePickerItem(
    this.date, {
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged<DateTime> onChanged;
  DateTime date;

  @override
  State<DatePickerItem> createState() => _DatePickerItemState();
}

class _DatePickerItemState extends State<DatePickerItem> {
  @override
  Widget build(BuildContext context) {
    void _showDialog(Widget child) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          left: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          right: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: Row(
        children: [
          CupertinoButton(
            onPressed: () => _showDialog(
              CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                use24hFormat: true,
                onDateTimeChanged: (DateTime newDate) {
                  setState(() => widget.date = newDate);
                  widget.onChanged(newDate);
                },
              ),
            ),
            child: Text(
              t.user_info_page.birthday,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '${widget.date.day}-${widget.date.month}-${widget.date.year}',
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
