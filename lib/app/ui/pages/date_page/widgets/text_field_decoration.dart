import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

InputDecoration inputDecoration(BuildContext context, [String? hintText]) {
  return InputDecoration(
    hintText: hintText ?? "",
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(3.w),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(3.w),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(3.w),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(3.w),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
    ),
  );
}
