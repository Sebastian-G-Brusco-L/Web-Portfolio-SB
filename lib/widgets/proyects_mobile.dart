import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_portfolio/constants/custom_color.dart';
import 'package:web_portfolio/constants/proyects.dart';
import 'package:web_portfolio/constants/text_en.dart';
import 'package:web_portfolio/constants/text_es.dart';
import 'package:web_portfolio/widgets/widgets.dart';

class ProyectsMobile extends StatelessWidget {
  final bool isEnglish;
  const ProyectsMobile({
    super.key,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.scaffoldBg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 20,
          ),
          //TITLE
          Text(
            isEnglish ? textTitlesEn[2] : textTitlesEs[2],
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
          //CARDS
          for (int i = 0; i < getProyectsListCards(isEnglish).length; i++)
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Dialog(
                        insetPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        backgroundColor: CustomColor.bgLight1,
                        child: BigCardMobile(
                          indexC: i,
                          proyects: getProyectsListCards(isEnglish),
                        ),
                      ),
                    );
                  },
                );
              },
              child: CardDesktopMobile(
                i: i,
                proyects: getProyectsListCards(isEnglish),
                colorFooter: CustomColor.bgLight1,
              ), //ME SIRVE EL DE DESKTOP
            ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
