import 'package:education_list/config/theme/palette.dart';
import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  final VoidCallback? onReset;
  final VoidCallback? onSubmit;
  final Widget child;

  const ModalBottomSheet({
    super.key,
    this.onReset,
    this.onSubmit,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Filter",
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                InkWell(
                  onTap: onReset,
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      color: Palette.primary
                    ),
                  )
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Divider(
                thickness: 1,
                color: Palette.neutral,
              ),
            ),
            child,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Divider(
                thickness: 1,
                color: Palette.neutral,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Batal",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ),
                ),
                const SizedBox(width: 16,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onSubmit,
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                        color: Palette.primary,
                        fontWeight: FontWeight.w700
                      ),
                    )
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}