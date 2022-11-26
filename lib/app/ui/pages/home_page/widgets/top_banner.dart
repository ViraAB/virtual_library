import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({
    Key? key,
    required this.label,
    this.textStyle = const TextStyle(
      color: Colors.white,
    ),
    this.backgroundColor = Colors.green,
    this.isError = false,
  }) : super(key: key);

  final String label;
  final Color backgroundColor;
  final TextStyle textStyle;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          (isError)
              ? Icon(
                  Icons.cancel,
                  color: textStyle.color,
                )
              : Icon(
                  Icons.check_circle,
                  color: textStyle.color,
                ),
          const SizedBox(
            width: 6.0,
          ),
          Expanded(
            child: Text(
              label,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
