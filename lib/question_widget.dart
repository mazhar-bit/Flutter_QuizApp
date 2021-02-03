import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio/checkbox_widget.dart';
import 'package:flutter_radio/app_enum.dart';
import 'package:flutter_radio/question.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum AppEnum { optionA, optionB, optionC, optionD, NON }

//  RadioListTile<AppEnum>(
// title: Text (item.optionB),
// value: AppEnum.optionB,
// groupValue: _character,
// onChanged: (AppEnum value) {
// setState(() {
// _character = value;
// });
// },
// ),
class QuestionWidget extends StatefulWidget {
  Question question;
  CarouselController buttonCarouselController;

  QuestionWidget(
      this.question,
      this.buttonCarouselController, {
        Key key,
      }) : super(key: key);

  @override
  _QuestionWidgetState createState() =>
      _QuestionWidgetState(question, buttonCarouselController);
}

class _QuestionWidgetState extends State<QuestionWidget> {
  _QuestionWidgetState(this.item, this.buttonCarouselController);

  CarouselController buttonCarouselController;

  Question item;

  AppEnum _character = AppEnum.NON;

  bool _isSelectedA = false;
  bool _isSelectedB = false;
  bool _isSelectedC = false;
  bool _isSelectedD = false;

  int radio = 1;
  int check = 2;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: <Widget>[
          item.type == check ? getCheckBoxWidget(item) : getRadioWidget(item),
          SizedBox(
            height: 30.0,
          ),
          actionButton(),
        ]));
  }

  onVerifyClick() {
    var msg = "";

    if (item.type == radio) {
      if (_character == AppEnum.optionA && item.optionA == item.ans ||
          _character == AppEnum.optionB && item.optionB == item.ans ||
          _character == AppEnum.optionC && item.optionC == item.ans ||
          _character == AppEnum.optionD && item.optionD == item.ans) {
        msg = "Correct";
      } else {
        msg = "Incorrect";
      }
    } else {
      if (_isSelectedA && item.optionA == item.ans ||
          _isSelectedB && item.optionB == item.ans ||
          _isSelectedC && item.optionC == item.ans ||
          _isSelectedD && item.optionD == item.ans) {
        msg = "Correct";
      } else {
        msg = "Incorrect";
      }
    }

    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Widget getRadioWidget(Question item) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.question,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          RadioListTile <AppEnum>(
            title: Text(item.optionA),
            value: AppEnum.optionA,
            groupValue: _character,
            onChanged: (AppEnum value) {
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<AppEnum>(
            title: Text(item.optionB),
            value: AppEnum.optionB,
            groupValue: _character,
            onChanged: (AppEnum value) {
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<AppEnum>(
            title: Text(item.optionC),
            value: AppEnum.optionC,
            groupValue: _character,
            onChanged: (AppEnum value) {
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<AppEnum>(
            title: Text(item.optionD),
            value: AppEnum.optionD,
            groupValue: _character,
            onChanged: (AppEnum value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ]);
  }

  Widget getCheckBoxWidget(Question item) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.question,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          CheckBoxWidget(
            label: item.optionA,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _isSelectedA,
            onChanged: (bool newValue) {
              setState(() {
                _isSelectedA = newValue;
              });
            },
          ),
          CheckBoxWidget(
            label: item.optionB,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _isSelectedB,
            onChanged: (bool newValue) {
              setState(() {
                _isSelectedB = newValue;
              });
            },
          ),
          CheckBoxWidget(
            label: item.optionC,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _isSelectedC,
            onChanged: (bool newValue) {
              setState(() {
                _isSelectedC = newValue;
              });
            },
          ),
          CheckBoxWidget(
            label: item.optionD,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _isSelectedD,
            onChanged: (bool newValue) {
              setState(() {
                _isSelectedD = newValue;
              });
            },
          ),
        ]);
  }

  Widget actionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          color: const Color(0xFF167F67),
          child: Text(
            "Verify",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => onVerifyClick(),
        ),
        SizedBox(
          width: 20.0,
        ),
        RaisedButton(
          color: const Color(0xFF167F67),
          child: Text(
            "Next",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => onNextClick(),
        ),
      ],
    );
  }


  onNextClick() {
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }
}