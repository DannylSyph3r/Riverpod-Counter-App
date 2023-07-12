import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_app/theme/primary_color_provider.dart';

class ModalButton extends ConsumerWidget {
  final String buttonPlaceholderText;
  final Function()? onButtonPress;

  const ModalButton({super.key, required this.buttonPlaceholderText, this.onButtonPress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final primaryColorFill = ref.watch(selectedColorProvider);
   return ElevatedButton(
      onPressed: onButtonPress, 
       style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8),
        fixedSize: const Size(315, 60),
        backgroundColor: primaryColorFill.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
       ),
       child: Text(buttonPlaceholderText, style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        ),
       ),
      );
  }
}