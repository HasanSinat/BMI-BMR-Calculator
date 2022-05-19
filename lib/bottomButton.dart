import "package:flutter/material.dart";

class MyBottomButton extends StatelessWidget {
  MyBottomButton(
      {@required this.btnColor,
      @required this.btnName,
      @required this.lblColor});
  final Color btnColor;
  final String btnName;
  final Color lblColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: btnColor,
      child: Center(
        child: Text(
          btnName,
          style: TextStyle(
              color: lblColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      margin: EdgeInsets.only(top: 10),
      height: 70,
    );
  }
}
