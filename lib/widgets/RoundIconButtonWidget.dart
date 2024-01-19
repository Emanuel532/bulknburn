import 'package:flutter/material.dart';

class RoundIconButtonWidget extends StatelessWidget {
  const RoundIconButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconColor = Colors.white,
  });

  final IconData icon;
  final Function onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPressed();
      },
      elevation: 2.0,
      fillColor: Colors.white60,
      child: Icon(
        icon,
        size: 43.0,
        color: iconColor,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }
}
