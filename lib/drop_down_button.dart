import 'package:flutter/material.dart';

class ActivitySelectionButton extends StatefulWidget {
  @override
  _ActivitySelectionButtonState createState() =>
      _ActivitySelectionButtonState();
}

class _ActivitySelectionButtonState extends State<ActivitySelectionButton> {
  String valueChoose;
  List activityLevels = [
    "SEDENTARY",
    "LIGHTLY ACTIVE",
    "MODERATELY ACTIVE",
    "VERY ACTIVE",
    "EXTRA ACTIVE ",
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Center(child: Text('ACTIVITY LEVEL')),
      underline: SizedBox(),
      isExpanded: true,
      dropdownColor: Color(0xFF323244),
      value: valueChoose,
      onChanged: (newValue) {
        setState(() {
          valueChoose = newValue;
        });
      },
      items: activityLevels.map((valueItem) {
        return DropdownMenuItem<String>(
          value: valueItem,
          child: Center(child: Text(valueItem)),
        );
      }).toList(),
    );
  }
}
