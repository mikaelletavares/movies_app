import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.press,
    required this.text,
    required this.bgColor,
    required this.txtColor,
    required this.borderColor,
  });

  final VoidCallback press;
  final String text;
  final Color bgColor;
  final Color txtColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 54,
        width: 226,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: txtColor, fontFamily: "Poppins"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
