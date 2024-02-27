import 'package:education_list/core/widgets/appbar.dart';
import 'package:education_list/core/widgets/button_filter.dart';
import 'package:education_list/core/widgets/search_textfield.dart';
import 'package:education_list/features/education/presentation/widgets/education_tile.dart';
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
              isActive: false,
              onTap: () {},
            ),
          )
        ]
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const Column(
                    children: [
                      SearchTextfield(),
                      EducationTile()
                    ],
                  );
                }
                return const EducationTile();
              },
            ),
          ],
        ),
      ),
    );
  }
}