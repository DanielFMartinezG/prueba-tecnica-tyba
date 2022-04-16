import 'package:flutter/material.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({
    Key? key,
    this.body = const [],
    required this.title,
  }) : super(key: key);

  final List<Widget> body;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(
          Icons.person_outline,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5CA8F5),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '$title',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24.0),
              Column(
                children: body,
              )
            ],
          ),
        ),
      ),
    );
  }
}
