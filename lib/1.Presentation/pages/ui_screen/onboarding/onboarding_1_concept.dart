import 'package:flutter/material.dart';

class Onboarding1ConceptPage extends StatelessWidget {
  const Onboarding1ConceptPage({super.key});


  @override
  Widget build(BuildContext context) {
    double valorInicial = 25;
    
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.85,
            child: PageView.builder(
              onPageChanged: (value) {
                valorInicial = 7;
              },
              itemCount: 3,
              itemBuilder:(context, indexPage) {
                print(valorInicial);
              return TweenAnimationBuilder<double>(
                builder: (context, value, widget) {
                  return Column(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Image.network("https://static.fundacion-affinity.org/cdn/farfuture/hHjlkRJJ0mnR1zVGzWk-SEX1BpGXvE56GGuN6h89MWM/mtime:1528830329/sites/default/files/descubre-como-se-comporta-un-gato.jpg?itok=n2kVSTSl",
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height*.4,),
                              IconButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                }, 
                                icon: const Icon(Icons.arrow_back))  
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) => Container(
                          margin: const EdgeInsets.only(right: 5),
                            height: 5,
                            width: (indexPage == index) ? value : 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (indexPage == index) ? Colors.yellow: Colors.grey
                            ),
                          )),),
                      const Padding(              
                        padding: EdgeInsets.all(8.0),
                        child: Text("Book a hoter for your relaxation and vacation", 
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold), ),
                      ),
                      const Padding(              
                        padding: EdgeInsets.all(8.0),
                        child: Text("Book a hoter for your relaxation and vacation", 
                        style: TextStyle(
                          fontSize: 12,), ),
                      ),    
                    ],
                  );
                }, 
                duration:  const Duration(milliseconds: 500), 
                tween: Tween(begin: valorInicial, end: 25),
              );
            },),
          ),
          SizedBox(                    
            height: MediaQuery.of(context).size.height *.15 ,
            width: MediaQuery.of(context).size.width*.9,
            child:const Row(
              children: [
                Icon(Icons.arrow_circle_right, color: Colors.blue,size: 45,),
                SizedBox(width: 10,),
                Text("Continue", style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
          )        
        ],
      ),
    );
  }
}