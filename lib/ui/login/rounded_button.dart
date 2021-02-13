import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/Constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: Container(
          decoration: BoxDecoration(
             // gradient: gradient
            color: kPrimaryColor
          ),
          child: FlatButton(
             padding:EdgeInsets.all(20) ,
            // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
           // color: color,


            onPressed: press,
            child: Text(
              text,

              style: TextStyle( color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
