import 'question.dart';

class QuizzBrain {
  int _i = 0;
  List<Question> _questionBank = [
    Question(
        question: 'Is Zaki the best football player in ther world?',
        answer: true),
    Question(
        question: 'Was the Declaration of Independence signed in 1776?',
        answer: true),
    Question(question: 'Did Shakespeare write "Harry Potter"?', answer: false),
    Question(question: 'Is the Earth flat?', answer: false),
    Question(question: 'Is Tokyo the capital of Japan?', answer: true),
    Question(
        question: 'Did the prophet Mohammed (S) do a mistake in his life?',
        answer: true),
  ];
  void nextQuestion() {
    if (_i < _questionBank.length - 1) {
      _i++;
    }
    print(_i);
  }

  String getQuestionText() {
    return _questionBank[_i].question;
  }

  bool getQuestionAnswer() {
    return _questionBank[_i].answer;
  }

  bool isFinished() {
    if (_i == _questionBank.length - 1) {
      return true;
    } else
      return false;
  }

  void reset() {
    _i = 0;
  }
}
