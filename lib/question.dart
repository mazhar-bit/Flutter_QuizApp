import 'package:flutter/material.dart';

class Question {

String question;

String optionA;
String optionB;
String optionC;
String optionD;

int type;

String ans;

Question(this.question, this.optionA, this.optionB, this.optionC,
    this.optionD, this.ans, this.type);
}