import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  const Customappbar({
    super.key,
    // required this.widget,
  });

  // final MyHomePage widget;

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
          child: const Row(
            children: [Image(image: AssetImage('assets/quiz_icon.jpg'), width: 50, height: 50,),
             SizedBox(width: 10,),
             Text("QuizCraze", style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.bold
             ),)],
          ),
        ),
      ),
      backgroundColor: Colors.indigo,
    );
  }
}
