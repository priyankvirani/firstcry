import 'package:firstcry/ui/home_screen.dart';
import 'package:firstcry/ui/login_screen.dart';
import 'package:firstcry/ui/product_screen.dart';
import 'package:firstcry/ui/register_screen.dart';
import 'package:firstcry/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'configs/app_routes.dart';

GlobalKey<NavigatorState> navKeyRoot = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKeyRoot,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      supportedLocales: const [
        Locale('en', ''),
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.product: (context) => const ProductScreen(),
      },
    );
  }
}
