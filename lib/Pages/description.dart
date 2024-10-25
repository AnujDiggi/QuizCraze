// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quiz_app/Custom_Components/customappbar.dart';
import 'package:quiz_app/Pages/questions.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Customappbar(),
      body: DescriptionHome(),
    );
  }
}

class DescriptionHome extends StatefulWidget {
  const DescriptionHome({super.key});

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<DescriptionHome> {
  bool isChecked = false;

  void StartQuiz() {
    if (isChecked) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Questions()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
            content:
                Text("Please accept terms and conditions to start the quiz")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              "Welcome to the General Knowledge Quiz!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              "This quiz is designed to test your general knowledge across various topics including history, science, geography, and more. Here’s everything you need to know before starting:",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 14, color: Colors.black54),
                children: [
                  TextSpan(
                    text: "Quiz Duration: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  TextSpan(
                    text: "You have 10 minutes to complete the quiz.\n\n",
                  ),
                  TextSpan(
                    text: "Number of Questions: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  TextSpan(
                    text: "The quiz contains 15 multiple-choice questions.\n\n",
                  ),
                  TextSpan(
                    text: "Scoring: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  TextSpan(
                    text:
                        "Each correct answer awards you 1 point. There is no negative marking, so feel free to attempt all questions!\n\n",
                  ),
                  TextSpan(
                    text: "Time Limit: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  TextSpan(
                    text:
                        "Once the quiz starts, the timer will begin. Make sure to submit your answers before time runs out.\n\n",
                  ),
                  TextSpan(
                    text: "Single Attempt: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  TextSpan(
                    text: "You can take this quiz only once per session.\n\n",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Ready to test your knowledge? Please accept the terms and conditions to start the quiz.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                const Expanded(
                  child: Text(
                    "I accept the terms and conditions.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: StartQuiz,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  "Let's Start",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ))
          ],
        ),
      ),
    );
  }
}
