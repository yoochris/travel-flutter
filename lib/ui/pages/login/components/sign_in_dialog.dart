import 'dart:ui';
import 'package:first_app/ui/pages/login/components/sign_in_form.dart';
import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context,
    {required ValueChanged<String> onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Sign in",
    barrierDismissible: true,
    barrierColor: Colors.black.withAlpha(30),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Center(
          child: Container(
            height: 670,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(179),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(26),
                  blurRadius: 60,
                  offset: const Offset(0, 10),
                ),
              ],
              border: Border.all(
                color: Colors.white.withAlpha(51),
                width: 1.5,
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withAlpha(128),
                  Colors.white.withAlpha(77),
                ],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(34),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Scaffold(
                  backgroundColor: Colors.white.withAlpha(170),
                  body: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                              "Sign in",
                              style: TextStyle(
                                fontSize: 34,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            const SignInForm()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
        child: child,
      );
    },
  );
}
