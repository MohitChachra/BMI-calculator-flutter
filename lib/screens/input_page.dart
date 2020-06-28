import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
enum Gender{
  male,
  female,
}
int height=180;
int weight=60;
int age=20;
class _InputPageState extends State<InputPage> {
  Gender selectedGender;

//  Color maleCardColor = inactiveCardColour;
//  Color femaleCardColor = inactiveCardColour;
//  void updateCardColour(Gender selectedGender){
//    //male=1, female=2
//    if(selectedGender==Gender.male){
//      if(maleCardColor==inactiveCardColour)
//        maleCardColor=activeCardColour;
//      femaleCardColor = inactiveCardColour;
//    }
//    else{
//      maleCardColor=inactiveCardColour;
//    }
//    //female card pressed
//    if(selectedGender==Gender.female){
//      if(femaleCardColor==inactiveCardColour)
//        femaleCardColor=activeCardColour;
//      maleCardColor=inactiveCardColour;
//    }
//    else{
//      femaleCardColor=inactiveCardColour;
//    }
//    }

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
                  child: ReusableCard(
                      onPress:(){
                        setState(() {
                          selectedGender=Gender.male;
                        });
                      },
                      colour: selectedGender==Gender.male?kActiveCardColour:kInactiveCardColour,
                      cardChild: IconContent(icon: FontAwesomeIcons.mars,label:'MALE'),
                ),
                ),
                Expanded(
                      child: ReusableCard(
                        onPress:(){
                          setState(() {
                            selectedGender=Gender.female;
                          });
                        },
                          colour: selectedGender==Gender.female?kActiveCardColour:kInactiveCardColour,
                        cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE'),
                      ),
                ),
              ],
            ),
          ),
          Expanded(
              child:  ReusableCard(
                  colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT',style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(),style: kNumberTextStyle,
                        ),
                        Text('cm',style: kLabelTextStyle,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8098),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min:120,
                          max:220,
                           
                          onChanged: (double newValue){
                            setState(() {
                              height=newValue.round();
                            });

                      },
                      ),
                    )
                  ],
                ),
              ),

          ),
          Expanded(
            child: Row(

              children: <Widget>[
                Expanded(
                    child:  ReusableCard(
                        colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT',style: kLabelTextStyle,),
                          Text(weight.toString(),style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon:FontAwesomeIcons.minus,
                                  onPressed:(){
                                    setState(() {
                                      weight--;
                                    });
                                  }
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon:FontAwesomeIcons.plus,
                                onPressed:(){
                                    setState(() {
                                      weight++;
                                    });
                                }
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                ),
                Expanded(
                    child:  ReusableCard(
                        colour:kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE',style: kLabelTextStyle,),
                          Text(age.toString(),style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon:FontAwesomeIcons.minus,
                                  onPressed:(){
                                    setState(() {
                                      age--;
                                    });
                                  }
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon:FontAwesomeIcons.plus,
                                  onPressed:(){
                                    setState(() {
                                      age++;
                                    });
                                  }
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Calculate',
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
              Navigator.push(context,
                  MaterialPageRoute(

                      builder: (context)=>ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      )
                  )
                );
            },
          )
        ],
      )
    );
  }
}









