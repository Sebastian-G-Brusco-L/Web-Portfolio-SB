//CARD GRANDE
import 'package:flutter/material.dart';
import 'package:web_portfolio/constants/custom_color.dart';
import 'package:web_portfolio/constants/proyects.dart';
import 'package:web_portfolio/utils/launch_url.dart';

class BigCardDesktop extends StatefulWidget {
 
  const BigCardDesktop({
    super.key,
    required this.indexC,
    required this.proyects, 
  });
  final int indexC;
  final List<Proyects>
      proyects; //PASO PROYECT GENERICO, SEA EL PROYECT O EL WOPROYECT

  @override
  State<BigCardDesktop> createState() => _BigCardDesktopState();
}

class _BigCardDesktopState extends State<BigCardDesktop> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _previousImage() {
    if (_currentPage > 0) {
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextImage() {
    if (_currentPage < widget.proyects[widget.indexC].images.length - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      constraints: const BoxConstraints(
          maxHeight: 800, maxWidth: 600, minHeight: 300, minWidth: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //CARRUSEL IMAGENES
          Stack(
            children: [
              //IMAGEN
              SizedBox(
                width: 600,
                height: 300,
                child: PageView.builder(
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
              // BOTON ANTE
              Positioned(
                left: 5,
                top: 150,
                child: IconButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.black26),
                  ),
                  icon: const Icon(Icons.arrow_back),
                  color: CustomColor.whitePrimary,
                  onPressed: () {
                    _previousImage();
                  },
                ),
              ),
              //BOTON SIG
              Positioned(
                top: 150,
                left: 555,
                child: IconButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.black26),
                  ),
                  icon: const Icon(Icons.arrow_forward),
                  color: CustomColor.whitePrimary,
                  onPressed: () {
                    _nextImage();
                  },
                ),
              ),

              //BOTON CERRAR
              Positioned(
                top: 20,
                left: 555,
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
            ],
          ),

          //TITULO
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(CustomColor.bgLight2),
                    ),
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
                      widget.proyects[widget.indexC].techIcons[j],
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
