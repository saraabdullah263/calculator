import 'package:flutter/material.dart';

typedef onPressedFunction = void Function();

class CustomBotton extends StatelessWidget {
  String title;
  onPressedFunction onPressed;
  CustomBotton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
            onPressed: () {
              onPressed();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                side: BorderSide(color: Colors.pink.shade200, width: 3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
      ),
    );
  }
}
