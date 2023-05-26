import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget{
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape(){
    final random = Random();

     width = random.nextInt(300)+50;
     height = random.nextInt(300)+50;
    color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1);
     borderRadius = random.nextInt(300)+50;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),

      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius)
            ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () =>changeShape(),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}