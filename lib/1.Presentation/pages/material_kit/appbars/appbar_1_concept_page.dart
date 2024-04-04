import 'package:flutter/material.dart';

class AppBar1ConceptPage extends StatefulWidget {
  const AppBar1ConceptPage({super.key});

  @override
  State<AppBar1ConceptPage> createState() => _AppBar1ConceptPageState();
}

class _AppBar1ConceptPageState extends State<AppBar1ConceptPage> {
  ScrollController controller = ScrollController();
  double altura = 100.0;
  @override
  void initState() {
    controller.addListener(() {
      double posicion = controller.offset;
     if (controller.offset < 50) {
      setState(() {
            altura = 100-posicion;
      }); 
    }else{
      setState(() {
        altura = 50;
      });
    }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarConcept1Widget(context: context, height: altura,),
        body: ListView.builder(
          controller: controller,
          itemCount:  20,
          itemBuilder:(context, index) {
          return ListTile(title: Text("Item $index"),);
        },),
      ),
    );
  }
}


class AppBarConcept1Widget extends StatelessWidget implements PreferredSizeWidget{
  final BuildContext context;
  final double height; 
  const AppBarConcept1Widget({super.key, required this.context, required this.height});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.red, 
      duration:const Duration(milliseconds: 300),
      child: Row(
        children: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Text("AppBar_1_Concept"),
             SizedBox(height:height-50,),
             (height < 60)? Container(): AnimatedOpacity(opacity: height/((height < 100)?500:100),
             duration: const Duration(milliseconds: 400),
             child: const Icon(Icons.dark_mode))
            ]),
          const Spacer(),
        ],
      ),);
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(MediaQuery.of(context).size.width, height);
}