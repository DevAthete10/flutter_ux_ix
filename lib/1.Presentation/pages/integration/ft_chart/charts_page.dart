import 'package:flutter/material.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/ft_chart/chart_types_widgets/line_chart/sample_1.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/ft_chart/chart_types_widgets/line_chart/sample_2.dart';

class ChartsPage extends StatelessWidget {
  const ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color.fromRGBO(27, 35, 57, 10);
    // List<String> _chartTypes = ["Line Chart", "Bar Chart","Pie Chart","Scatter Chart","Radar Chart"];
    List<IconData> _chartTypes = [Icons.show_chart_sharp, Icons.bar_chart,Icons.pie_chart,Icons.bubble_chart_rounded,Icons.area_chart];
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(title: const Text("Chart Types"),),
        body: Column(
          children: [
            TabBar(
              tabs: List.generate(5, (index) => Tab(icon: Icon(_chartTypes[index]),),)),
            Expanded(
              child: TabBarView(
                children: [
                lineChart(backgroundColor),
                Container(color: Colors.red,),
                Container(color: Colors.yellow,),
                Container(color: Colors.blue,),
                Container(color: Colors.brown,),
              ],),
            ),
          ],
        )
      ),
    );
  }

  Container lineChart(Color backgroundColor) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          LineChartSample1(),
          LineChartSample2()
        ],),
              );
  }
}