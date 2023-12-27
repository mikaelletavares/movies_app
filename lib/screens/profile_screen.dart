import 'package:flutter/material.dart';
import 'package:movies_app/utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0D18),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0D18),
        foregroundColor: backgroundColorLight,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 70,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Mika',
                  style: movieTitleTextStyle,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColorDark,
                    fixedSize: const Size(180, 45),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit_rounded,
                        color: backgroundColorLight,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Editar Perfil',
                        style: buttonTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Minha Lista',
                  style: movieTextStyleBold,
                ),
                Divider(
                  height: 1,
                  color: Colors.white24,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
