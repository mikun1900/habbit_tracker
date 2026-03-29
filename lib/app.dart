import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habbit_tracker/presentation/screens/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Habit Tracker',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
        // TODO: ルーティングを実装
      ),
    );
  }
}
