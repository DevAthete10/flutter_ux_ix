import 'package:flutter/material.dart';

class NavigatorBar2ConceptPage extends StatefulWidget {
  const NavigatorBar2ConceptPage({super.key});

  @override
  State<NavigatorBar2ConceptPage> createState() => _NavigatorBar2ConceptPageState();
}

class _NavigatorBar2ConceptPageState extends State<NavigatorBar2ConceptPage> {
  int selectItemTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NavigatorBar Concept 2"),),
      body: Container(
        color: Colors.red,
        child: ListView.builder(
          itemCount: 20,
          itemBuilder:(context, index) {
            return ListTile(title: Text("item $index"),);
          },),),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        height: (selectItemTab == 2)?70:120,width: MediaQuery.of(context).size.width,
        child: CustomPaint(
          painter: NavigatorBarPainter(),
          child: Column(
            children: [
             (selectItemTab == 2)? Container(): Container(color: Colors.red,height: 30,width: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) => IconButton(
                      padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      onPressed: (){
                          setState(() {
                            selectItemTab = index;
                          });
                      }, icon: const SizedBox(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.add),
                            Text("Tablero"),
                          ],),
                      )),)),
            ],
          ),),),
    );
  }
}

class NavigatorBarPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
        ..strokeWidth = 10
        ..color       = Colors.yellow
        ..style       =PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(size.width*0.5, -size.height*0.5, size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(NavigatorBarPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(NavigatorBarPainter oldDelegate) => false;
}