import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../lang/translations.g.dart';

enum GenderOptions { M, H, O }

class Gender extends StatefulWidget {
  const Gender({Key? key, required this.onChanged}) : super(key: key);

  final ValueChanged<String> onChanged;

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  GenderOptions? _gender;

  @override
  void initState() {
    super.initState();

    final tmp = ('').split(' ');

    if (tmp.isNotEmpty) {
      final savedGender = tmp.first;
      if (savedGender.length == 1) {
        _gender = {
          'M': GenderOptions.M,
          'H': GenderOptions.H,
          'O': GenderOptions.O,
        }[tmp.first];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.general.gender),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Radio(
                      value: GenderOptions.M,
                      groupValue: _gender,
                      onChanged: (_) {
                        setState(() {
                          _gender = GenderOptions.M;
                          widget.onChanged("Mujer");
                        });
                      },
                    ),
                    Expanded(child: Text(t.user_info_page.woman))
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(
                      value: GenderOptions.H,
                      groupValue: _gender,
                      onChanged: (_) {
                        setState(() {
                          _gender = GenderOptions.H;
                          widget.onChanged("Hombre");
                        });
                      },
                    ),
                    Expanded(child: Text(t.user_info_page.men))
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(
                      value: GenderOptions.O,
                      groupValue: _gender,
                      onChanged: (_) {
                        setState(() {
                          _gender = GenderOptions.O;
                          widget.onChanged("Omitir");
                        });
                      },
                    ),
                    Expanded(child: Text(t.user_info_page.omit))
                  ],
                ),
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
