import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_counter_app/theme/color_pallete.dart';
import 'package:riverpod_counter_app/utils/apptexts.dart';
import 'package:riverpod_counter_app/utils/widget_extensions.dart';
import 'package:riverpod_counter_app/widgets/modal_button.dart';

class DivsionModalWidget extends ConsumerWidget {
  const DivsionModalWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 220.h,
      child: Padding(
        padding: 33.5.padA,
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
            40.sbH,
            const Text(
              'This is not possible',
              style: TextStyle(fontSize: 18),
            ),
            40.sbH,
            ModalButton(
                onButtonPress: () {
                  Navigator.pop(context);
                },
                buttonPlaceholderText: AppTexts.divisionWarningModalText),
          ],
        ),
      ),
    );
  }
}
