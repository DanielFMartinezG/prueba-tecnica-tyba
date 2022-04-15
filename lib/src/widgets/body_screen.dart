import 'package:flutter/material.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({
    Key? key,
    this.body = const [],
  }) : super(key: key);

  final List<Widget> body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(
          Icons.login_outlined,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Registro de usuario',
              style: TextStyle(
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
    );
  }
}
