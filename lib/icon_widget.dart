import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);

class IconWidget extends StatelessWidget {
  IconWidget({@required this.myIcon, @required this.gender, this.gendercolor});
  final IconData myIcon;
  final String gender;
  final Color gendercolor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          myIcon,
          size: 80,
          color: gendercolor,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
