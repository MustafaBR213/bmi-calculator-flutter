// TODO Implement this library.
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CrdWidget_content.dart';
import 'Resuble_Card.dart';
import 'constant.dart';
import 'result.dart';
import 'cal_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 12;
  // Color maleCardColor = inActiveCardColor;
  // Color femaleCardColor = inActiveCardColor;

  // //1== male 2==female
  // void updateColor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleCardColor == inActiveCardColor) {
  //       maleCardColor = activeColor;
  //       femaleCardColor = inActiveCardColor;
  //     } else {
  //       maleCardColor = inActiveCardColor;
  //     }
  //   }
  //   if (gender == Gender.female) {
  //     if (femaleCardColor == inActiveCardColor) {
  //       femaleCardColor = activeColor;
  //       maleCardColor = inActiveCardColor;
  //     } else {
  //       femaleCardColor = inActiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ResubleCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? activeColor
                            : inActiveCardColor,
                        cardChild: CrdWidget(
                            icon: FontAwesomeIcons.mars, label: "Male"),
                      ),
                    ),
                    Expanded(
                        child: ResubleCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? activeColor
                          : inActiveCardColor,
                      cardChild: CrdWidget(
                        icon: FontAwesomeIcons.venus,
                        label: "Female",
                      ),
                    )),
                  ],
                ),
              ),
              Expanded(
                  child: ResubleCard(
                colour: activeColor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Height",
                        style: labelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: KNumberStyle,
                          ),
                          Text(
                            'cm',
                            style: labelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0)),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ]),
              )),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ResubleCard(
                      colour: activeColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Weight",
                            style: labelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: KNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  })
                            ],
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                        child: ResubleCard(
                      colour: activeColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Age",
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: KNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              BottomButton(
                  onTap: () {
                    CalBMI c1 = CalBMI(height: height, weight: weight);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Result(
                          bmiResult: c1.calucateBMI(),
                          resultText: c1.getResult(),
                          interpration: c1.getInterpration(),
                        )));
                  },
                  buttonTitle: "Calucate"),
            ]));
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: KLargeButtonTextStyle,
        )),
        color: bottomColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContinerHeight,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onpressed});
  final IconData icon;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
