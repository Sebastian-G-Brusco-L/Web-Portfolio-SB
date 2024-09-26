//CARD GRANDE
import 'package:flutter/material.dart';
import 'package:web_portfolio/constants/custom_color.dart';
import 'package:web_portfolio/constants/proyects.dart';
import 'package:web_portfolio/utils/launch_url.dart';

class BigCardMobile extends StatefulWidget {
  const BigCardMobile({
    super.key,
    required this.indexC,
    required this.proyects,
  });
  final int indexC;
  final List<Proyects>
      proyects; //PASO PROYECT GENERICO, SEA EL PROYECT O EL WOPROYECT

  @override
  State<BigCardMobile> createState() => _BigCardDesktopState();
}

class _BigCardDesktopState extends State<BigCardMobile> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      constraints: const BoxConstraints(maxHeight: 600, maxWidth: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //CARRUSEL IMAGENES
          Stack(
            children: [
              //IMAGEN
              SizedBox(
                width: 600,
                height: 250,
                child: PageView.builder(
                  itemCount: widget.proyects[widget.indexC].images.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        widget.proyects[widget.indexC].images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),

              //BOTON CERRAR
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.black26),
                  ),
                  icon: const Icon(Icons.close),
                  color: CustomColor.whitePrimary,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),

              // INDICADORES DE PÁGINA
              Positioned(
                bottom: 10,
                left: size.width / 2.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.proyects[widget.indexC].images.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? CustomColor.whitePrimary
                            : CustomColor.bgLight2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          //TITULO
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                //TITULO
                Text(
                  widget.proyects[widget.indexC].title,
                  style: const TextStyle(
                      color: CustomColor.whitePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Spacer(),
                //ICON PLAYSTORE O WEB
                if (widget.proyects[widget.indexC].hasLink)
                  IconButton(
                    iconSize: 30,
                    // padding: EdgeInsets.all(0),
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(CustomColor.bgLight2)),
                    onPressed: () {
                      launchURLCustom(widget.proyects[widget.indexC].link);
                    },
                    icon: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        widget.proyects[widget.indexC].linkImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          //DESCRIPCION MAS DETALLADA
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: SingleChildScrollView(
                child: Text(
                  widget.proyects[widget.indexC].subTitle,
                  style: const TextStyle(
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    color: CustomColor.whiteSecondary,
                  ),
                  maxLines: 50,
                ),
              ),
            ),
          ),
          //const Spacer(),
          //TECNOLOGIAS
          Container(
            color: CustomColor.bgLight2,
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //TECHNOLOGIES
                for (int j = 0;
                    j < widget.proyects[widget.indexC].techIcons.length;
                    j++)
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    maxRadius: 10,
                    child: Image.asset(
                        widget.proyects[widget.indexC].techIcons[j]),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
