import 'package:flutter/material.dart';
import 'package:tabbar_post_list/di/di_init.dart' as di;
import 'package:tabbar_post_list/features/home/ui/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  di.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xff165cdf),
              secondary: const Color(0xff241E81),
            ),
      ),
    );
  }
}
