
import 'package:flutter/material.dart';
import 'package:quizapp/Questions/Question.dart';

class QuizApp extends StatefulWidget {

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  
  int quesIndex = 0;

  List QuestionText = [
    Question.name("India's Captial is New Delhi", true),
    Question.name("India is Subcontinent", false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        centerTitle: true,
        backgroundColor: Colors.red.shade400.withOpacity(.5),
      ),
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset("images/flag.png", 
                  width: 200,
                  height: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red.shade500.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  height: 60,
                  child: Center(child: Text(QuestionText[quesIndex].q, style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 14
                  ),)),
                ),
              ),
      
              Container(
                margin: EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(onPressed: () => _checkAns(true, context), 
                    color: Colors.red.shade300.withOpacity(.9),
                    child: Text("True", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal
                    ),),),
      
                    RaisedButton(onPressed: () => _checkAns(false, context), 
                    color: Colors.red.shade300.withOpacity(.9),
                    child: Text("False", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal
                    ),),)
                    
                  ],
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),

    ) 
    ;
  }

  _checkAns(bool userChoice, BuildContext context){
    if(userChoice == QuestionText[quesIndex].ans){

      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text("Correct!!"),
        backgroundColor: Colors.green.shade300.withOpacity(.7));
      Scaffold.of(context).showSnackBar(snackbar);
      
      setState(() {
        quesIndex = (quesIndex+1) % QuestionText.length;  
      });
      
    }
    
    else{
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text("Incorrect!!"),
        backgroundColor: Colors.red.shade300.withOpacity(.7)
        );
      Scaffold.of(context).showSnackBar(snackbar);
      
      setState(() {
        quesIndex = (quesIndex+1) % QuestionText.length;
      });
  
    }
  }
}