
import 'package:card_app_last/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

void main() {
  runApp( Provider(
    create: (context) => MainProvider(),
    child:const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MainProvider(),
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Digital Card',
          theme: ThemeData.dark(),
          themeMode: ThemeMode.dark,
          home: const HomePage(),
        );
      },
    );
  }
}
