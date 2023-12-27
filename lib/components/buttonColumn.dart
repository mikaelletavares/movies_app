import 'package:flutter/material.dart';
import 'package:movies_app/utils/constants.dart';

class ButtonColumn extends StatefulWidget {
  const ButtonColumn({
    Key? key,
    required this.text,
    required this.defaultIcon,
    required this.selectedIcon,
  }) : super(key: key);

  final String text;
  final IconData defaultIcon;
  final IconData selectedIcon;

  @override
  _ButtonColumnState createState() => _ButtonColumnState();
}

class _ButtonColumnState extends State<ButtonColumn> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  void _onIconClicked() {
    isSelected = !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _onIconClicked();
        });
      },
      child: Column(
        children: [
          Icon(
            isSelected ? widget.selectedIcon : widget.defaultIcon,
            color: backgroundColorLight,
          ),
          Text(widget.text, style: smallTextStyle),
        ],
      ),
    );
  }
}
