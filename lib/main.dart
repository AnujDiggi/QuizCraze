import 'package:flutter/material.dart';
import 'package:quiz_app/Custom_Components/customappbar.dart';
import 'package:quiz_app/Pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Customappbar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             const ClipRRect(
                 borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image(
                image: AssetImage('assets/quiz_wel.jpg'),
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              )),
             const SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange
              ),
               child: const Text("Start", style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
                 color: Colors.white
              ),))
            ],
          ),
        ),
        
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
