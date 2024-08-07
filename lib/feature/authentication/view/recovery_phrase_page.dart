import 'package:fleetfi/app/misc/spacer.dart';
import 'package:fleetfi/app/theme/app_colors.dart';
import 'package:fleetfi/feature/authentication/view/confirm_phrase.dart';
import 'package:fleetfi/feature/onboarding/view/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RecoveryPhrasePage extends StatefulWidget {
  static const routeName = '/recovery-phrase';
  const RecoveryPhrasePage({super.key});

  @override
  State<RecoveryPhrasePage> createState() => _RecoveryPhrasePageState();
}

class _RecoveryPhrasePageState extends State<RecoveryPhrasePage> {
  List<String> words = [
    'tinubu',
    'maggi',
    'yam',
    'yam',
    'laptop',
    'uniport',
    'yam',
    'yam',
    'house',
    'expect',
    'grass',
    'yam',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: ListView(
          children: [
            const VSpace(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Recovery Phrase',
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.kPurple),
                ),
                const VSpace(12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Text(
                    'Please store these words in a safe place. Never share them with anyone.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        color: const Color(0xff828282), fontSize: 14),
                  ),
                ),
                const VSpace(76),
              ],
            ),
            TwelveWordsWidget(
              words: words,
            ),
            const VSpace(38),
            TextButton(
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(
                      text: words.join(' '),
                    ),
                  ).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Recovery phrase copied to clipboard'),
                      ),
                    );
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.copy,
                      color: AppColors.kBlack,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Copy to clipboard',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: AppColors.kBlack,
                      ),
                    ),
                  ],
                )),
            const VSpace(117),
            KnotActionButton(
                buttonLabel: 'Continue',
                onTap: () {
                  Navigator.pushNamed(context, ConfirmPhrasePage.routeName);
                }),
            // KnotActionButton.construct(
            //   onTap: () {
            //     Navigator.pushNamed(context, ConfirmPhrasePage.routeName);
            //   },
            //   buttonLabel: 'OK, I have it saved somewhere',
            //   color: AppColors.kPurple.withOpacity(0.3),
            // ),
          ],
        ),
      ),
    );
  }
}

class TwelveWordsWidget extends StatelessWidget {
  const TwelveWordsWidget({required this.words, super.key});

  final List<String> words;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 44, right: 44),
      height: 260,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 0,
        childAspectRatio: 3 / 2,
        children: List.generate(12, (index) {
          return WordTile(index + 1, words);
        }),
      ),
    );
  }
}

class WordTile extends StatelessWidget {
  final int number;
  final List<String> words;

  const WordTile(this.number, this.words, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$number. ',
          style: GoogleFonts.inter(fontSize: 14),
        ),
        const SizedBox(width: 4.0),
        Flexible(
          child: Text(
            words[number - 1],
            style: GoogleFonts.inter(
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }

  // String getWord(String word) {
  //   if (word.characters.length > 6) {
  //     return '${word.substring(0, 6)}\n${word.substring(6)}';
  //   }
  //   return word;
  // }
}
