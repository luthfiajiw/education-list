import 'dart:async';

import 'package:education_list/core/widgets/appbar.dart';
import 'package:education_list/core/widgets/button_filter.dart';
import 'package:education_list/core/widgets/empty_search.dart';
import 'package:education_list/core/widgets/search_textfield.dart';
import 'package:education_list/features/education/domain/entities/eduation_entity.dart';
import 'package:education_list/features/education/presentation/cubit/education_cubit.dart';
import 'package:education_list/features/education/presentation/cubit/education_state.dart';
import 'package:education_list/features/education/presentation/widgets/education_tile.dart';
import 'package:education_list/features/education/presentation/widgets/modal_education_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationView extends StatefulWidget {
  const EducationView({super.key});

  @override
  State<EducationView> createState() => _EducationViewState();
}

class _EducationViewState extends State<EducationView> with SingleTickerProviderStateMixin {
  late AnimationController searchAnimationController;
  ScrollController scrollController = ScrollController(
    keepScrollOffset: true
  );
  TextEditingController searchController = TextEditingController(text: "");
  bool showSearchTextfield = true;

  @override
  void initState() {
    searchAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250)
    );
    Future.microtask(() {
      return context.read<EducationCubit>().onGetEducations();
    });

    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      if (showSearchTextfield) {
        searchAnimationController.forward();
        setState(() {
          showSearchTextfield = false;
        });
      }
    } else if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
      if (!showSearchTextfield) {
        searchAnimationController.reverse();
        setState(() {
          showSearchTextfield = true;
        });
      }
    }
  }

  void showEducationFilter() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ModalEducationFilter();
      },
    );
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
                    isActive: state.isFilterActive,
                    onTap: state.getEducationStatus == GetEducationStatus.loading
                    ? null
                    : showEducationFilter,
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
                    controller: scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: state.filteredEducationEntities!.length,
                    itemBuilder: (context, index) {
                      EducationEntity entity = state.filteredEducationEntities![index];
                  
                      if (index == 0) {
                        return Column(
                          children: [
                            SizedBox(
                              height: searchController.text.isNotEmpty ? 121 : 88,
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
                  animationController: searchAnimationController,
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