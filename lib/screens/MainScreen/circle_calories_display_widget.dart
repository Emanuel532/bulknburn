import 'package:flutter/material.dart';

class CircleCaloriesDisplay extends StatelessWidget {
  const CircleCaloriesDisplay({
    super.key,
  });

  static const kCalButStyle =
      TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
//todo: realtime calories tracker
  //todo: screen height
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.deepOrangeAccent,
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '+1,500',
            style: kCalButStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text('Calories Today', style: kCalButStyle)
        ],
      ),
    );
  }
}
