import 'package:flutter/material.dart';
import 'package:flutter_application_10/pet_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_10/pages/game_screen.dart';
import 'package:flutter_application_10/pages/about_screen.dart';
import 'package:flutter_application_10/pages/shop_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(
    ChangeNotifierProvider<PetData>(
      create: (context) => PetData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/game-screen',
      routes: {
        '/game-screen': (context) =>
            const CenterWidget(child: const GameScreen()),
        '/shop-screen': (context) =>
            const CenterWidget(child: const ShopScreen()),
        '/about-screen': (context) =>
            const CenterWidget(child: const AboutScreen()),
      },
    );
  }
}

class CenterWidget extends StatelessWidget {
  final Widget child;
  const CenterWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Virtual Pet'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            child,
            const NavBar(),
          ],
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: navigate(context: context, route: '/game-screen'),
              icon: const Icon(Icons.pets_rounded),
              iconSize: 40,
            ),
            const Text(
              'Pet',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: navigate(context: context, route: '/shop-screen'),
              icon: const Icon(Icons.shop_rounded),
              iconSize: 40,
            ),
            const Text(
              'Shop',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: navigate(context: context, route: '/about-screen'),
              icon: const Icon(Icons.info_outline_rounded),
              iconSize: 40,
            ),
            const Text(
              'About',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

void Function() navigate(
    {required BuildContext context, required String route}) {
  return () {
    Navigator.pushNamed(context, route);
  };
}
