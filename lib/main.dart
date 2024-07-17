// import 'package:flutter/cupertino.dart';
import 'package:flappy_bird_game/home_layout.dart';
import 'package:flutter/material.dart';

void main()
{
  return runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeLayout(),
      debugShowCheckedModeBanner: false,
    ) ;
  }
}
