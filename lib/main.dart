import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash.dart';
import 'controllers/cart_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: "main",
    //   home: Splash(),
    // );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyCart(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "main",
        home: Splash(),
      ),
    );
  }
}
