import 'package:flutter/material.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/full_application/drivvo/utils/select_view.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/full_application/drivvo/widgets/modal_opciones_widget.dart';

class DrivvoPage extends StatefulWidget {
  const DrivvoPage({super.key});

  @override
  State<DrivvoPage> createState() => _DrivvoPageState();
}

class _DrivvoPageState extends State<DrivvoPage> with TickerProviderStateMixin {

  int selectPage = 0;
  bool openPage = false;
  late PageController pageController;

  @override
  void initState(){
    pageController = PageController(initialPage: selectPage);  
    super.initState();
  }  
  @override
  Widget build(BuildContext context) {

    Color colorPrimary = const Color.fromARGB(255, 0, 188, 213);   
    Color colorSecundary = const Color.fromARGB(255, 255, 252, 250);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Drivvo"),backgroundColor: colorPrimary,),        
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: PageView.builder(              
            itemCount: 4,
            controller: pageController,            
            onPageChanged: (value) {
              setState(() {
                selectPage = value;
                openPage = false;
              });
            },
            itemBuilder:(context, index) {           
            return SingleChildScrollView(             
              child: SelectView().seleccionarView(
                posicion: index, 
                colorPrimary: colorPrimary, 
                colorSecundary: colorSecundary)
            );
          },),
        ),      
        bottomNavigationBar:  navigatorBar(colorSecundary, colorPrimary, context),
      ),
    );
  }

  Container navigatorBar(Color colorSecundary, Color colorPrimary, BuildContext context) {
   final List<String> _itemsBar = ["Histórico","Informes","Recordatorios","Más"]; 
   final List<IconData> _itemsBarIcon = [Icons.notes_rounded,Icons.bar_chart_outlined,Icons.alarm,Icons.more_horiz]; 
    return Container(
        decoration: BoxDecoration(
          color: colorSecundary,  
          border: const Border(top: BorderSide(width: 0.1,color: Colors.black))
        ),
        height: 60,
        child: Stack(
          clipBehavior: Clip.none,
          children: [            
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_itemsBar.length, (index) =>              
                   InkWell(
                    splashColor: Colors.black,
                    highlightColor: Colors.black,
                    radius: 200,
                    focusColor: Colors.black,
                      onTap: () {
                        setState(() {
                          selectPage = index;
                        });
                        pageController.animateToPage(selectPage, duration: const Duration(microseconds: 300), curve: Curves.bounceIn);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.only(right: (index == 1 && !openPage )?35:5,left: (index == 2 && !openPage )?35:5 ),                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(_itemsBarIcon[index], color: (selectPage == index)?colorPrimary:Colors.black,size: 25),
                            Text(_itemsBar[index], style: TextStyle(color: (selectPage == index)?colorPrimary:Colors.black),)
                          ],
                        ),
                      ),
                    ),
                ),
              ),
            ),
            (openPage)
            ?Container()
            :Positioned.fill(
              top:-15 ,
              child: Align(     
                alignment: Alignment.topCenter,                                 
                      child: InkWell(
                        onTap: () {
                          modalOpciones(context, colorPrimary, colorSecundary);                            
                        },
                        child: Hero(
                          tag: "icon",
                          child: Container(                          
                            transform: Matrix4.translationValues(0, 0, 10000),
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              color: colorPrimary,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: const Icon(Icons.add, color: Colors.white,size: 30,),
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ));
  }

  Future<dynamic> modalOpciones(BuildContext context, colorPrimary, colorSecundary) {
    return showModalBottomSheet(
                transitionAnimationController:  AnimationController(vsync: this, duration:const Duration(milliseconds: 100)),
                backgroundColor: Colors.white.withOpacity(0),
                context: context, builder:(context) {
                return ModalOpcionesWidget(colorPrimary: colorPrimary, colorSecundary: colorSecundary);
              },
            );
  }
  
}
