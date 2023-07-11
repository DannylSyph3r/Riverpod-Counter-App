import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_counter_app/theme/theme_provider.dart';
import 'package:riverpod_counter_app/views/navigation_bar.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return Builder(
            builder: (context) => MaterialApp(
                theme: ref.watch(themeNotifierProvider),
                title: 'Flutter Riverpod Counter App',
                debugShowCheckedModeBanner: false,
                home: const RiverNavBar())); 
      },
    );
  }
}
