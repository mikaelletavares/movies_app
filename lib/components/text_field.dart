import 'package:flutter/material.dart';
import 'package:movies_app/utils/constants.dart';

class TextFieldComponent extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isObscure;

  const TextFieldComponent({
    super.key,
    required this.title,
    required this.icon,
    required this.isObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: TextFormField(
            obscureText: isObscure,
            validator: (value) {
              if (value!.isEmpty) {
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: backgroundColorDark,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
