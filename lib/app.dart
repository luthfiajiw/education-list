import 'package:education_list/config/theme/theme.dart';
import 'package:education_list/features/education/presentation/views/education_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Education List',
      theme: MainTheme.buildTheme(),
      home: const MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const EducationView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline_rounded),
            label: "Stock Pick",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: "Education",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.desktop_windows_outlined),
            label: "Analysis",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library_outlined),
            label: "Academy",
          ),
        ],
      ),
    );
  }
}