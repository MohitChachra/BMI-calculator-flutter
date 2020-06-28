import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.interpretation, @required this.bmiResult, @required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[Text(
                  resultText.toUpperCase(),style: kResultTextStyle,
                ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text('Your BMI result is quite low,you should eat more',style: kBodyTextStyle,
                  textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'Re-Calculate',
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      )
    );
  }
}