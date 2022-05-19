import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable_card.dart';
import 'icon_widget.dart';
import 'results.dart';
import 'calculator_brain.dart';
import 'bottomButton.dart';
import 'results_bmr.dart';

const activeCardColour = Color(0xFF323244);
const inactiveCardColour = Color(0xFF111328);
const labelTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);
const numericStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);
enum GenderT { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderT selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  String valueChoose;
  List activityLevels = [
    "SEDENTARY",
    "LIGHTLY ACTIVE",
    "MODERATELY ACTIVE",
    "VERY ACTIVE",
    "EXTRA ACTIVE",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Color(0xFFe94560)),
        )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = GenderT.male;
                      });
                    },
                    child: ReuseableCard(
                      colour: selectedGender == GenderT.male
                          ? activeCardColour
                          : inactiveCardColour,
                      cardChild: IconWidget(
                        myIcon: FontAwesomeIcons.mars,
                        gender: 'MALE',
                        gendercolor: Color(0xFFa4ebf3),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = GenderT.female;
                      });
                    },
                    child: ReuseableCard(
                      colour: selectedGender == GenderT.female
                          ? activeCardColour
                          : inactiveCardColour,
                      cardChild: IconWidget(
                        myIcon: FontAwesomeIcons.venus,
                        gender: 'FEMALE',
                        gendercolor: Color(0xFFffaec0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF323244),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(left: 10, right: 10),
              child: DropdownButton(
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
              )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: Color(0xFF323244),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: numericStyle,
                            ),
                            Text(
                              'cm',
                              style: labelTextStyle,
                            )
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 220,
                          activeColor: Color(0xFFe94560),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: Color(0xFF323244),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: labelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: numericStyle,
                            ),
                            Text(
                              'kg',
                              style: labelTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight = --weight;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight = ++weight;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: Color(0xFF323244),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numericStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (GenderT == null || valueChoose == null) {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color(0xFFe94560),
                              title: Text("Something Missing!"),
                              content: Text("Please answer all questions."),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"))
                              ],
                            );
                          });
                    } else {
                      CalculatorBrain calc = CalculatorBrain(
                          height: height,
                          weight: weight,
                          age: age,
                          gender: selectedGender,
                          activity: valueChoose);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                    bmiResult: calc.calculateBMI(),
                                    resultText: calc.getResult(),
                                    resultComment: calc.getComment(),
                                    pickedColor: calc.colorPicker(),
                                    bmrResult: calc.calculateBMR(),
                                    calResult: calc.calculateCAL(),
                                  )));
                    }
                  },
                  child: MyBottomButton(
                    btnColor: Color(0xFFe94560),
                    btnName: 'BMI',
                    lblColor: Color(0xFF1a1a2e),
                  ),
                  // child: Align(
                  //   alignment: Alignment.bottomLeft,
                  //   child: FractionallySizedBox(
                  //     widthFactor: 0.5,
                  //     child: Container(
                  //       color: Color(0xFFe94560),
                  //       child: Center(
                  //         child: Text(
                  //           'BMI',
                  //           style: TextStyle(
                  //               color: Color(0xFF1a1a2e),
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 25),
                  //         ),
                  //       ),
                  //       margin: EdgeInsets.only(top: 10),
                  //       height: 70,
                  //       width: double.infinity / 2,
                  //     ),
                  //   ),
                  // ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (GenderT == null || valueChoose == null) {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color(0xFFe94560),
                              title: Text("Something Missing!"),
                              content: Text("Please answer all questions."),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"))
                              ],
                            );
                          });
                    } else {
                      CalculatorBrain calc = CalculatorBrain(
                          height: height,
                          weight: weight,
                          age: age,
                          gender: selectedGender,
                          activity: valueChoose);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultBmrPage(
                                    bmiResult: calc.calculateBMI(),
                                    resultText: calc.getResult(),
                                    resultComment: calc.getComment(),
                                    pickedColor: calc.colorPicker(),
                                    bmrResult: calc.calculateBMR(),
                                    calResult: calc.calculateCAL(),
                                    avIcon: calc.genderIconPicker(),
                                    genderAverage: calc.genderAveragePicker(),
                                  )));
                    }
                  },
                  child: MyBottomButton(
                    btnColor: Color(0xFF323244),
                    btnName: 'BMR',
                    lblColor: Color(0xFFe94560),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 2,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
