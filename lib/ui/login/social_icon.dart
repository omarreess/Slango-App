import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/Constants.dart';

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocalIcon({
    Key key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.5),
        padding: EdgeInsets.all(15),
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,

        ),
      ),
    );
  }
}
