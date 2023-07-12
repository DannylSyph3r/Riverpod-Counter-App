import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_counter_app/provider/counter_provider.dart';
import 'package:riverpod_counter_app/theme/color_pallete.dart';
import 'package:riverpod_counter_app/theme/primary_color_provider.dart';
import 'package:riverpod_counter_app/utils/apptexts.dart';
import 'package:riverpod_counter_app/widgets/click_button.dart';
import 'package:riverpod_counter_app/widgets/textfield_widget.dart';
import 'package:riverpod_counter_app/utils/widget_extensions.dart';

class RiverpodCounterView extends ConsumerStatefulWidget {
  const RiverpodCounterView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RiverpodCounterViewState();
}

class _RiverpodCounterViewState extends ConsumerState<RiverpodCounterView> {
  final _inputFieldController = TextEditingController();

  @override
  void dispose() {
    _inputFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final numberCountProvider = ref.watch(counterProvider).count;
    final primaryColorFill = ref.watch(selectedColorProvider);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: AppTexts.appBarText.txtStyled(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: 10.padH,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                numberCountProvider.toString().txtStyled(fontSize: 65.sp),
                50.sbH,
                AppTextField(
                  controller: _inputFieldController,
                  hintText: AppTexts.textFieldHintText,
                  obscureText: false,
                ),
                70.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StylishCLickButton(
                      buttonColor: primaryColorFill,
                      onPressed: () {
                        final operation = _inputFieldController.text;
                        ref
                            .read(counterProvider.notifier)
                            .performCounterOperations(context, operation);
                        _inputFieldController.clear();
                      },
                      buttonOutineColor:
                          Theme.of(context).colorScheme.brightness ==
                                  Brightness.light
                              ? Pallete.blackColor
                              : Pallete.whiteColor,
                      child: CustomIcons.solutionIcon.iconslide(size: 21),
                    ),
                    35.sbW,
                    StylishCLickButton(
                      buttonColor: primaryColorFill,
                      onPressed: () {
                        ref.read(counterProvider.notifier).resetCounter();
                      },
                      buttonOutineColor:
                          Theme.of(context).brightness == Brightness.light
                              ? Pallete.blackColor
                              : Pallete.whiteColor,
                      child: CustomIcons.redoIcon.iconslide(size: 21),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
