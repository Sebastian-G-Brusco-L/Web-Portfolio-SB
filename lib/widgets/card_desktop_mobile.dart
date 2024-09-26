//CARD CHIQUITA PRINCIPAL
import 'package:flutter/material.dart';
import 'package:web_portfolio/constants/custom_color.dart';
import 'package:web_portfolio/constants/proyects.dart';

class CardDesktopMobile extends StatelessWidget {
  const CardDesktopMobile(
      {super.key,
      required this.i,
      required this.proyects,
      required this.colorFooter});

  final int i;
  final List<Proyects> proyects;
  final Color colorFooter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Card(
        shadowColor: CustomColor.yellowSecundary.withOpacity(0.1),
        elevation: 20,
        child: Container(
          height: 280,
          width: 250,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: CustomColor.bgLight2,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //IMAGE
              Image.asset(
                proyects[i].firstImage,
                fit: BoxFit.cover,
                width: 250,
                height: 140,
              ),
              //TITLE
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  proyects[i].title,
                  style: const TextStyle(
                      color: CustomColor.whitePrimary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //SUBTITLE
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
                child: Text(
                  proyects[i].subTitle,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: CustomColor.whiteSecondary,
                  ),
                  maxLines: 3,
                ),
              ),
              const Spacer(),
              //FOOTER
              Container(
                color: colorFooter,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //TECHNOLOGIES
                    for (int j = 0; j < proyects[i].techIcons.length; j++)
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        maxRadius: 10,
                        child: Image.asset(proyects[i].techIcons[j]),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
