// ignore_for_file: avoid_unnecessary_containers, camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:quiz_app/Custom_Components/customappbar.dart';
import 'package:quiz_app/Pages/description.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Customappbar(),
      body: welcomeHome(),
      backgroundColor: Colors.blueGrey,
    );
  }
}

class welcomeHome extends StatefulWidget {
  const welcomeHome({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<welcomeHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Welcome to the General Knowledge Quiz!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              // SizedBox(height: 5),
              const Image(
                image: AssetImage("assets/quizhome.jpg"),
                width: 300,
                height: 400,
              ),
              //SizedBox(height: 10,),// Spacing between text elements
              const Text(
                "Challenge yourself with exciting quizzes across various topics and enhance your knowledge!", // Description
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.orange),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Description()));
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
