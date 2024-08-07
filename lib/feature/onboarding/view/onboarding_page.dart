import 'package:fleetfi/app/misc/spacer.dart';
import 'package:fleetfi/app/theme/app_colors.dart';
import 'package:fleetfi/feature/authentication/view/recovery_phrase_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingCarousel extends StatefulWidget {
  static const routeName = '/onboarding';

  const OnBoardingCarousel({super.key});

  @override
  State<OnBoardingCarousel> createState() => _OnBoardingCarouselState();
}

class _OnBoardingCarouselState extends State<OnBoardingCarousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/app_icon/fleet_logo.png',

                // fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 109),
            const Text('Welcome to Fleet Finance',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: AppColors.kPurple)),
            const SizedBox(height: 12),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Finances made accessible',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.kBlack,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: '\n\nSave time and focus on what matters most to you',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppColors.kBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const VSpace(109),
            KnotActionButton(
              onTap: () {
                Navigator.pushNamed(context, RecoveryPhrasePage.routeName);
              },
              buttonLabel: 'Create account',
            ),
            const SizedBox(height: 10),
            KnotActionButton(
              onTap: () {},
              buttonLabel: 'Login',
              fontColor: AppColors.kBlack,
              color: const Color(0xFFF2F2F2),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class KnotActionButton extends StatelessWidget {
  const KnotActionButton({
    this.onTap,
    required this.buttonLabel,
    this.color = AppColors.kPurple,
    this.setMargin = 16.0,
    this.fontColor,
    this.buttonSize,
    super.key,
  });
  final Function()? onTap;
  final String buttonLabel;
  final Color color;
  final double setMargin;
  final Color? fontColor;
  final double? buttonSize;

  factory KnotActionButton.construct(
      {required Function() onTap,
      required String buttonLabel,
      Color? color,
      double? setMargin,
      Color? fontColor,
      double? buttonSize}) {
    return KnotActionButton(
      buttonLabel: buttonLabel,
      onTap: onTap,
      color: color ?? AppColors.kPurple,
      setMargin: setMargin ?? 16.0,
      fontColor: fontColor ?? Colors.white,
      buttonSize: buttonSize,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonSize ?? 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: setMargin),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Text(
          buttonLabel,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: fontColor ?? Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
