import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String routeToNavigate;
  final String title;
  final String subTitle;

  const Labels({
    super.key,
    required this.routeToNavigate,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, routeToNavigate);
            },
            child: Text(
              subTitle,
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
