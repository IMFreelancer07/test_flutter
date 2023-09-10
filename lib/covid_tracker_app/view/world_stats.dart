import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatsCovid extends StatefulWidget {
  const WorldStatsCovid({super.key});

  @override
  State<WorldStatsCovid> createState() => _WorldStatsCovidState();
}

class _WorldStatsCovidState extends State<WorldStatsCovid> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat();

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  final colorList = <Color> [
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              PieChart(dataMap: {
                "Total" : 250,
                "Recovered" : 250,
                "Deaths" : 10,
              },
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                legendOptions: LegendOptions(
                  legendPosition: LegendPosition.left,
                ),
                animationDuration: Duration(milliseconds: 1200),
                chartType: ChartType.ring,
                colorList: colorList,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.06),
                child: Card(
                  child: Column(
                    children: [
                      ReuseableRow("title", "200"),
                      ReuseableRow("title", "200"),
                      ReuseableRow("title", "200"),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff1aa260),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("Track Countries"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ReuseableRow extends StatelessWidget {
  String title, value;
  ReuseableRow(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5,),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value)
            ],
          ),
          SizedBox(height: 8,),
          Divider(),
        ],
      ),
    );
  }
}

