
import 'package:flutter/material.dart';
import 'package:web_portfolio/constants/custom_color.dart';
import 'package:web_portfolio/constants/nav_items.dart';
import 'package:web_portfolio/constants/text_en.dart';
import 'package:web_portfolio/constants/text_es.dart';
import 'package:web_portfolio/utils/scroll_to_section.dart';

class DrawerMobile extends StatelessWidget {
  final bool isEnglish;
  const DrawerMobile({
    super.key, required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      backgroundColor: CustomColor.scaffoldBg,
      child: ListView(
        children: [
          //CLOSE BUTTON
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left:30,top: 10,bottom: 20),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, icon: const Icon(Icons.close,color: CustomColor.whitePrimary,)),
            ),
          ),
          //OPTIONS TILES
          for (int i = 0; i < textTitlesEs.length; i++)
            ListTile(
              hoverColor: CustomColor.yellowSecundary.withOpacity(0.1),
              onTap: () {
                Navigator.of(context).pop();
                scrollToSection(navBarKeys[i]);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              leading: Icon(
                navIcons[i],
                color: CustomColor.whitePrimary,
              ),
              title: Text(
                 isEnglish ? textTitlesEn[i] : textTitlesEs[i],
                style: const TextStyle(color: CustomColor.whitePrimary),
              ),
            ),
        ],
      ),
    );
  }
}