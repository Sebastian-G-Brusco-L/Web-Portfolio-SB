import 'package:flutter/material.dart';
import 'package:web_portfolio/constants/custom_color.dart';
import 'package:web_portfolio/constants/nav_items.dart';
import 'package:web_portfolio/constants/text_en.dart';
import 'package:web_portfolio/constants/text_es.dart';

class AboutMobile extends StatelessWidget {
  final bool isEnglish;
  const AboutMobile({
    super.key,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        //IMAGE
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColor.yellowSecundary, // Color del borde
              width: 2.0, // Ancho del borde
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              "assets/profile.png",
              fit: BoxFit
                  .cover, // Esto asegurará que la imagen cubra todo el espacio circular
            ),
          ),
        ),
        //TEXT
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LimitedBox(
                child: Text(
                  isEnglish ? textGreetEn["greet"]! : textGreetEs["greet"]!,
                  style: TextStyle(
                      shadows: [
                        Shadow(
                          offset: const Offset(0, 4),
                          blurRadius: 10,
                          color: CustomColor.whiteSecondary.withOpacity(0.4),
                        ),
                      ],
                      fontSize: 24,
                      color: CustomColor.whitePrimary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //CONTAINERS
            for (int i = 0; i < 4; i++)
              Container(
                margin: const EdgeInsets.all(4),
                height: 40,
                decoration: const BoxDecoration(
                  color: CustomColor.bgLight1,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        aboutIcons[i],
                        color: CustomColor.yellowSecundary,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        isEnglish
                            ? textAboutEn.values.elementAt(i)
                            : textAboutEs.values.elementAt(i),
                        style: const TextStyle(
                          color: CustomColor.whiteSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ],
    );
  }
}
