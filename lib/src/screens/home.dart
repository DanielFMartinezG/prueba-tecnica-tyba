import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          label: 'Usuario',
          icon: Icon(
            Icons.login_outlined,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Restaurantes',
          icon: Icon(
            Icons.login_outlined,
          ),
        ),
      ],
    );
  }
}
