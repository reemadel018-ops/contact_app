import 'package:contact_app/core/routes/app_routes.dart';
import 'package:contact_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:AppRoutes.homeRouteName ,
      routes: {
        AppRoutes.homeRouteName:(context) => HomeScreen(),

      },
      
    );
  }
}
