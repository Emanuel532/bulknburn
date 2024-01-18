import 'package:flutter/material.dart';

class PurpleElevatedButton extends StatelessWidget {
  const PurpleElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.purple,
      ),
      child: const Text(
        "Login",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
