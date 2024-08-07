import 'package:fleetfi/app/misc/spacer.dart';
import 'package:fleetfi/app/theme/app_colors.dart';
import 'package:fleetfi/feature/onboarding/view/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmPhrasePage extends StatefulWidget {
  static const routeName = '/confirm-phrase';
  const ConfirmPhrasePage({super.key});

  @override
  State<ConfirmPhrasePage> createState() => _ConfirmPhrasePageState();
}

class _ConfirmPhrasePageState extends State<ConfirmPhrasePage> {
  final TextEditingController _confirmationController = TextEditingController();

  final phraseKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: Column(
          children: [
            const VSpace(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Enter Phrase',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.kPurple),
                ),
                const VSpace(12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 67),
                  child: Text(
                    'Enter your recovery phrase in the right order to access your new wallet.',
                    style: GoogleFonts.inter(
                        color: const Color(0xff828282), fontSize: 14),
                  ),
                ),
              ],
            ),
            const VSpace(53),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: phraseKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter seed phrase';
                    }
                    return null;
                  },
                  maxLines: 4,
                  textAlign: TextAlign.justify,
                  controller: _confirmationController,
                  decoration: InputDecoration(
                    labelText: 'Enter Seed Phrase',
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE0E0E0))),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelStyle: GoogleFonts.inter(
                        fontSize: 14, color: const Color(0xffE0E0E0)),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    alignLabelWithHint: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xffE0E0E0),
                          style: BorderStyle.solid,
                          width: 1),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            KnotActionButton.construct(
                onTap: () {},
                buttonLabel: 'Continue',
                color: AppColors.kPurple.withOpacity(0.5)),
            const VSpace(48),
          ],
        ),
      ),
    );
  }
}
