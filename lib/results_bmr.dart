import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultBmrPage extends StatelessWidget {
  ResultBmrPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.resultComment,
      @required this.pickedColor,
      this.bmrResult,
      this.calResult,
      this.avIcon,
      this.genderAverage});

  final String bmiResult;
  final String resultText;
  final String resultComment;
  final Color pickedColor;
  final String bmrResult;
  final String calResult;
  final Icon avIcon;
  final String genderAverage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your BMR Result',
          style: TextStyle(
              color: Color(0xFFe94560),
              fontSize: 35,
              fontWeight: FontWeight.w900),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color(0xFF323244),
                  borderRadius: BorderRadius.circular(0)),
              child: Text(
                "Basal metabolic rate is a measurement of the number of calories needed to perform your body's most basic functions.",
                maxLines: 4,
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              )),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: Color(0xFF323244),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your BMR Result: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  bmrResult,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: Color(0xFF323244),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                avIcon,
                Expanded(
                  child: Text(
                    genderAverage,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Color(0xFF323244),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Calorie Need: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  calResult,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Color(0xFFe94560),
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(
                        color: Color(0xFF1a1a2e),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                height: 70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
