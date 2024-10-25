// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import 'package:quiz_app/Custom_Components/customappbar.dart';
import 'package:quiz_app/main.dart';

class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Customappbar(),
      body: QuestionsHome(),
    );
  }
}

class QuestionsHome extends StatefulWidget {
  const QuestionsHome({super.key});

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<QuestionsHome> {
  final List<Map<String, dynamic>> _questions = [
    {
      "question": "What is the capital of France?",
      "options": ["Paris", "Rome", "Berlin", "Madrid"],
      "answer": "Paris"
    },
    {
      "question": "Which planet is known as the Red Planet?",
      "options": ["Earth", "Venus", "Mars", "Jupiter"],
      "answer": "Mars"
    },
    {
      "question": "Who wrote 'To Kill a Mockingbird'?",
      "options": ["Harper Lee", "Mark Twain", "J.K. Rowling", "George Orwell"],
      "answer": "Harper Lee"
    },
    {
      "question": "Which ocean is the largest?",
      "options": ["Atlantic", "Indian", "Pacific", "Arctic"],
      "answer": "Pacific"
    },
    {
      "question": "What is the square root of 64?",
      "options": ["6", "8", "10", "12"],
      "answer": "8"
    },
    {
      "question": "Who painted the Mona Lisa?",
      "options": ["Michelangelo", "Leonardo da Vinci", "Raphael", "Van Gogh"],
      "answer": "Leonardo da Vinci"
    },
    {
      "question": "What is the chemical symbol for gold?",
      "options": ["Au", "Ag", "Pb", "Fe"],
      "answer": "Au"
    },
    {
      "question": "Which continent is the Sahara Desert located in?",
      "options": ["Asia", "Australia", "Africa", "Europe"],
      "answer": "Africa"
    },
    {
      "question": "What is the largest mammal?",
      "options": ["Elephant", "Blue Whale", "Giraffe", "Shark"],
      "answer": "Blue Whale"
    },
    {
      "question": "How many continents are there?",
      "options": ["5", "6", "7", "8"],
      "answer": "7"
    },
  ];

  int _currentIndex = 0;
  int _correctAnswer = 0;
  int _wrongAnswer = 0;

  void _answerQuestion(String SelectedAnswer) {
    final correctAnswer = _questions[_currentIndex]["answer"];

    setState(() {
      if (SelectedAnswer == correctAnswer) {
        _correctAnswer++;
      } else {
        _wrongAnswer++;
      }
      _currentIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentIndex = 0;
      _wrongAnswer = 0;
      _correctAnswer = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _currentIndex < _questions.length
        ? _buildQuestion()
        : _buildResult();
  }

  Widget _buildQuestion() {
    final question = _questions[_currentIndex]["question"];
    final options = _questions[_currentIndex]["options"];

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Question ${_currentIndex + 1}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              question,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...options.map((option) {
              return ElevatedButton(
                onPressed: () => _answerQuestion(option),
                child: Text(option),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildResult() {
    final totalQuestions = _questions.length;
    final percentage = (_correctAnswer / totalQuestions) * 100;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Quiz Completed!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                "Correct Answers: $_correctAnswer",
                style: const TextStyle(fontSize: 20, color: Colors.green),
              ),
              Text(
                "Wrong Answers: $_wrongAnswer",
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
              const SizedBox(height: 20),
              Text(
                "Score: ${percentage.toStringAsFixed(2)}%",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetQuiz,
                child: const Text("Retry Quiz"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const MyApp()));
                  },
                  child: const Text("Exit"))
            ],
          ),
        ),
      ),
    );
  }
}
