import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_svg/flutter_svg.dart';

class SocalIconShare extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocalIconShare({
    Key key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(size.height*0.022),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.black12,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          height: size.height*0.03,
          width: size.height*0.03,
        ),
      ),
    );
  }
}
