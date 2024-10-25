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
      title: const Center(
        child: Row(
          children: [Icon(Icons.quiz), Text("QuizCraze")],
        ),
      ),
    );
  }
}
