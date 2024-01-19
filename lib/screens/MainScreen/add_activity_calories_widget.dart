import 'package:flutter/material.dart';

class AddActivityCaloriesWidget extends StatelessWidget {
  const AddActivityCaloriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Activity For Today:',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 8)),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 70,
                ),
              ),
            ),
            Column(
              children: [
                CustomTextButtonWithBorder(
                    onPress: () {
                      //todo: add enter food/activity functionality
                    },
                    text: "Enter food/activity"),
                CustomTextButtonWithBorder(
                    onPress: () {
                      //todo:add enter calories button
                    },
                    text: "Enter Calories")
              ],
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class CustomTextButtonWithBorder extends StatelessWidget {
  const CustomTextButtonWithBorder({
    super.key,
    required this.onPress,
    required this.text,
  });

  final Function onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPress();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
        ),
        padding: EdgeInsets.all(5),
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
