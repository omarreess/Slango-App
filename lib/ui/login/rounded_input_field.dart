 import 'package:Slango/ui/login/text_field_container.dart';
import 'package:flutter/material.dart';


import '../../model/Constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  TextEditingController controller;
  final ValueChanged<String> onChanged;
    RoundedInputField({
    Key key,
    this.hintText,
      this.controller,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,

        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
