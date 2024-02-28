import 'package:education_list/config/theme/theme.dart';
import 'package:education_list/core/services/service_locator.dart';
import 'package:education_list/features/education/presentation/cubit/education_cubit.dart';
import 'package:education_list/features/education/presentation/views/education_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EducationCubit>(
          create: (context) => serviceLocator.get<EducationCubit>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Education List',
        theme: MainTheme.buildTheme(),
        home: const MainView(),
      )
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
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.timeline_rounded),
            label: "Stock Pick",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: "Education",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Analysis.svg"
            ),
            label: "Analysis",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Books.svg"
            ),
            label: "Academy",
          ),
        ],
      ),
    );
  }
}