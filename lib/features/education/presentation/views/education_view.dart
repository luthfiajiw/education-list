import 'package:education_list/core/widgets/appbar.dart';
import 'package:education_list/core/widgets/button_filter.dart';
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
  @override
  void initState() {
    Future.microtask(() {
      return context.read<EducationCubit>().onGetEducations();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EducationCubit, EducationState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          appBar: appbar(
            context,
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
                /// LOADING
                if (state.getEducationStatus == GetEducationStatus.loading) const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
                
                /// LIST
                if (state.getEducationStatus == GetEducationStatus.done) ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: state.educationEntities!.length,
                  itemBuilder: (context, index) {
                    EducationEntity entity = state.educationEntities![index];

                    if (index == 0) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 88,
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

                /// SEARCH INPUT
                const SearchTextfield()
              ],
            ),
          ),
        );
      },
    );
  }
}