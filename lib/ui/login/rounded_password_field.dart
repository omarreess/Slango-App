import 'package:Slango/ui/login/text_field_container.dart';
 import 'package:flutter/material.dart';

import '../../model/Constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  TextEditingController controller;
    RoundedPasswordField({
    Key key,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        controller: controller,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
