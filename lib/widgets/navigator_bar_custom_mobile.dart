import 'package:flutter/material.dart';
import 'package:web_portfolio/constants/custom_color.dart';

class NavigatorBarCustomMobile extends StatelessWidget {
  final Function translatePortfolio;
  final bool isEnglish;
  const NavigatorBarCustomMobile({
    super.key,
    required this.onPressedMenu,
    required this.translatePortfolio,
    required this.isEnglish,
  });
  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          CustomColor.scaffoldBg,
          CustomColor.bgLight1,
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
      //margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
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
            //MENU BUTTON
            IconButton(
              style: ButtonStyle(
                overlayColor: WidgetStatePropertyAll(
                  CustomColor.yellowSecundary.withOpacity(0.1),
                ),
              ),
              onPressed: onPressedMenu,
              icon: const Icon(
                Icons.menu,
                color: CustomColor.whitePrimary,
              ),
              padding: const EdgeInsets.all(3),
            )
          ],
        ),
      ),
    );
  }
}
