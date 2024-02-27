import 'package:education_list/config/theme/palette.dart';
import 'package:flutter/material.dart';

class ButtonFilter extends StatelessWidget {
  final VoidCallback? onTap;
  final bool? isActive;

  const ButtonFilter({super.key,
    this.onTap,
    this.isActive = false
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive! ? Palette.tertiary : null,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: isActive! ? Border.all(width: 1, color: Palette.secondary) : null
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  Icon(
                    Icons.tune_rounded,
                    color: Palette.secondary,
                    size: 24,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Visibility(
                      visible: isActive!,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Palette.tertiary,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Icon(
                          Icons.fiber_manual_record,
                          size: 15,
                          color: Palette.secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 6,),
              Text(
                "Filter",
                style: TextStyle(
                  color: Palette.secondary,
                  fontSize: 14
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}