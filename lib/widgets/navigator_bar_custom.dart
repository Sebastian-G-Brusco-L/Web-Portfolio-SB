import 'package:flutter/material.dart';
import 'package:web_portfolio/constants/custom_color.dart';
import 'package:web_portfolio/constants/text_en.dart';
import 'package:web_portfolio/constants/text_es.dart';
import 'package:web_portfolio/utils/scroll_to_section.dart';

class NavigatorBarCustomDesktop extends StatelessWidget {
  final Function translatePortfolio;
  final bool isEnglish;
  const NavigatorBarCustomDesktop({
    super.key,
    required this.translatePortfolio,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          CustomColor.scaffoldBg,
          CustomColor.bgLight1,
          CustomColor.bgLight2,
        ]),
        color: CustomColor.scaffoldBg,
        border: Border(
          left: BorderSide(color: CustomColor.yellowSecundary, width: 3),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: const Text(
                "SB",
                style: TextStyle(color: CustomColor.yellowPrimary),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            //TRANSLATE BUTTON
            TextButton.icon(
              style: ButtonStyle(
                overlayColor: WidgetStatePropertyAll(
                  CustomColor.yellowSecundary.withOpacity(0.1),
                ),
              ),
              label: Text(
                isEnglish ? "English" : "Español",
                style: const TextStyle(color: CustomColor.whiteSecondary),
              ),
              onPressed: () {
                translatePortfolio();
              },
              icon: const Icon(
                Icons.translate_rounded,
                color: CustomColor.whitePrimary,
              ),
            ),
            const Spacer(),
            //NAV ITEMS
            for (int i = 0; i < textTitlesEs.length; i++)
              TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(
                      CustomColor.yellowSecundary.withOpacity(0.1),
                    ),
                  ),
                  onPressed: () {
                    scrollToSection(navBarKeys[i]);
                  },
                  child: Text(
                    isEnglish ? textTitlesEn[i] : textTitlesEs[i],
                    style: const TextStyle(color: CustomColor.whitePrimary),
                  ))
          ],
        ),
      ),
    );
  }
}
