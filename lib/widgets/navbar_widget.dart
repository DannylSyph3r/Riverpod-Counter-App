import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_counter_app/theme/color_pallete.dart';
import 'package:riverpod_counter_app/utils/widget_extensions.dart';

class NavBarWidget extends ConsumerWidget {
  final IconData icon;
  final Color? color;
  final Color? iconColor;
  final String label;
  final FontWeight? fontWeight;
  final void Function()? onTap;
  const NavBarWidget({
    super.key,
    required this.icon,
    this.color,
    this.iconColor,
    required this.label,
    this.fontWeight,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
        width: 50.w,
        child: Column(
          children: [
            //! ICON
            Icon(
              icon,
              size: 20.5,
              color: Theme.of(context).brightness == Brightness.light
                  ? Pallete.blackColor
                  : Pallete.whiteColor,
            ),
            //! SPACER
            5.sbH,
            //! LABEL
            Text(
              label,
              style: TextStyle(
                fontWeight: fontWeight ?? FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
            Container(
              height: 2.h,
              decoration: BoxDecoration(
                  color: color ?? Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r)),
            ),
          ],
        ),
      ),
    );
  }
}
