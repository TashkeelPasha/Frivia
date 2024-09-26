import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:frivia/screens/Home_Page.dart';
import '../screens/home.dart' as home;

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQues = 10;
  List? questions;
  final String difficulty;
  int currentQues = 0;
  int _correctCount = 0;

  BuildContext context;

  GamePageProvider({required this.context, required this.difficulty}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    _GetQuesFromAPI();
  }

  Future<void> _GetQuesFromAPI() async {
    var _response = await _dio.get(
      '',
      queryParameters: {
        'amount': 10,
        'type': 'boolean',
        'difficulty': difficulty,
      },
    );
    var _data = jsonDecode(_response.toString());
    questions = _data["results"];
    notifyListeners();
  }

  String GetCurrentQues() {
    return questions![currentQues]["question"];
  }

  void answerQues(String _answer) async {
    bool isCorrect = questions![currentQues]["correct_answer"] == _answer;
    _correctCount += isCorrect ? 1 : 0;
    currentQues++;
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return AlertDialog(
            backgroundColor: isCorrect ? Colors.green : Colors.red,
            title: Icon(isCorrect ? Icons.check_circle : Icons.cancel_sharp),
          );
        });
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
    if (currentQues == _maxQues) {
      EndGame();
    } else {
      notifyListeners();
    }
  }

  Future<void> EndGame() async {
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            title: const Text(
              'Game end',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            content: Text(
              "Score: $_correctCount/$_maxQues",
              style: TextStyle(color: Colors.white),
            ),
          );
        });
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.push(
        (context), MaterialPageRoute(builder: (context) => home.Home()));
  }
}
