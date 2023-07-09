import 'package:flutter/material.dart';
import 'dart:math' as math;

class StylishCLickButton extends StatefulWidget {
  final Duration duration = const Duration(milliseconds: 700);
  final Widget child;
  final Color buttonColor;
  final GestureTapCallback onPressed;
  final Color buttonOutineColor;

  const StylishCLickButton(
      {super.key,
      required this.child,
      required this.buttonColor,
      required this.onPressed,
      required this.buttonOutineColor});

  @override
  State<StylishCLickButton> createState() => _StylishCLickButtonState();
}

class _StylishCLickButtonState extends State<StylishCLickButton> {
  double _faceLeft = 20.0;
  double _faceTop = 0.0;
  double _sideWidth = 20.0;
  double _bottomHeight = 20.0;
  final Curve _curve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.0,
      height: 80.0,
      child: GestureDetector(
        onTapDown: _pressed,
        onTapUp: _unPressedOnTapUp,
        onTapCancel: _unPressed,
        child: Stack(
          children: [
            Positioned(
              top: 0.2,
              child: Transform(
                origin: const Offset(20, 0),
                transform: Matrix4.skewY(-0.79),
                child: AnimatedContainer(
                  duration: widget.duration,
                  curve: _curve,
                  width: _sideWidth,
                  height: 60.0,
                  color: widget.buttonColor.withOpacity(0.6),
                ),
              ),
            ),
            Positioned(
              top: 60.0,
              left: -88.5,
              child: Transform(
                transform: Matrix4.skewX(-0.8),
                child: Transform(
                  origin: const Offset(100, 10),
                  transform: Matrix4.rotationZ(math.pi),
                  child: AnimatedContainer(
                    duration: widget.duration,
                    curve: _curve,
                    width: 91.0,
                    height: _bottomHeight,
                    color: widget.buttonColor.withOpacity(0.6),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: widget.duration,
              curve: _curve,
              left: _faceLeft,
              top: _faceTop,
              child: Container(
                alignment: Alignment.center,
                width: 91.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: widget.buttonColor,
                  border: Border.all(color: widget.buttonOutineColor, width: 0.5),
                ),
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pressed(_) {
    setState(() {
      _faceLeft = 0.0;
      _faceTop = 20.0;
      _sideWidth = 0.0;
      _bottomHeight = 0.0;
    });
    widget.onPressed();
  }

  void _unPressedOnTapUp(_) => _unPressed();

  void _unPressed() {
    setState(() {
      _faceLeft = 20.0;
      _faceTop = 0.0;
      _sideWidth = 20.0;
      _bottomHeight = 20.0;
    });
  }
}
