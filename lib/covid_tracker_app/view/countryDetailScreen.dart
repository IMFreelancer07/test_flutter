import 'package:flutter/material.dart';
import 'package:test_flutter/covid_tracker_app/view/world_stats.dart';

class CountryDetailScreen extends StatefulWidget {
  String name, image;
  int totalCases, totalDeaths, totalRecovered, active, critical, todayRecovered, test;

  CountryDetailScreen({
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * .06,),
                      ReuseableRow("cases", widget.totalCases.toString()),
                      ReuseableRow("Today recovered", widget.todayRecovered.toString()),
                      ReuseableRow("Tests", widget.test.toString()),
                      ReuseableRow("Critical", widget.critical.toString()),
                      ReuseableRow("Total Recovered", widget.totalRecovered.toString()),
                      ReuseableRow("Total Deaths", widget.totalDeaths.toString()),
                      ReuseableRow("Total Cases", widget.totalCases.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
