import 'dart:async';

import 'package:education_list/core/widgets/appbar.dart';
import 'package:education_list/core/widgets/button_filter.dart';
import 'package:education_list/core/widgets/empty_search.dart';
import 'package:education_list/core/widgets/search_textfield.dart';
import 'package:education_list/features/education/domain/entities/eduation_entity.dart';
import 'package:education_list/features/education/presentation/cubit/education_cubit.dart';
import 'package:education_list/features/education/presentation/cubit/education_state.dart';
import 'package:education_list/features/education/presentation/widgets/education_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationView extends StatefulWidget {
  const EducationView({super.key});

  @override
  State<EducationView> createState() => _EducationViewState();
}

class _EducationViewState extends State<EducationView> {
  TextEditingController searchController = TextEditingController(text: "");

  @override
  void initState() {
    Future.microtask(() {
      return context.read<EducationCubit>().onGetEducations();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EducationCubit, EducationState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: appbar(
              context,
              title: "Education",
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: ButtonFilter(
                    isActive: false,
                    onTap: state.getEducationStatus == GetEducationStatus.loading
                    ? null
                    : () {},
                  ),
                )
              ]
            ),
            body: Stack(
              children: [
                /// LOADING
                Visibility(
                  visible: state.getEducationStatus == GetEducationStatus.loading,
                  child: const Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                ),
            
                /// EMPTY LIST
                Visibility(
                  visible: state.getEducationStatus == GetEducationStatus.done && state.filteredEducationEntities!.isEmpty,
                  child: const EmptySearch(),
                ),
                
                /// LIST
                Visibility(
                  visible: state.getEducationStatus == GetEducationStatus.done && state.filteredEducationEntities!.isNotEmpty,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: state.filteredEducationEntities!.length,
                    itemBuilder: (context, index) {
                      EducationEntity entity = state.filteredEducationEntities![index];
                  
                      if (index == 0) {
                        return Column(
                          children: [
                            SizedBox(
                              height: searchController.text.isNotEmpty ? 121 : 88,
                              width: double.infinity,
                            ),
                            EducationTile(
                              entity: entity,
                            )
                          ],  
                        );
                      }
                  
                      return EducationTile(
                        entity: entity,
                      );
                    },
                  ),
                ),
            
                /// SEARCH INPUT
                SearchTextfield(
                  controller: searchController,
                  onChanged: (value) {
                    context.read<EducationCubit>().onSearchEducation(value);
                    setState(() {
                      searchController.text = value;
                    });
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}