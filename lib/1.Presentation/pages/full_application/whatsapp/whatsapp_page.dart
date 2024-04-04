import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_ux_ix/1.Presentation/bloc/contenido/contenido_bloc.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/full_application/whatsapp/chats.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/full_application/whatsapp/estados.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/full_application/whatsapp/llamadas.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/full_application/whatsapp/novedades.dart';

class WhatsAppPage extends StatefulWidget {
  const WhatsAppPage({super.key});

  @override
  State<WhatsAppPage> createState() => _WhatsAppPageState();
}

class _WhatsAppPageState extends State<WhatsAppPage>  with SingleTickerProviderStateMixin{
  int selectPage = 1;
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);    
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    List tabs = ["Icon", "Chats", "Novedades", "Llamadas"];
    
        Color colorPrincipal = const Color.fromRGBO(18, 27, 34, 10),        
          colorSecundary = const Color.fromRGBO(31, 44, 52, 10);
              Color colorIcon = const Color.fromRGBO(0, 168, 132, 10);

    return BlocBuilder<ContenidoBloc, ContenidoState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorPrincipal,
          floatingActionButton: FloatingActionButton(
            backgroundColor: colorIcon,
            onPressed: (){
              
            }, child: const Icon(Icons.add_ic_call, color: Colors.black,),),
          appBar: AppBar(
            backgroundColor:colorSecundary,
            title: Text(state.itemSeleccionado.nombre, style: const TextStyle(color: Colors.white),),
            actions:const [
              Icon(Icons.camera_alt,color: Colors.white,size: 30,),
              SizedBox(width: 15,),
              Icon(Icons.search,color: Colors.white,size: 30),
              SizedBox(width: 15,),
              Icon(Icons.more_vert,color: Colors.white,size: 30),
              SizedBox(width: 10,),
            ],
          ),
          body: Column(
            children: [                
              Container(
                padding: const EdgeInsets.only(top: 20),
                color: colorSecundary,
                child: TabBar(
                  indicatorColor: Colors.green,                                    
                  controller: controller,
                  dividerColor: Colors.black,                    
                    labelPadding: const EdgeInsets.only(bottom: 7),
                    onTap: (value) {
                      setState(() {
                        selectPage = value;
                      });
                    },
                    tabs: List.generate(
                        tabs.length,
                        (index) => Text(
                              tabs[index],
                              style: TextStyle(fontSize: 15, color: (selectPage == index)?Colors.green :Colors.grey),
                            ))),
              ),
              Expanded(
                child: TabBarView(               
                  controller: controller,
                  children: [
                 EstadosView(image: state.itemSeleccionado.urlImage,),
                  ChatsView(length: 5, image: state.itemSeleccionado.urlImage),
                 const NovedadesView(),
                  LlamadasView(image: state.itemSeleccionado.urlImage,)
                ]),
              ),
            ],
          ),
        );
      },
    );
  }

}
