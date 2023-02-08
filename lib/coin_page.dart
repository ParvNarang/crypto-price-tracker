import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chart.dart';

class CoinPage extends StatelessWidget {
  CoinPage(
      {Key? key,
      required this.name,
      required this.symbol,
      required this.imageurl,
      required this.price,
      required this.change,
      required this.high_24h,
      required this.low_24h,
      required this.changePercentage,
      required this.graph_list})
      : super(key: key);

  String name;
  String symbol;
  String imageurl;
  double change;
  double changePercentage;
  double high_24h;
  double low_24h;
  double price;

  List<dynamic> graph_list;
  // final redShadowColor = Color.fromARGB(66, 255, 137, 129);
  final redShadowColor = Color.fromARGB(66, 255, 137, 129);
  final greenShadowColor = Color.fromARGB(97, 76, 175, 79);
  final blueShadowColor = Color.fromARGB(75, 33, 149, 243);
  @override
  Widget build(BuildContext context) {
    List<FlSpot> flSpotList = graph_list
        .whereType<double>()
        .map((value) => FlSpot(graph_list.indexOf(value).toDouble(), value))
        .toList();
    double maxX;
    double maxY;
    maxX = 80;
    maxY = graph_list[0] / 10;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 140,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 39,
                            child: CircleAvatar(
                              //backgroundImage: NetworkImage(imageurl),
                              backgroundColor: Colors.white,
                              foregroundImage: NetworkImage(imageurl),
                              radius: 37,
                            )),
                        const SizedBox(
                          width: 100,
                        ),
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: name.length > 11 ? 19 : 29,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      symbol,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      NumberFormat.simpleCurrency(
                              locale: 'hi-IN', decimalDigits: 2)
                          .format(price.toDouble().toInt())
                          .toString(),
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      change.toDouble().toString()[0] == "-"
                          ? '' + change.toDouble().toString()
                          : '+' + change.toDouble().toString(),
                      style: TextStyle(
                          color: change.toDouble().toString()[0] == "-"
                              ? Colors.red
                              : Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      changePercentage.toDouble().toString()[0] == "-"
                          ? '' + changePercentage.toDouble().toString() + '%'
                          : '+' + changePercentage.toDouble().toString() + '%',
                      style: TextStyle(
                          color:
                              changePercentage.toDouble().toString()[0] == "-"
                                  ? Colors.red
                                  : Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RaisedButton(
                          onPressed: () {
                            var snackBar =
                                SnackBar(content: Text('Bought $name'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          color: Colors.blue[800],
                          child: const Text(
                            "Buy",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        RaisedButton(
                          onPressed: () {
                            var snackBar =
                                SnackBar(content: Text('Sold $name'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          color: Colors.blue[800],
                          child: const Text("Sell",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Day High : " + high_24h.toDouble().toString(),
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[300],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Day Low  : " + low_24h.toDouble().toString(),
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 300,
                            ),
                            changePercentage.toDouble().toString()[0] == "-"
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 110),
                                    child: SizedBox(
                                      height: 25,
                                      width: 110,
                                      child: LineChart(sampleData(flSpotList,
                                          red, Colors.transparent, maxX, maxY)),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(right: 110),
                                    child: SizedBox(
                                      height: 25,
                                      width: 110,
                                      child: LineChart(sampleData(
                                          flSpotList,
                                          green,
                                          Colors.transparent,
                                          maxX,
                                          maxY)),
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
