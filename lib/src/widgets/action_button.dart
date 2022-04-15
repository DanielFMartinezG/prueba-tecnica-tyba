import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.title,
    required this.callback,
  }) : super(key: key);
  final String title;
  final Function callback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        width: 180.0,
        height: 35.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blue, width: 2.0),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
