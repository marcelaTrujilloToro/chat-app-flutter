import 'package:flutter/material.dart';

class BtnBlue extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const BtnBlue({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 2,
      highlightElevation: 5,
      color: Colors.blue,
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
