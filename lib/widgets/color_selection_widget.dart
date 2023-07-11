import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_counter_app/theme/color_pallete.dart';
import 'package:riverpod_counter_app/theme/primary_color_provider.dart';
import 'package:riverpod_counter_app/utils/apptexts.dart';
import 'package:riverpod_counter_app/utils/widget_extensions.dart';

class ColorPickerModal extends ConsumerWidget {
    const ColorPickerModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorOptions = ref.watch(colorsProvider);
    final selectedColor = ref.watch(selectedColorProvider);

    return SizedBox(
      height: 450.h,
      child: Padding(
        padding: 35.5.padA,
        child: Column(
          children: [
            Container(
              height: 5,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Pallete.whiteColor,
              ),
            ),
            30.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                "Switch App Primary Color"
                    .txtStyled(fontSize: 16, fontWeight: FontWeight.bold),
              ],
            ),
            20.sbH,
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: colorOptions.length,
                itemBuilder: (context, index) {
                  final colorName = colorOptions.keys.toList()[index];
                  final color = colorOptions.values.toList()[index];
                  final isSelectedColor = selectedColor == color;
                  return GestureDetector(
                    onTap: () {
                      ref.read(selectedColorProvider.notifier).changeColor(color);
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration()
                              .withColor(color)
                              .withShape(BoxShape.circle),
                        ),
                        10.sbW,
                        colorName.txtStyled(
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        if (isSelectedColor) CustomIcons.activeSwitchIcon.iconslide(size: 21, color: const Color.fromARGB(255, 0, 255, 8)),
                        55.sbH
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

