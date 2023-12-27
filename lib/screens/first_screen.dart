import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies_app/components/animated_btn.dart';
import 'package:movies_app/components/loginAndRegister/sign_in_dialog.dart';
import 'package:movies_app/components/loginAndRegister/sign_up_dialog.dart';
import 'package:movies_app/utils/constants.dart';
import 'package:rive/rive.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late RiveAnimationController _btnAnimationController;

  bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorDark,
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/Backgrounds/bg.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 14),
                    const SizedBox(
                      width: 260,
                      child: Column(
                        children: [
                          Text("Aproveite o Movie App!",
                              style: movieTitleTextStyle),
                          SizedBox(height: 16),
                          Text(
                            "Tenha acesso ao melhor catálogo de filmes da internet.",
                            style: descriptionTextStyle,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;

                        Future.delayed(
                          const Duration(milliseconds: 800),
                          () {
                            setState(() {
                              isShowSignInDialog = true;
                            });
                            showCustomDialogSignIn(
                              context,
                              onValue: (_) {},
                            );
                          },
                        );
                      },
                      text: 'Entrar na Conta',
                      bgColor: backgroundColorLight,
                      txtColor: backgroundColorDark,
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;

                        Future.delayed(
                          const Duration(milliseconds: 800),
                          () {
                            setState(() {
                              isShowSignInDialog = true;
                            });
                            showCustomDialogSignUp(
                              context,
                              onValue: (_) {},
                            );
                          },
                        );
                      },
                      text: 'Criar um conta',
                      bgColor: Colors.transparent,
                      txtColor: backgroundColorLight,
                      borderColor: backgroundColorLight,
                    ),
                    const SizedBox(
                      height: 70,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
