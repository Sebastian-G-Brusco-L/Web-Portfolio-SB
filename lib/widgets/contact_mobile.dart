import 'package:flutter/material.dart';
import 'package:web_portfolio/constants/contact.dart';
import 'package:web_portfolio/constants/custom_color.dart';
import 'package:web_portfolio/constants/text_en.dart';
import 'package:web_portfolio/constants/text_es.dart';
import 'package:web_portfolio/utils/utils.dart';

class ContactMobileDesktop extends StatelessWidget {
  final bool isEnglish;
  const ContactMobileDesktop({
    super.key, required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.scaffoldBg,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TITLE
            Text(
              isEnglish ? textTitlesEn[4] : textTitlesEs[4],
              style: TextStyle(
                color: CustomColor.whitePrimary,
                fontSize: 24,
                shadows: [
                  Shadow(
                    offset: const Offset(0, 4),
                    blurRadius: 10,
                    color: CustomColor.whiteSecondary.withOpacity(0.4),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            //FILA BOTONES
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //BOTON LINEDIN-GMAIL
                for (int i = 0; i < contactMap.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: CustomColor.bgLight1,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        onPressed: () {
                          launchURLCustom(
                            contactMap.values.elementAt(i),
                          );
                        },
                        icon: SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.asset(
                            contactMap.keys.elementAt(i),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Made by ",
                    style: TextStyle(color: CustomColor.whiteSecondary),
                  ),
                  TextSpan(
                    text: "SB",
                    style: TextStyle(
                      color: CustomColor.yellowPrimary,
                    ),
                  ),
                  TextSpan(
                    text: " with Flutter 3.24.2",
                    style: TextStyle(color: CustomColor.whiteSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
