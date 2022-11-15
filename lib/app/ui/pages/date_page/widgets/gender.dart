import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../lang/translations.g.dart';

enum GenderOptions { W, M, O }

class Gender extends StatefulWidget {
  const Gender({Key? key, required this.onChanged}) : super(key: key);

  final ValueChanged<Enum> onChanged;

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
          'W': GenderOptions.W,
          'M': GenderOptions.M,
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
                      value: GenderOptions.W,
                      groupValue: _gender,
                      onChanged: (_) {
                        setState(() {
                          _gender = GenderOptions.W;
                          widget.onChanged(GenderOptions.W);
                        });
                      },
                    ),
                    Expanded(child: Text(t.general.woman))
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(
                      value: GenderOptions.M,
                      groupValue: _gender,
                      onChanged: (_) {
                        setState(() {
                          _gender = GenderOptions.M;
                          widget.onChanged(GenderOptions.M);
                        });
                      },
                    ),
                    Expanded(child: Text(t.general.men))
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
                          widget.onChanged(GenderOptions.O);
                        });
                      },
                    ),
                    Expanded(child: Text(t.general.omit))
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
