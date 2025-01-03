import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/admin_page.dart';
import 'pages/lecturer_page.dart';
import 'pages/student_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICU Online School Timetable',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/admin': (context) => const AdminPage(),
        '/lecturer': (context) => const LecturerPage(),
        '/student': (context) => StudentPage(),
      },
    );
  }
}
