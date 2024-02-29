import 'package:education_list/config/theme/palette.dart';
import 'package:education_list/core/widgets/modal_filter_bottomsheet.dart';
import 'package:education_list/features/education/presentation/cubit/education_cubit.dart';
import 'package:education_list/features/education/presentation/cubit/education_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModalEducationFilter extends StatelessWidget {
  final List<String> filtersAvail = [
    "Insight", "Pemula", "Perencanaan Keuangan"
  ];

  ModalEducationFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EducationCubit, EducationState>(
      builder: (context, state) {
        return ModalFilterBottomSheet(
          onReset: () {
            context.read<EducationCubit>().onResetFilter();
            Navigator.pop(context);
          },
          onSubmit: () {
            context.read<EducationCubit>().onSubmitFilter();
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 8,
              top: 4
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Category",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12,),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: List.generate(filtersAvail.length, (index) {
                    String filterAvail = filtersAvail[index];
                    bool isSelected = state.filters!.contains(filterAvail);
            
                    return OutlinedButton(
                      onPressed: () {
                        context.read<EducationCubit>().onSelectFilter(filterAvail);
                      },
                      style: ButtonStyle(
                        backgroundColor: isSelected
                        ? MaterialStatePropertyAll(Palette.secondary)
                        : const MaterialStatePropertyAll(Colors.transparent),
                      ),
                      child: Text(
                        filterAvail,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Palette.neutralCaption
                        ),
                      )
                    );
                  }),
                )
              ],
            ),
          )
        );
      },
    );
  }
}