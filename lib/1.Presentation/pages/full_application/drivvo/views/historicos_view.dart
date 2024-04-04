import 'package:flutter/material.dart';

class HistoricosView extends StatefulWidget {
  final int items;
  final Color colorSecundary;
  final Color colorPrimary;


  const HistoricosView({
    super.key, 
    required this.items, 
    required this.colorSecundary, required this.colorPrimary});

  @override
  State<HistoricosView> createState() => _HistoricosViewState();
}

class _HistoricosViewState extends State<HistoricosView> {
  bool agrandar = false;
  int selectItem =0;
  bool openPage = false;
  double altura = 50;   
  Color colorPage = const Color.fromARGB(255, 238, 238, 238);  
  String nombreVehiculoSleccionado = "Dominar 400";
  int vehiculoSleccionado = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        pageCar(context),
        historialDeServicios(context),
      ],
    );
  }

  Stack historialDeServicios(BuildContext context) {
    return Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: (widget.items *100)+30,              
                color: widget.colorSecundary,            
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.items,
                shrinkWrap: true,
                reverse: true,
                itemBuilder:(context, index) {            
                return InkWell(
                  onTap: () {
                    setState(() {
                        (agrandar)?agrandar = false:agrandar = true;
                        if(selectItem != index) agrandar = true; 
                        selectItem = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: (agrandar && selectItem == index)?130:100,
                    decoration:  BoxDecoration(
                      color: (agrandar && selectItem == index)?widget.colorPrimary.withAlpha(50):widget.colorSecundary,
                      border:const Border(top: BorderSide(width:0.1, color: Colors.black))
                    ),        
                    child: 
                    Row(
                      children: [
                        AnimatedContainer(
                          duration:const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(left: 20,right: 30),
                          width: 30,
                          height: (agrandar && selectItem == index)?130:100,
                          child: Stack(
                            clipBehavior: Clip.hardEdge,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: AnimatedContainer(         
                                  duration: const Duration(milliseconds: 300),
                                  color: Colors.black,
                                  width: 10,
                                  height: (agrandar && selectItem == index)?130:100                          
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1,
                                  child: ListView.builder(
                                    itemCount: 25,                            
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder:(context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 3),
                                      height: 1,color: widget.colorSecundary,);
                                  },),
                                ),
                              ),
                              Positioned.fill(
                                left: -5,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.oil_barrel, color: widget.colorPrimary,size: 40,)),
                              )
                            ],
                          ),
                        ),
                         Column(
                          children: [
                            Text("Aceite ${index+1}"),
                            const Spacer(),
                            const Text("santiago, de chile"),
                            const Text("35.000 KM"),
                          ],
                        ),
                        const Spacer(),
                        Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          (agrandar && selectItem == index)
                          ?Row(children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: (){
                                showDialog(context: context, builder: (context) {
                                  return SimpleDialog(
                                    title:const Text("Cambio de aceite"),
                                    children: [
                                      const SizedBox(height: 20,),
                                      const Text("¿Deseas eliminar este servicio?", textAlign: TextAlign.center,),
                                      const SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          IconButton(
                                            icon: const Text("Confirmar"), 
                                            onPressed: () { 
                                              Navigator.pop(context);
                                             },),
                                          IconButton(
                                            icon: const Text("Cancelar"), 
                                            onPressed: () { 
                                              Navigator.pop(context);
                                             },),                                        
                                        ],
                                      )
                                    ],
                                  );
                                },) ;                             
                              }, icon:const Icon(Icons.delete,),),
                            IconButton(
                              padding: EdgeInsets.zero,onPressed: (){
                                Navigator.pushNamed(context, "detail_vehiculo_drivvo");
                              }, icon:const Icon(Icons.edit,),),
                            IconButton(onPressed: (){
                                Navigator.pushNamed(context, "detail_vehiculo_drivvo");
                            }, icon:const Icon(Icons.remove_red_eye_sharp,),),                          
                          ],)
                          : Container(),
                          const Spacer(),
                          const Text("10 Mar"),
                          const Text("10.000 pesos"),                        
                        ],
                      ),
                      const SizedBox(width: 20,)
                      ],
                    ),
                  ),
                );
              },)
              ,
          ),
          (openPage)
          ? GestureDetector(
            onTap: () {
              setState(() {
                openPage = false;
                altura = 50;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: Colors.black26,height: (widget.items*100)+30,width: MediaQuery.of(context).size.width,))
          :Container()
        ],
      );
  }

  AnimatedContainer pageCar(BuildContext context) {
    return AnimatedContainer(
              duration: const Duration(milliseconds: 300),                
              color: colorPage,            
              height: altura,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [                    
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView.builder(
                      itemCount: 20,
                      shrinkWrap: true,
                      itemBuilder:(context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              vehiculoSleccionado = index;
                              nombreVehiculoSleccionado = "Dominar 400 - ${index +1}";
                              openPage = false;
                              altura = 50;
                            });
                          },
                          child: Container(
                            color: (vehiculoSleccionado == index)? widget.colorPrimary.withAlpha(50):colorPage,                            
                            child: ListTile(
                              title:Text("Dominar 400 ${index +1}"),
                              leading: ClipOval(
                                child: Image.network(
                                  "https://lamoto.com.ar/wp-content/uploads/2021/07/Bajaj-Dominar-400-blanca-primera-generacion.jpg",
                                  fit: BoxFit.cover,
                                  height: 40,
                                  width: 40,),
                              ),
                            ),
                          ),
                        );
                      },),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                        child:  SizedBox(
                          height: 50,
                          child: Row(                              
                            children: [
                              (openPage)
                              ?Container()
                              :ClipOval(
                                child: Image.network(
                                  "https://lamoto.com.ar/wp-content/uploads/2021/07/Bajaj-Dominar-400-blanca-primera-generacion.jpg",
                                  fit: BoxFit.cover,
                                  height: 40,
                                  width: 40,),),
                              const SizedBox(width: 10,),
                              Text((altura == 50)?nombreVehiculoSleccionado:"Seleccionar vehiculo"),
                              const SizedBox(width: 20,),
                              Icon((altura == 50)?Icons.arrow_downward_outlined:Icons.arrow_upward_outlined),      
                              (openPage)
                              ?IconButton(                        
                                onPressed: (){}, icon: Icon(Icons.add, color: widget.colorPrimary,))
                              :Container()  
                            ],
                          ),
                        ), 
                        onTap: () {
                            setState(() {
                              agrandar = false;
                            if (altura == 50) {
                                altura = 300;
                              openPage = true;
                            } else{
                              altura = 50;
                              openPage = false;
                            }
                            });
                          },
                        ),                      
                      ],
                    ),
                  ),                    
                ],
              ),);
  }
}

