import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_Brain.dart';

QuizBrain quizBrain = new QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          )),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int score = 0;

  void userScore(){
    var total = quizBrain.questionBank.length;
    if(score >= quizBrain.questionBank.length){
      Alert(
        context: context,
        type: AlertType.success,
        title: 'CONGRATULATIONS!\n',
        desc: 'You have won the quiz.',
        buttons: [
          DialogButton(
            child: Text('Play Again',
            style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {Navigator.pop(context);},
            width: 30.0,
          ),
          DialogButton(
            child: Text('Exit',
            style: TextStyle(
              color: Colors.white, fontSize: 20.0
            ),),
            onPressed: (){SystemNavigator.pop();},
            width: 30.0,
          )
        ]
      ).show();
    } else{
      Alert(
        context: context,
        type: AlertType.info,
        title: 'Finished!',
        desc: 'You\'ve reached the end of the quiz. \n\n You scored $score/$total',
          buttons: [
            DialogButton(
              child: Text('Play Again',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {Navigator.pop(context);},
              width: 30.0,
            ),
            DialogButton(
              child: Text('Exit',
                style: TextStyle(
                    color: Colors.white, fontSize: 20.0
                ),),
              onPressed: (){SystemNavigator.pop();},
              width: 30.0,
            )
          ]
      ).show();
    }
  }
  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        if(userAnswer == correctAnswer){
          score++;
        }
        userScore();
        quizBrain.reset();
        scoreKeeper = [];
        score = 0;
      } else {

        if (userAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
              Icons.check,
              color: Colors.green)
          );
          score++;

        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
        print(score);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  // ignore: unused_local_variable
                  checkAnswer(true);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(false);
                  // ignore: unused_local_variable
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
