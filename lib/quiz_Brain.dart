import 'question.dart';

class QuizBrain{

  int _qNumber = 0;

  List <Question> questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question(
        'Of all the known planet, the Earth is the only planet on which aliens are found', false),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'A laptop is an example of Mini computer.', false),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
    //Question('Google was originally called \"Java\".', false),

  ];

  void nextQuestion(){
    if(_qNumber < questionBank.length - 1){
      ++_qNumber;
      }
  }

  String getQuestionText(){
    return questionBank[_qNumber].questionText;
  }

  bool getQuestionAnswer(){
    return questionBank[_qNumber].questionAnswer;
  }

  bool isFinished(){
    if(_qNumber >= questionBank.length - 1){
      print (_qNumber);
      print('We have reached the end!');
      return true;
    }else{
      print('Question: $_qNumber');
      return false;
    }
  }

  void reset(){
    _qNumber = 0;
  }

}