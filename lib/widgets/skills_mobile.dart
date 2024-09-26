import 'package:flutter/material.dart';
import 'package:web_portfolio/constants/custom_color.dart';
import 'package:web_portfolio/constants/platforms.dart';
import 'package:web_portfolio/constants/skills.dart';
import 'package:web_portfolio/constants/text_en.dart';
import 'package:web_portfolio/constants/text_es.dart';
import 'package:web_portfolio/utils/utils.dart';

class SkillsMobile extends StatelessWidget {
  final bool isEnglish;
  const SkillsMobile({
    super.key,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      /* constraints: const BoxConstraints(maxHeight: 780,),
      height: 500, */
      color: CustomColor.bgLight1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          //TITLE
          Text(
            isEnglish ? textTitlesEn[1] : textTitlesEs[1],
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
          //PLATFORMS
          ConstrainedBox(
            //para limitar y que queden 2 y 2
            constraints: const BoxConstraints(maxWidth: 450),
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                //itero 4 contenedores
                for (int i = 0; i < platformMap.length; i++)
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight2,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: Icon(
                        platformMap.keys.elementAt(i),
                        color: CustomColor.whitePrimary,
                      ),
                      title: Text(
                        platformMap.values.elementAt(i),
                        style: const TextStyle(color: CustomColor.whitePrimary),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),

          //SKILLS
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                //itero mi mapa de skills
                for (int i = 0; i < skillsMap.length; i++)
                  InkWell(
                    // mouseCursor: SystemMouseCursors.click,
                    onTap: () => launchURLCustom(skillsLinks[i]),
                    child: Chip(
                      side: const BorderSide(
                          width: 0, color: CustomColor.bgLight2),
                      backgroundColor: CustomColor.bgLight2,
                      padding: const EdgeInsets.all(10),
                      label: Text(
                        skillsMap.values.elementAt(i),
                        style: const TextStyle(color: CustomColor.whitePrimary),
                      ),
                      avatar: Image.asset(skillsMap.keys.elementAt(i)),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
