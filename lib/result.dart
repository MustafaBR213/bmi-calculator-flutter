import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CrdWidget_content.dart';
import 'Resuble_Card.dart';
import 'constant.dart';
import 'input_page.dart';

class Result extends StatelessWidget {
  Result({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpration,
  });
  final String bmiResult;
  final String resultText;
  final String interpration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calucater"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Your Result",
              style: KTitleTextStyle,
            ),
          )),
          Expanded(
              flex: 5,
              child: ResubleCard(
                colour: activeColor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText.toUpperCase(),
                        style: KResultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: KBMITextStyle,
                      ),
                      Text(
                        interpration,
                        textAlign: TextAlign.center,
                        style: KBodyTextStyle,
                      ),
                    ]),
              )),
          BottomButton(
              onTap: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              buttonTitle: "Re-Calucate"),
        ],
      ),
    );
  }
}
