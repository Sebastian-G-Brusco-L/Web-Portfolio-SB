import 'package:flutter/material.dart';
import 'package:web_portfolio/constants/custom_color.dart';
import 'package:web_portfolio/constants/nav_items.dart';
import 'package:web_portfolio/constants/text_en.dart';
import 'package:web_portfolio/constants/text_es.dart';

class AboutDesktop extends StatelessWidget {
  final bool isEnglish;
  const AboutDesktop({
    super.key,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minHeight: 350), //altura minima cuando se achique la pantalal
      height: 500,
      color: CustomColor.scaffoldBg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //TEXT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isEnglish ? textGreetEn["greet"]! : textGreetEs["greet"]!,
                style: TextStyle(
                    shadows: [
                      Shadow(
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                        color: CustomColor.whiteSecondary.withOpacity(0.4),
                      ),
                    ],
                    fontSize: 28,
                    color: CustomColor.whitePrimary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              //CONTAINERS
              for (int i = 0; i < 4; i++)
                Container(
                  margin: const EdgeInsets.all(4),
                  height: 40,
                  decoration: const BoxDecoration(
                      color: CustomColor.bgLight1,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
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
            ],
          ),
          const SizedBox(
            width: 30,
          ),

          //IMAGE
          Container(
            width: 150,
            height: 150,
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
          )
        ],
      ),
    );
  }
}
