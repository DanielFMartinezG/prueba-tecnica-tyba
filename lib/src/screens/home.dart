import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyba_app/src/Usuarios/bloc/authentication/auth_bloc.dart';
import 'package:tyba_app/src/Usuarios/ui/pages/login/login_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Icon(
            Icons.app_blocking_outlined,
            color: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF5CA8F5),
          actions: const [
            LogoutButton(),
            SizedBox(width: 16.0),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: const [],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.blue, width: 1.5)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFd6d6d6),
            blurRadius: 5,
            offset: Offset(0.0, -3.0),
          )
        ],
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.restaurant_menu_outlined,
              color: Color(0xFF5CA8F5),
            ),
            Text(
              'Restaurantes',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5CA8F5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<AuthBloc>(context).add(const ClearAuth());
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false,
          );
        });
      },
      icon: const Icon(
        Icons.login_outlined,
      ),
    );
  }
}
