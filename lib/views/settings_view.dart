import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:riverpod_counter_app/theme/color_pallete.dart';
import 'package:riverpod_counter_app/theme/primary_color_provider.dart';
import 'package:riverpod_counter_app/theme/theme_provider.dart';
import 'package:riverpod_counter_app/utils/apptexts.dart';
import 'package:riverpod_counter_app/utils/widget_extensions.dart';
import 'package:riverpod_counter_app/widgets/color_selection_widget.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeNotifierProvider);
    final primaryColorFill = ref.watch(selectedColorProvider);
    void toggleTheme(WidgetRef ref) {
      ref.read(themeNotifierProvider.notifier).toggleTheme();
    }

    return Scaffold(
      appBar: AppBar(
          title: AppTexts.settingsAppBarText
              .txtStyled(fontSize: 16.sp, fontWeight: FontWeight.bold),
          leading: CustomIcons.settingsIcon.iconslide()),
      body: SafeArea(
          child: Padding(
        padding: 15.padH,
        child: Center(
          child: Column(children: [
            40.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTexts.darkModeText.txtStyled(fontSize: 19.5),
                FlutterSwitch(
                    showOnOff: true,
                    padding: 7.5,
                    height: 32,
                    width: 72,
                    activeColor: ref.watch(selectedColorProvider.notifier).state,
                    inactiveColor: currentTheme.colorScheme.secondary,
                    activeTextColor: Pallete.whiteColor,
                    inactiveTextColor: Pallete.whiteColor,
                    valueFontSize: 14,
                    activeIcon: CustomIcons.activeSwitchIcon
                        .iconslide(color: Pallete.blackColor),
                    inactiveIcon: CustomIcons.inactiveSwitchIcon.iconslide(),
                    value: ref.watch(themeNotifierProvider.notifier).mode ==
                        ThemeMode.dark,
                    onToggle: (value) {
                      if (value == true) {
                        toggleTheme(ref);
                      } else {
                        toggleTheme(ref);
                      }
                    }),
              ],
            ),
            30.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTexts.primaryColorText.txtStyled(fontSize: 19.5),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        builder: (BuildContext context) {
                          return const ColorPickerModal();
                        });
                  },
                  child: SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 45,
                          height: 20,
                          decoration: const BoxDecoration()
                          .withColor(primaryColorFill)
                          .withShape(BoxShape.rectangle)
                          .withBorderRadius(BorderRadius.circular(10)),
                        ),
                        7.sbW,
                        CustomIcons.caretDownIcon
                            .iconslide(size: 16, color: primaryColorFill)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      )),
    );
  }
}
