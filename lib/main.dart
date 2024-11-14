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
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            child,
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // Use BottomNavBar here
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF4CAF50),
      selectedItemColor: const Color.fromARGB(255, 255, 255, 255), // Color for selected item
      unselectedItemColor: const Color.fromARGB(255, 255, 255, 255), // Color for unselected items
      currentIndex: 0, // Set the initial index of the active item
      onTap: (index) {
        // Navigate to corresponding route when an item is tapped
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/game-screen');
            break;
          case 1:
            Navigator.pushNamed(context, '/shop-screen');
            break;
          case 2:
            Navigator.pushNamed(context, '/about-screen');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.pets_rounded),
          label: 'Pet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop_rounded),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outline_rounded),
          label: 'About',
        ),
      ],
    );
  }
}
