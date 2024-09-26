import 'package:web_portfolio/constants/text_en.dart';
import 'package:web_portfolio/constants/text_es.dart';

class Proyects {
  final String firstImage;
  final String title;
  final String subTitle;
  final List<String> techIcons;
  final bool hasLink;
  final String link;
  List<String> images;
  final String linkImage;

  Proyects(
      {required this.images,
      required this.linkImage,
      required this.hasLink,
      required this.link,
      required this.title,
      required this.subTitle,
      required this.techIcons,
      required this.firstImage});
}

List<Proyects> getProyectsListCards(bool isEnglish) {
  return [
    Proyects(
      title: isEnglish
          ? textProyectsEn.keys.elementAt(0)
          : textProyectsEs.keys.elementAt(0),
      subTitle: isEnglish
          ? textProyectsEn.values.elementAt(0)
          : textProyectsEs.values.elementAt(0),
      techIcons: [
        "assets/flutter.png",
        "assets/dart.png",
        "assets/firebase.png",
        "assets/gcloud.png",
        "assets/python.png",
      ],
      firstImage: "assets/congresoar/grupal.png",
      hasLink: true,
      link:
          "https://play.google.com/store/apps/details?id=com.sebastianbrusco.congresoar&hl=es_419",
      images: [
        'assets/congresoar/grupal1.jpg',
        'assets/congresoar/grupal2.jpg',
      ],
      linkImage: "assets/playstore.png",
    ),
    Proyects(
      title: isEnglish
          ? textProyectsEn.keys.elementAt(1)
          : textProyectsEs.keys.elementAt(1),
      subTitle: isEnglish
          ? textProyectsEn.values.elementAt(1)
          : textProyectsEs.values.elementAt(1),
      techIcons: [
        "assets/flutter.png",
        "assets/dart.png",
        "assets/firebase.png",
        "assets/gcloud.png",
      ],
      firstImage: "assets/moviesapp/grupal0.png",
      hasLink: false,
      link: "",
      images: [
        "assets/moviesapp/grupal2.jpeg",
        "assets/moviesapp/grupal3.jpeg",
      ],
      linkImage: "",
    ),
    Proyects(
      title: isEnglish
          ? textProyectsEn.keys.elementAt(2)
          : textProyectsEs.keys.elementAt(2),
      subTitle: isEnglish
          ? textProyectsEn.values.elementAt(2)
          : textProyectsEs.values.elementAt(2),
      techIcons: [
        "assets/c++.png",
        "assets/vscode.png",
        "assets/eclipse.png",
      ],
      firstImage: "assets/huffman/hufImg.jpg",
      hasLink: true,
      link:
          "https://github.com/Sebastian-G-Brusco-L/Algoritmo-de-Huffman",
      images: [
        "assets/huffman/grouphuf1.jpg",
        "assets/huffman/grouphuf2.jpg",
        "assets/huffman/grouphuf3v2.jpg",
      ],
      linkImage: "assets/github.png",
    ),
    Proyects(
      title: isEnglish
          ? textProyectsEn.keys.elementAt(3)
          : textProyectsEs.keys.elementAt(3),
      subTitle: isEnglish
          ? textProyectsEn.values.elementAt(3)
          : textProyectsEs.values.elementAt(3),
      techIcons: [
        "assets/c++.png",
        "assets/vscode.png",
        "assets/eclipse.png",
      ],
      firstImage: "assets/tads/grouptad1.jpg",
      hasLink: true,
      link:
          "https://github.com/Sebastian-G-Brusco-L/TADs-de-Estructuras-de-Datos/tree/main",
      images: [
        "assets/tads/grouptad1.jpg",
        "assets/tads/grouptad2.jpg",
      ],
      linkImage: "assets/github.png",
    ),
    Proyects(
      title: isEnglish
          ? textProyectsEn.keys.elementAt(4)
          : textProyectsEs.keys.elementAt(4),
      subTitle: isEnglish
          ? textProyectsEn.values.elementAt(4)
          : textProyectsEs.values.elementAt(4),
      techIcons: [
        "assets/flutter.png",
        "assets/dart.png",
        "assets/firebase.png",
      ],
      firstImage: "assets/portfolio/portfolioImg.jpg",
      hasLink: true,
      link: "https://github.com/Sebastian-G-Brusco-L/WebPortfolio/tree/main",
      images: [
        "assets/portfolio/portfolioImg.jpg",
        "assets/portfolio/portfolioImg2.jpg",
        "assets/portfolio/portfolioImg3.jpg",
      ],
      linkImage: "assets/github.png",
    ),
  ];
}

List<Proyects> getWOProyectsListCards(bool isEnglish) {
  return [
    Proyects(
      title: isEnglish
          ? textWOProyectsEn.keys.elementAt(0)
          : textWOProyectsEs.keys.elementAt(0),
      subTitle: isEnglish
          ? textWOProyectsEn.values.elementAt(0)
          : textWOProyectsEs.values.elementAt(0),
      techIcons: [
        "assets/flutter.png",
        "assets/dart.png",
        "assets/firebase.png",
        "assets/postman.png",
      ],
      firstImage: "assets/comparandoapp/groupcomp.jpg",
      hasLink: false,
      link: "",
      images: [
        "assets/comparandoapp/groupcomp1.jpg",
        "assets/comparandoapp/groupcomp2.jpg",
      ],
      linkImage: "",
    ),
    Proyects(
      title: isEnglish
          ? textWOProyectsEn.keys.elementAt(1)
          : textWOProyectsEs.keys.elementAt(1),
      subTitle: isEnglish
          ? textWOProyectsEn.values.elementAt(1)
          : textWOProyectsEs.values.elementAt(1),
      techIcons: [
        "assets/java.png",
        "assets/sql.png",
        "assets/eclipse.png",
      ],
      firstImage: "assets/OIG4.jpg",
      hasLink: false,
      link: "",
      images: [
        "assets/OIG4.jpg",
      ],
      linkImage: "",
    ),
  ];
}
