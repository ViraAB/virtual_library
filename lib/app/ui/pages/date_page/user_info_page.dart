import 'package:books/app/ui/pages/date_page/widgets/gender.dart';
import 'package:books/app/ui/utils/build_context_ext.dart';
import 'package:books/app/ui/utils/get_user_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

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
          title: const Text(
            "Información Personal",
            style: TextStyle(
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
                child: const Text(
                  'Skip',
                  style: TextStyle(
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
                const Text(
                  "Antes de mostrarte la biblioteca virtual, "
                  "nos gutaria saber un poco de ti:",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 10.h,
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? "Campo vacio" : null,
                    decoration: inputDecoration(context, "Nombre"),
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
                    decoration: inputDecoration(context, "Apellidos"),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z ]"),
                      ),
                      LengthLimitingTextInputFormatter(30),
                    ],
                    validator: (value) => value!.isEmpty ? "Campo vacio" : null,
                    keyboardType: TextInputType.name,
                    controller: _lastNameController,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 10.h,
                  child: TextFormField(
                    decoration: inputDecoration(context, "Telefono"),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[0-9]"),
                      ),
                      LengthLimitingTextInputFormatter(10),
                    ],
                    validator: (value) => value!.isEmpty ? "Campo vacio" : null,
                    keyboardType: TextInputType.number,
                    controller: _phoneNumberController,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 10.h,
                  child: TextFormField(
                    decoration: inputDecoration(context, "email"),
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo vacio";
                      } else if (!isValidEmail(value)) {
                        return "Escribe un correo valido";
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
                    decoration: inputDecoration(context, "Autor favorito"),
                    validator: (value) => value!.isEmpty ? "Campo vacio" : null,
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
                  child: const Text(
                    "Guardar",
                    style: TextStyle(
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
                          const Text("Ingresa tu fecha de nacimiento"),
                        );
                      } else if (_gender.isEmpty) {
                        context.showSnackbar(
                          const Text("Seleccion alguna opcion de genero"),
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
