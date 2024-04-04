import 'package:flutter/material.dart';

class MyFitnessPalPage extends StatefulWidget {
  const MyFitnessPalPage({super.key});

  @override
  State<MyFitnessPalPage> createState() => _MyFitnessPalPageState();
}

class _MyFitnessPalPageState extends State<MyFitnessPalPage> {
  PageController controller = PageController(viewportFraction: .9);  
  int selectSlide = 0;  
  Color colorPrimary = const Color.fromRGBO(37, 39, 51, 1.0);
  Color colorSecundary = const Color.fromRGBO(51, 53, 58, 10);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: colorPrimary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title:const Text("myfitnesspal",style: TextStyle(color: Colors.blueAccent),),
              expandedHeight: 70,
              pinned: true,
              backgroundColor: colorPrimary,
              flexibleSpace: Column(
                children: [
                  Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text("Pasar a premium", style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),),
            SliverList.builder(
              itemCount: 3,
              itemBuilder:(context, index) {
                late Widget view;
                switch (index) {
                  case 0:  
                  view = titulo(context);                                                   
                    break;
                  case 1:                             
                  view = slides(context: context, length: 5);           
                    break;
                  case 2:
                  view = datos(context);
                    break;
                  default:
                }
                return view;
            },)
          ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.more_vert), label: "Más"),
          BottomNavigationBarItem(icon: Icon(Icons.more_vert), label: "Más"),
        ]),
    );
  }

   datos(BuildContext context) => Column(
     children: [
       Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(2, (index) => Container(
                 padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                 height: 120,
                 width: MediaQuery.of(context).size.width*.44,              
                    decoration: BoxDecoration(
                      color: colorSecundary,          
                      borderRadius: BorderRadius.circular(20)
                    ),
                 child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pasos", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(Icons.pending, color: Colors.red,),
                      SizedBox(width: 10,),
                      SizedBox(
                        height: 60,
                        width: 80,
                        child: Text("Conéctese para monitoreo",style: TextStyle(color: Colors.grey),)),
                      Icon(Icons.arrow_right, color: Colors.red,),                  
                    ],)
                  ],
                 ),   
              )),
             ),
       const SizedBox(height: 20,),
       SizedBox(
        height: MediaQuery.of(context).size.height*.3,
        child: PageView.builder(
          controller: PageController(viewportFraction: .9),
          itemCount: 2,
          itemBuilder:(context, index) {
            return  Container(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          transform: Matrix4.translationValues((index+1 == 1)?-15:0, 0, 0),
          height: 120,
          width: MediaQuery.of(context).size.width*.44,              
            decoration: BoxDecoration(
              color: colorSecundary,          
              borderRadius: BorderRadius.circular(20)
            ),          
            );
          },),
       ),
       const SizedBox(height: 20,),
     ],
   );

   titulo(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text("Hoy", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
      Container(
        padding:const EdgeInsets.symmetric(vertical:5,horizontal: 10),
        decoration: BoxDecoration(
          color: colorSecundary,
          borderRadius: BorderRadius.circular(20)
        ),
        child: const Text("Editar", style: TextStyle(color: Colors.blueAccent, fontSize: 18, fontWeight: FontWeight.bold),),
      )
    ],
   );

   slides({required BuildContext context, required int length}){
    return SizedBox(      
      height: MediaQuery.of(context).size.height*.4,      
      child: Column(    
        crossAxisAlignment: CrossAxisAlignment.start,    
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.34,
            child: PageView.builder(
              itemCount: length,    
              controller: controller,   
              onPageChanged: (value) {
                setState(() {
                  selectSlide = value;
                });
              },
              itemBuilder:(context, index) {            
              return Container(
                transform: Matrix4.translationValues((index+1 == 1)?-15:0, 0, 0),
                padding:const EdgeInsets.all(10),
                margin:  EdgeInsets.only(top: 10, bottom: 10, right: (index+1> 1)?10:0,left: (index+1> 1)?10:0),
                decoration: BoxDecoration(
                  color: colorSecundary,          
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Calorías", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                    const Text("Restante = Objetivo - Alimentos + Ejercicio", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border:  Border.symmetric(
                              horizontal: BorderSide(
                                  width: 15,
                                  color: colorPrimary
                              ),
                              vertical: BorderSide(
                                  width: 15,
                                  color: colorPrimary
                            )
                            )
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("2,420", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                              Text("Restantes", style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                        ),                        
                        Column(
                          children: List.generate(3, (index) => Row(
                            children: [
                              Icon(Icons.food_bank, color: (index == 1) ? Colors.blue:Colors.grey,),
                              const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Objetivo base", style: TextStyle(color: Colors.grey),),
                                  Text((index == 0) ?"2,420":"0", style: TextStyle(color: Colors.white),),
                                ],
                              )
                            ],
                          )),
                        )
                      ],
                    )
                  ],
                ),
                );
            },),
          ),
          SizedBox(height: 10,),          
          Row(
            children: List.generate(length+2, (index){
              if (index == 0 || index == length+1 ) {
                return const Spacer();
              }
              return Container(
                decoration: BoxDecoration(
                  color: (selectSlide+1 == index) ? Colors.blue: Colors.grey,
                  borderRadius: BorderRadius.circular(20)
                ),
                margin: const EdgeInsets.only(right: 10),
                height: 11,
                width: 11,
                );
            }),
          ),          
        ],
      ),
    );
   }
}