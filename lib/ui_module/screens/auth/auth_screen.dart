import 'dart:math';
import 'package:flutter/material.dart';
import 'package:foodpanda_app/ui_module/constants/auth/poster_constant.dart';
import 'package:foodpanda_app/ui_module/constants/auth/social_constant.dart';
import 'package:foodpanda_app/ui_module/constants/themes/color_constant.dart';
import 'package:foodpanda_app/ui_module/screens/auth/email_screen.dart';
import 'package:foodpanda_app/ui_module/screens/auth/phonenumber_screen.dart';
import 'package:foodpanda_app/ui_module/screens/main/home_screen.dart';
import 'package:foodpanda_app/ui_module/widgets/buttons/custom_image_button.dart';
import 'package:foodpanda_app/ui_module/widgets/buttons/custom_normal_button.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late int randomPosterIndex;

  @override
  void initState() {
    super.initState();
    randomPosterIndex = Random().nextInt(posterList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    right: MediaQuery.of(context).size.width * 0.1,
                    bottom: 10,
                    child: SizedBox(
                      height: 250,
                      child: Image.asset(
                        posterList[randomPosterIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 10,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text(
                              "Skip",
                              style: TextStyle(
                                color: secondaryColor,
                                fontSize: 15,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: secondaryColor,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          FittedBox(
            child: Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildHeaderBox(context),
                    _buildSocialButtonBox(),
                    _buildDivider(context),
                    _buildEmailAndPhoneButtonBox(context),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeaderBox(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign up or Log in",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Sign up to get your discount",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSocialButtonBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          CustomImageButton(
            icon: googleIcon,
            backgroundColor: Colors.transparent,
            color: accentGreyColor,
            label: "Continue with Google",
            hasBorder: true,
            onTap: () {},
          ),
          CustomImageButton(
            icon: facebookIcon,
            backgroundColor: Colors.blueAccent,
            color: secondaryColor,
            label: "Continue with Google",
            onTap: () {},
          ),
          CustomImageButton(
            icon: appleIcon,
            backgroundColor: Colors.black,
            color: secondaryColor,
            label: "Continue with Apple",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      height: 1.5,
      width: MediaQuery.of(context).size.width,
      color: greyColor,
    );
  }

  Widget _buildEmailAndPhoneButtonBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          CustomNormalButton(
            backgroundColor: primaryColor,
            color: secondaryColor,
            label: "Continue with Email",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => EmailScreen()),
              );
            },
          ),
          CustomNormalButton(
            backgroundColor: Colors.transparent,
            color: accentGreyColor,
            hasBorder: true,
            label: "Continue with Phone Number",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PhonenumberScreen()),
              );
            },
          ),
          _buildPolicyTextBox(context)
        ],
      ),
    );
  }

  Widget _buildPolicyTextBox(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: "By continuing, you agree to our ",
              style: GoogleFonts.ubuntu(color: accentGreyColor, height: 1.5),
            ),
            TextSpan(
              text: "Terms and Conditions ",
              style: GoogleFonts.ubuntu(color: primaryColor, height: 1.5),
            ),
            TextSpan(
              text: "and ",
              style: GoogleFonts.ubuntu(color: accentGreyColor, height: 1.5),
            ),
            TextSpan(
              text: "Privacy Policy",
              style: GoogleFonts.ubuntu(color: primaryColor, height: 1.5),
            ),
          ]),
        ),
      ),
    );
  }
}
