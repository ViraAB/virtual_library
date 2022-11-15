import 'package:books/app/ui/pages/date_page/widgets/gender.dart';
import 'package:books/app/ui/utils/build_context_ext.dart';
import 'package:books/app/ui/utils/get_user_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../../lang/translations.g.dart';
import '../../routes/routes.dart';
import '../../utils/validator_email.dart';
import 'widgets/date_picker.dart';
import 'widgets/text_field_decoration.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();
    TextEditingController _phoneNumberController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _authorController = TextEditingController();
    String _gender = "";
    DateTime? _date;

    DateTime date = DateTime.now();

    return Form(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 98, 129, 127),
          elevation: 0,
          centerTitle: true,
          title: Text(
            t.user_info_page.personal_information,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  Routes.homePage,
                ),
                child: Text(
                  t.user_info_page.skip,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              children: [
                Text(
                  t.user_info_page.more_info,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 10.h,
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? t.user_info_page.empty_field : null,
                    decoration: inputDecoration(context, t.general.name),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z]"),
                      ),
                      LengthLimitingTextInputFormatter(20),
                    ],
                    keyboardType: TextInputType.name,
                    controller: _nameController,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 10.h,
                  child: TextFormField(
                    decoration:
                        inputDecoration(context, t.general.last_name),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z ]"),
                      ),
                      LengthLimitingTextInputFormatter(30),
                    ],
                    validator: (value) =>
                        value!.isEmpty ? t.user_info_page.empty_field : null,
                    keyboardType: TextInputType.name,
                    controller: _lastNameController,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 10.h,
                  child: TextFormField(
                    decoration: inputDecoration(
                      context,
                      t.general.phone_number,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[0-9]"),
                      ),
                      LengthLimitingTextInputFormatter(10),
                    ],
                    validator: (value) =>
                        value!.isEmpty ? t.user_info_page.empty_field : null,
                    keyboardType: TextInputType.number,
                    controller: _phoneNumberController,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 10.h,
                  child: TextFormField(
                    decoration:
                        inputDecoration(context, t.general.email),
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return t.user_info_page.empty_field;
                      } else if (!isValidEmail(value)) {
                        return t.user_info_page.valid_email;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                ),
                const SizedBox(height: 10),
                DatePickerItem(
                  date,
                  onChanged: (DateTime dateValue) {
                    _date = dateValue;
                  },
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 10.h,
                  child: TextFormField(
                    decoration: inputDecoration(
                      context,
                      t.general.favorite_author,
                    ),
                    validator: (value) =>
                        value!.isEmpty ? t.user_info_page.empty_field : null,
                    controller: _authorController,
                  ),
                ),
                const SizedBox(height: 10),
                Gender(
                  onChanged: (String genderValue) {
                    _gender = genderValue;
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 10.w),
          child: Container(
            width: 30.w,
            color: const Color.fromARGB(255, 87, 151, 204),
            child: Builder(
              builder: (context) {
                var textButton = TextButton(
                  child: Text(
                    t.user_info_page.save,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () async {
                    if (Form.of(context)!.validate()) {
                      saveUpdateData(
                        _nameController.text,
                        _lastNameController.text,
                        _phoneNumberController.text,
                        _emailController.text,
                        _date,
                        _gender,
                        _authorController.text,
                      );
                      if (_date.runtimeType == Null) {
                        context.showSnackbar(
                          Text(t.user_info_page.date_of_birth),
                        );
                      } else if (_gender.isEmpty) {
                        context.showSnackbar(
                          Text(t.user_info_page.select_gender),
                        );
                      } else {
                        Navigator.pushNamed(
                          context,
                          Routes.homePage,
                        );
                      }
                    }
                  },
                );
                return textButton;
              },
            ),
          ),
        ),
      ),
    );
  }
}
