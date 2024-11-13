import 'package:flutter/material.dart';
import 'package:flutter_application_10/pet_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_10/pages/game_screen.dart';
import 'package:flutter_application_10/pages/about_screen.dart';
import 'package:flutter_application_10/pages/shop_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider<PetData>(
      create: (context) => PetData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFD3EED8),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF4CAF50),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4CAF50),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/game-screen',
      routes: {
        '/game-screen': (context) => const CenterWidget(child: GameScreen()),
        '/shop-screen': (context) => const CenterWidget(child: ShopScreen()),
        '/about-screen': (context) => const CenterWidget(child: AboutScreen()),
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
        title: const Text(
          'Smiley Slimey',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
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

  Widget nav({
    required BuildContext context,
    required String route,
    required IconData icon,
    required String text,
  }) {
    return Column(
      children: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, route),
          icon: Icon(icon),
          iconSize: 40,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        nav(
          context: context,
          route: '/game-screen',
          icon: Icons.pets_rounded,
          text: 'Pet',
        ),
        nav(
          context: context,
          route: '/shop-screen',
          icon: Icons.shop_rounded,
          text: 'Shop',
        ),
        nav(
          context: context,
          route: '/about-screen',
          icon: Icons.info_outline_rounded,
          text: 'About',
        ),
      ],
    );
  }
}