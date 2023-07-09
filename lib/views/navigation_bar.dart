import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod_counter_app/theme/color_pallete.dart';
import 'package:riverpod_counter_app/theme/primary_color_provider.dart';
import 'package:riverpod_counter_app/views/riverpod_counter_view.dart';
import 'package:riverpod_counter_app/views/settings_view.dart';
import 'package:riverpod_counter_app/widgets/navbar_widget.dart';

class RiverNavBar extends ConsumerStatefulWidget {
  const RiverNavBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RiverNavBarState();
}

class _RiverNavBarState extends ConsumerState<RiverNavBar> {
  List<Widget> pages = const [RiverpodCounterView(), SettingsView()];

  final ValueNotifier<int> _page = ValueNotifier(0);

  @override
  void initState() {
    _page.value = 0;
    super.initState();
  }

  @override
  void dispose() {
    _page.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedColor = ref.watch(selectedColorProvider.notifier).state;
    return Scaffold(
        body: ValueListenableBuilder(
          valueListenable: _page,
          builder: (context, value, child) => pages[_page.value],
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _page,
          builder: (context, value, child) => Material(
            child: Container(
              color: Theme.of(context).brightness == Brightness.light
                  ? Pallete.whiteColor
                  : Pallete.blackColor,
              padding: EdgeInsets.only(top: 14.h, left: 17.w, right: 17.w),
              height: 55.h,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NavBarWidget(
                        onTap: () => _page.value = 0,
                        icon: PhosphorIcons.bold.house,
                        label: '',
                        color: _page.value == 0 ? selectedColor : null,
                        fontWeight: _page.value == 0 ? FontWeight.w600 : null,
                      ),
                      NavBarWidget(
                        onTap: () => _page.value = 1,
                        icon: PhosphorIcons.bold.gear,
                        label: '',
                        color: _page.value == 1 ? selectedColor : null,
                        fontWeight: _page.value == 1 ? FontWeight.w600 : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
