import 'package:education_list/core/widgets/appbar.dart';
import 'package:education_list/core/widgets/button_filter.dart';
import 'package:flutter/material.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        title: "Education",
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: ButtonFilter(
              isActive: true,
              onTap: () {},
            ),
          )
        ]
      ),
      body: const Center(
      ),
    );
  }
}