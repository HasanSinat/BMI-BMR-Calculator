import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.resultComment,
      @required this.pickedColor,
      this.bmrResult,
      this.calResult});

  final String bmiResult;
  final String resultText;
  final String resultComment;
  final Color pickedColor;
  final String bmrResult;
  final String calResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your BMI Result',
          style: TextStyle(
              color: Color(0xFFe94560),
              fontSize: 35,
              fontWeight: FontWeight.w900),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Color(0xFF323244), borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 140,
                  ),
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: pickedColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Text(
                resultComment,
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1,
                ),
                maxLines: 3,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
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
          ],
        ),
      ),
    );
  }
}
