import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_app/theme/theme_provider.dart';
import 'package:riverpod_counter_app/utils/widget_extensions.dart';

class CustomSwitch extends ConsumerStatefulWidget {
  final bool value;
  final bool showOnOff;
  final ValueChanged<bool> onToggle;
  final String? activeText;
  final String? inactiveText;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? activeTextColor;
  final Color? inactiveTextColor;
  final FontWeight? activeTextFontWeight;
  final FontWeight? inactiveTextFontweight;
  final Color? toggleColor;
  final double? width;
  final double? height;
  final double? toggleSize;
  final double? valueFontSize;
  final double borderRadius;
  final double padding;
  final IconData activeIcon; 
  final IconData inactiveIcon;
  const CustomSwitch({
    super.key, 
    required this.value,
    required this.showOnOff,
    required this.onToggle,
    this.activeText,
    this.inactiveText,
    this.activeColor,
    this.inactiveColor,
    this.activeTextColor,
    this.inactiveTextColor,
    this.activeTextFontWeight,
    this.inactiveTextFontweight,
    this.toggleColor,
    this.width = 70.0,
    this.height = 35.0,
    this.toggleSize = 20.0,
    this.valueFontSize = 14.0,
    this.borderRadius = 20.0,
    this.padding = 6.0,
    required this.activeIcon,
    required this.inactiveIcon,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends ConsumerState<CustomSwitch> with SingleTickerProviderStateMixin {
  late Animation _toggleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        value: widget.value ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 60));
    _toggleAnimation =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.bottomRight)
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.linear));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomSwitch oldWidget){
    super.didUpdateWidget(oldWidget);
    if(oldWidget.value == widget.value)return;
    if(widget.value) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeNotifierProvider);
    return AnimatedBuilder(
      animation: _animationController, 
      builder: (context, child){
        return GestureDetector(
          onTap: (){
            if(widget.value){
              _animationController.reverse();
            }
             else {
              _animationController.forward();
              widget.onToggle(!widget.value);
            }
          },
          child: Container(
            width: widget.width,
            padding: EdgeInsets.all(widget.padding),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(widget.borderRadius),
            color: _toggleAnimation.value == Alignment.centerLeft
          ? widget.inactiveColor
          : widget.activeColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _toggleAnimation.value == Alignment.centerRight
              ? Expanded(child: Container(
                padding: 4.0.padH,
                child: _activeText,
                ),
                )
              : Container(),
              Align(  
                alignment: _toggleAnimation.value,
                child: Container(
                  width: widget.toggleSize,
                  height: widget.toggleSize,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: widget.toggleColor),
                  child: Icon(
                    widget.value ? widget.inactiveIcon : widget.activeIcon, size: 21,  //Active and Inactive Icons
                    color: currentTheme.colorScheme.primary,
                  ),
                ),
              ),
              _toggleAnimation.value == Alignment.centerLeft
              ? Expanded(child: Container(
                padding: 4.0.padH,
                alignment: Alignment.centerRight,
                child: Row(children: [
                  _inactiveText
                ]
                ),
                ),
                )
              : Container()

            ],),
          ),
        );

      });
  }

  FontWeight? get _activeTextFontweight => widget.activeTextFontWeight ?? FontWeight.w900;

  Widget _currentText(text){
    if(widget.showOnOff){
      return Text(
        (widget.activeText != null) ? widget.activeText : text,
        style: TextStyle(color: widget.activeTextColor,
        fontWeight: _activeTextFontweight,
        fontSize: widget.valueFontSize,),
      );
    }
    return const Text("");
  }
  Widget get _activeText{
    return _currentText("On");
  }
  Widget get _inactiveText{
    return _currentText("Off");
  }
}
