import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

void noCallback() {}

// App idea: Tamagotchi Clone

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/game-screen',
      routes: {
        '/game-screen': (context) => CenterWidget(child: const FirstScreen()),
        '/shop-screen': (context) => CenterWidget(child: const ShopScreen()),
        '/setting-screen': (context) =>
            CenterWidget(child: const SettingScreen()),
      },
    );
  }
}

class CenterWidget extends StatelessWidget {
  Widget child;
  CenterWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Virtual Pet'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            child,
            NavBar(),
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
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/game-screen'),
          icon: const Icon(Icons.gamepad),
          iconSize: 50,
        ),
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/shop-screen'),
          icon: const Icon(Icons.shop),
          iconSize: 50,
        ),
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/setting-screen'),
          icon: const Icon(Icons.settings),
          iconSize: 50,
        ),
      ],
    );
  }
}

Function navigate(BuildContext context, String route) {
  return () {
    Navigator.pushNamed(context, route);
  };
}

class FirstScreen extends HookWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final food = useState(10);
    final fun = useState(10);
    final energy = useState(10);
    return Column(
      children: [
        Column(
          children: [
            Text('Food: ${food.value}'),
            Text('Fun: ${fun.value}'),
            Text('Energy: ${energy.value}'),
          ],
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.red,
          margin: const EdgeInsets.all(10),
          child: const Align(
            alignment: Alignment.center,
            child: Text('Me is Pet'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  food.value += 3;
                  energy.value += 1;
                },
                child: const Text("Feed"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  fun.value += 3;
                  energy.value -= 2;
                  food.value -= 2;
                },
                child: const Text("Play"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  energy.value += 3;
                  food.value -= 1;
                  fun.value -= 2;
                },
                child: const Text("Rest"),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Shop');
  }
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Settings');
  }
}
