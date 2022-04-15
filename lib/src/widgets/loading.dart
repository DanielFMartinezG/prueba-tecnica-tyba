import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
    this.size = 36,
  }) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: const CircularProgressIndicator(
          color: Color(0xFF5CA8F5),
        ),
      ),
    );
  }
}
