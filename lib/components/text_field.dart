import 'package:flutter/material.dart';
import 'package:movies_app/utils/constants.dart';

class TextFieldComponent extends StatefulWidget {
  final String title;
  final bool isObscure;

  const TextFieldComponent({
    Key? key,
    required this.title,
    required this.isObscure,
  }) : super(key: key);

  @override
  _TextFieldComponentState createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: TextFormField(
            obscureText: widget.isObscure ? _obscureText : false,
            validator: (value) {
              if (value!.isEmpty) {
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              suffixIcon: widget.isObscure
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: backgroundColorDark,
                      ),
                      onPressed: () {
                        // Alternar a visibilidade da senha
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
