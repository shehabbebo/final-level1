import 'package:finaltaskl1/allproduct.dart';
import 'package:finaltaskl1/card.dart';
import 'package:finaltaskl1/carshop.dart';
import 'package:finaltaskl1/natification.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:finaltaskl1/HomePage.dart';
import 'package:finaltaskl1/profile.dart';
import 'package:finaltaskl1/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => SplashScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: '/DiabetesCarePage',
          builder: (context, state) => DiabetesCarePage(),
        ),
        GoRoute(
          path: '/product',
          builder: (context, state) => ProductPage(),
        ),
        GoRoute(
          path: '/cart',
          builder: (context, state) => CartPage(),
        ),
        GoRoute(
          path: '/notifications',
          builder: (context, state) => NotificationsPage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => UserProfilePage(),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
