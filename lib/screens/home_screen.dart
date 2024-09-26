import 'package:flutter/material.dart';
import 'package:web_portfolio/constants/custom_color.dart';
import 'package:web_portfolio/constants/size.dart';
import 'package:web_portfolio/utils/scroll_to_section.dart';
import 'package:web_portfolio/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isEnglish = false;
  void translatePortfolio() {
    setState(() {
      isEnglish = !isEnglish;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey =
        GlobalKey<ScaffoldState>(); //genero key globar para este scaffold
    final scrollController =
        ScrollController(); //controlador de scroll para el navbar

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          body: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading:
                    false, // this will hide Drawer hamburger icon
                actions: <Widget>[
                  Container()
                ], // this will hide endDrawer hamburger icon
                pinned: true, // Mantengo fijo el appbar
                backgroundColor: CustomColor.scaffoldBg,
                //NAV BAR
                flexibleSpace: FlexibleSpaceBar(
                  background: constraints.maxWidth >= minWidthResponssive
                      ? NavigatorBarCustomDesktop(
                          translatePortfolio: translatePortfolio,
                          isEnglish: isEnglish,
                        )
                      : NavigatorBarCustomMobile(
                          onPressedMenu: () =>
                              scaffoldKey.currentState?.openEndDrawer(),
                          translatePortfolio: translatePortfolio,
                          isEnglish: isEnglish,
                        ),
                ),
              ),
              //sliver to box adapter para aniadir slivers no scrolleables
              //ABOUT
              SliverToBoxAdapter(
                key: navBarKeys[0],
                child: constraints.maxWidth >= minWidthResponssive
                    ?  AboutDesktop(isEnglish: isEnglish,)
                    :  AboutMobile(isEnglish: isEnglish,),
              ),
              //SKILLS
              SliverToBoxAdapter(
                key: navBarKeys[1],
                child: constraints.maxWidth >= midWidthResponssive
                    ?  SkillsDesktop(isEnglish: isEnglish,)
                    :  SkillsMobile(isEnglish: isEnglish,),
              ),
              //PROYECTS
              SliverToBoxAdapter(
                key: navBarKeys[2],
                child: constraints.maxWidth >= midWidthResponssive
                    ?  ProyectsDekstop(isEnglish: isEnglish,)
                    :  ProyectsMobile(isEnglish: isEnglish,),
              ),
              //WOPROYECTS
              SliverToBoxAdapter(
                key: navBarKeys[3],
                child: constraints.maxWidth >= midWidthResponssive
                    ?  WorkingOnProyectsDesktop(isEnglish: isEnglish,)
                    :  WorkingOnProyectsMobile(isEnglish: isEnglish,),
              ),
              //CONTACT
              SliverToBoxAdapter(
                key: navBarKeys[4],
                child:  ContactMobileDesktop(isEnglish: isEnglish,),
              ),
            ],
          ),
          endDrawer: DrawerMobile(isEnglish: isEnglish,),
        );
      },
    );
  }
}
